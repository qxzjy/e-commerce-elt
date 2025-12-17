def test_load_dag(dagbag):
    assert "elt-postgres-snowflake-dbt" in dagbag.dags
    assert not dagbag.import_errors