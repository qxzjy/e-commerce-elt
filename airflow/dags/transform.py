"""
DAG that enables the transformation of e-commerce data from OLTP model
to an OLAP model within an BigQuery database.
"""
import os

from airflow.providers.standard.operators.empty import EmptyOperator
from airflow.sdk import Variable, dag
from cosmos import DbtTaskGroup, ExecutionConfig, ProfileConfig, ProjectConfig
from cosmos.profiles import GoogleCloudServiceAccountFileProfileMapping

DBT_PROJECT_PATH = f"{os.environ['AIRFLOW_HOME']}/dbt"
DBT_EXECUTABLE_PATH = f"{os.environ['AIRFLOW_HOME']}/dbt_venv/bin/dbt"

profile_config = ProfileConfig(
    profile_name="e_commerce_bigquery",
    target_name="dev",
    profile_mapping=GoogleCloudServiceAccountFileProfileMapping(
        conn_id="google_cloud_default",
        profile_args={"project": "extra.project",
                      "dataset": Variable.get("BQ_DATASET"),
                      "key_file": "extra.key_path"}
    ),
)

execution_config = ExecutionConfig(
    dbt_executable_path=DBT_EXECUTABLE_PATH,
)

@dag(dag_id="transform-bigquery-dbt", schedule=None, catchup=False)
def transform_bigquery_dbt():
    
    start = EmptyOperator(task_id='start')

    transform_data = DbtTaskGroup(
        group_id="transform_data",
        project_config=ProjectConfig(DBT_PROJECT_PATH),
        profile_config=profile_config,
        execution_config=execution_config,
        default_args={"retries": 2},
    )
    
    end = EmptyOperator(task_id='end')

    start >> transform_data >> end

dag = transform_bigquery_dbt()