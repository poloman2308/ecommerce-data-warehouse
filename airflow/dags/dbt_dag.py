from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    dag_id='dbt_dag_ecommerce',
    default_args=default_args,
    start_date=datetime(2024, 1, 1),
    schedule_interval='@daily',
    catchup=False,
    tags=['dbt'],
) as dag:
    
    load_csvs = BashOperator(
        task_id='load_csvs',
        bash_command="""
        psql postgresql://airflow:airflow@postgres/airflow -c "\\copy raw_orders FROM '/opt/airflow/data/orders.csv' WITH CSV HEADER;"
        psql postgresql://airflow:airflow@postgres/airflow -c "\\copy raw_customers FROM '/opt/airflow/data/customers.csv' WITH CSV HEADER;"
        psql postgresql://airflow:airflow@postgres/airflow -c "\\copy raw_products FROM '/opt/airflow/data/products.csv' WITH CSV HEADER;"
        psql postgresql://airflow:airflow@postgres/airflow -c "\\copy raw_returns FROM '/opt/airflow/data/returns.csv' WITH CSV HEADER;"
        psql postgresql://airflow:airflow@postgres/airflow -c "\\copy raw_date FROM '/opt/airflow/data/dim_date.csv' WITH CSV HEADER;"
        """
    )

    dbt_source_freshness = BashOperator(
        task_id='dbt_source_freshness',
        bash_command='cd /opt/airflow/dbt_project/ecommerce_dbt && dbt source freshness --profiles-dir /home/airflow/.dbt'
    )

    dbt_build = BashOperator(
        task_id='dbt_build',
        bash_command='cd /opt/airflow/dbt_project/ecommerce_dbt && dbt build --profiles-dir /home/airflow/.dbt --full-refresh'
    )
    
    dbt_docs_generate = BashOperator(
        task_id='dbt_docs_generate',
        bash_command='cd /opt/airflow/dbt_project/ecommerce_dbt && dbt docs generate --profiles-dir /home/airflow/.dbt'
    )

    dbt_docs_serve = BashOperator(
        task_id='dbt_docs_serve',
        bash_command='cd /opt/airflow/dbt_project/ecommerce_dbt && nohup dbt docs serve --profiles-dir /home/airflow/.dbt nohup dbt docs serve --profiles-dir /home/airflow/.dbt --port 8081 --no-browser > /dev/null 2>&1 &'
    )

    load_csvs >> dbt_source_freshness >> dbt_build >> dbt_docs_generate >> dbt_docs_serve
    