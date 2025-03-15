import os
import sys
from datetime import datetime
from airflow import DAG
from airflow.operators.python import PythonOperator
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))

from pipelines.BankLoanairflow import extract_github_data, transform_github_data, write_transformed_data

dag = DAG(
    dag_id='BankLoan_flow',
    default_args={
        "owner": "Punam Adhikari",
        "start_date": datetime(2025, 3, 15),
    },
    schedule_interval="@daily",
    catchup=False
)

extract_data_from_github = PythonOperator(
    task_id="extract_data_from_github",
    python_callable=extract_github_data,
    provide_context=True,
    op_kwargs={"url": "https://raw.githubusercontent.com/Punam918/BankLoanInsights/refs/heads/master/Data/financial_loan.csv"},
    dag=dag
)

transform_github_data = PythonOperator(
    task_id='transform_github_data',
    provide_context=True,
    python_callable=transform_github_data,
    dag=dag
)

write_transformed_data = PythonOperator(
    task_id='write_transformed_data',
    provide_context=True,
    python_callable=write_transformed_data,
    dag=dag
)

extract_data_from_github >> transform_github_data >> write_transformed_data