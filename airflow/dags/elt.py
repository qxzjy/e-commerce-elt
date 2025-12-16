import pandas as pd

from airflow.providers.postgres.hooks.postgres import PostgresHook

# from airflow.models import Variable
from airflow.providers.standard.operators.empty import EmptyOperator
# from airflow.operators.python_operator import PythonOperator
from airflow.sdk import dag, task, task_group

from datetime import datetime

import logging
logger = logging.getLogger(__name__)

TABLES = ["customers"]

# schedule="@daily"
@dag(start_date=datetime(2025, 12, 11), schedule=None, catchup=False)
def elt():
    
    @task
    def _extract_to_parquet(table_name):
        logger.info(f"_extract_to_parquet : {table_name}")
            
    @task
    def _load_to_s3(table_name):
        logger.info(f"_load_to_s3 : {table_name}")
        
    @task_group
    def table_group(table_name):
        extract_to_parquet = _extract_to_parquet(table_name)
        load_to_s3 = _load_to_s3(table_name)
        
        extract_to_parquet >> load_to_s3
    
    @task_group(group_id='extract_load')
    def extract_load_group():
        for table_name in TABLES:
            
            table_group.override(group_id=f'{table_name}_table')(table_name)
    
    start = EmptyOperator(task_id='start')
    extract_load = extract_load_group()
    end = EmptyOperator(task_id='end')

    start >> extract_load >> end
    
dag = elt()