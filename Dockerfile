FROM apache/airflow:3.1.3

COPY README.md pyproject.toml ./

RUN pip install -e .

RUN python -m venv dbt_venv && source dbt_venv/bin/activate && \
pip install --no-cache-dir dbt-bigquery && deactivate