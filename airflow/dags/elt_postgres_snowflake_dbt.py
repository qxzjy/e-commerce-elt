import pandas as pd

from airflow.providers.postgres.hooks.postgres import PostgresHook

from airflow.providers.standard.operators.empty import EmptyOperator
from airflow.sdk import dag, task, task_group

from datetime import datetime

import logging
logger = logging.getLogger(__name__)

TABLES = ["customers"]

# schedule="@daily"
@dag(dag_id="elt-postgres-snowflake-dbt", start_date=datetime(2025, 12, 11), schedule=None, catchup=False)
def elt_postgres_snowflake_dbt():
    
    @task
    def _extract_to_parquet(table_name: str, **context: dict) -> None:
        """
        Extract data from a PostgreSQL table and save it as a Parquet file.
        
        This task retrieves all data from a specified PostgreSQL table,
        converts it to a Parquet format, and stores it in the /tmp directory.
        The filename is pushed to XCom for downstream tasks.
        
        :param table_name: str - Name of the PostgreSQL table to extract
        :param context: dict - Airflow task context
        :raises Exception: If database connection fails or data processing errors occur
        
        :returns: None - None
        """
        try:
            postgres_hook = PostgresHook(postgres_conn_id="postgres_default")
            engine = postgres_hook.get_sqlalchemy_engine()
            stmt = f"SELECT * FROM {table_name}"
            
            data = pd.read_sql(stmt, engine)
            data.set_index(data.columns[0], inplace=True)
            
            parquet_file_name = f"{table_name}_{datetime.now().strftime('%Y%m%d-%H%M%S')}.parquet"
            data.to_parquet(f"/tmp/{parquet_file_name}")
            
            context["task_instance"].xcom_push(key="parquet_file_name", value=parquet_file_name)
            
            logger.info(f"Successfully saved parquet file: {parquet_file_name}")
            
            logger.debug(
                    "Variables dump",
                    extra={
                        "stmt": stmt,
                        "data": data.head(1),
                        "parquet_file_name": parquet_file_name
                    }
            )
        except Exception as e:
            logger.error(f"Error extracting data from {table_name}: {str(e)}")
            raise        
        
    @task_group
    def table_group(table_name):
        extract_to_parquet = _extract_to_parquet(table_name)
        
        extract_to_parquet
    
    @task_group(group_id='extract_load')
    def extract_load_group():
        for table_name in TABLES:
            
            table_group.override(group_id=f'{table_name}_table')(table_name)
    
    start = EmptyOperator(task_id='start')
    extract_load = extract_load_group()
    end = EmptyOperator(task_id='end')

    start >> extract_load >> end
    
dag = elt_postgres_snowflake_dbt()