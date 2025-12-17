FROM apache/airflow:3.1.3

COPY README.md pyproject.toml ./

RUN pip install -e .
