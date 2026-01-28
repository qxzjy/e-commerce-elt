import logging
from datetime import datetime

import pandas as pd
from airflow.providers.google.cloud.hooks.gcs import GCSHook
from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.providers.standard.operators.empty import EmptyOperator
from airflow.sdk import Variable, dag, task, task_group

logger = logging.getLogger(__name__)

TABLES = ["customers", "orders", "order_items", "payments", "products", "shipments"]

# schedule="@daily"
@dag(dag_id="elt-postgres-bigquery-dbt", start_date=datetime(2025, 12, 11), schedule=None, catchup=False)
def elt_postgres_bigquery_dbt():
    
    @task(task_id='extract_to_csv', multiple_outputs=True)
    def _extract_to_csv(table_name: str, **context: dict) -> dict:
        """
        Extract data from a PostgreSQL table and save it as a CSV file.
        
        This task retrieves all data from a specified PostgreSQL table,
        converts it to a CSV format, and stores it in the /tmp directory.
        
        :param table_name: str - Name of the PostgreSQL table to extract
        :param context: dict - Airflow task context
        :raises Exception: If database connection fails or data processing errors occur
        
        :returns: dict - Filename is pushed to XCom for downstream tasks.
        """
        try:
            postgres_hook = PostgresHook(postgres_conn_id="postgres_default")
            engine = postgres_hook.get_sqlalchemy_engine()
            stmt = f"SELECT * FROM {table_name}"
            
            data = pd.read_sql(stmt, engine)
            data.set_index(data.columns[0], inplace=True)
            
            csv_file_name = f"{table_name}_{datetime.now().strftime('%Y%m%d-%H%M%S')}.csv"
            data.to_csv(f"/tmp/{csv_file_name}")
            
            logger.info(f"Successfully saved csv file : {csv_file_name}")
        except Exception as e:
            logger.error(f"Error extracting data from {table_name}: {str(e)}")
            raise
        
        return {"csv_file_name": csv_file_name}
        
    @task(task_id='load_to_gcs', multiple_outputs=True)
    def _load_to_gcs(table_name: str, **context: dict) -> None:
        """
        Load data from a CSV file to a GCS bucket.
        
        This task retrieves all data from a specified CSV file,
        and load it into a GCS bucket.
        
        :param table_name: str - Name of the CSV file to load
        :param context: dict - Airflow task context
        :raises Exception: If database connection fails or data processing errors occur
        
        :returns: None - None
        """
        try:
            csv_file_name = context["task_instance"].xcom_pull(task_ids=f"extract_load.{table_name}_table.extract_to_csv", key="csv_file_name")
        
            gcs_hook = GCSHook(gcp_conn_id="google_cloud_default")
            gcs_hook.upload(bucket_name=Variable.get("GCS_BUCKET_NAME"), object_name=f"raw/{csv_file_name}", filename=f"/tmp/{csv_file_name}")
            
            logger.info(f"Successfully load csv file into GCS : gs://{Variable.get('GCS_BUCKET_NAME')}/raw/{csv_file_name}")
        except Exception as e:
            logger.error(f"Error loading data into GCS from {table_name}: {str(e)}")
            raise
        
    @task_group
    def table_group(table_name: str) -> None:
        """
        Group EL tasks by table.
        
        This task group include all tasks from a specified source table.
        
        :param table_name: str - Name of the source table
        
        :returns: None - None
        """
        extract_to_csv = _extract_to_csv(table_name)
        load_to_gcs = _load_to_gcs(table_name)
        
        load_to_bigquery = GCSToBigQueryOperator(
            task_id = "load_to_bigquery",
            bucket=Variable.get("GCS_BUCKET_NAME"),
            source_objects = [f"raw/{extract_to_csv["csv_file_name"]}"],
            destination_project_dataset_table=f"{Variable.get("BQ_DATASET_RAW")}.{table_name}",
            create_disposition="CREATE_IF_NEEDED",
            write_disposition="WRITE_TRUNCATE",
            source_format="CSV"
        )
        
        extract_to_csv >> load_to_gcs >> load_to_bigquery
    
    @task_group(group_id='extract_load')
    def extract_load_group() -> None:
        """
        Group EL task groups.
        
        This task group include all task groups from the EL part of pipeline.
        
        :returns: None - None
        """
        for table_name in TABLES:
            
            table_group.override(group_id=f'{table_name}_table')(table_name)
            
    start = EmptyOperator(task_id='start')
    extract_load = extract_load_group()
    end = EmptyOperator(task_id='end')

    start >> extract_load >> end
    
dag = elt_postgres_bigquery_dbt()