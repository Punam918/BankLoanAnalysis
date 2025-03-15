import pandas as pd
import requests
import io

def extract_github_data(url, **kwargs):
    """Extracts data from a given GitHub raw CSV URL."""
    response = requests.get(url)
    if response.status_code == 200:
        df = pd.read_csv(io.StringIO(response.text))
        kwargs['ti'].xcom_push(key='raw_data', value=df.to_json())
        print("Data extraction successful.")
    else:
        raise Exception(f"Failed to fetch data. Status code: {response.status_code}")


def transform_github_data(**kwargs):
    """Transforms the extracted data."""
    ti = kwargs['ti']
    raw_data_json = ti.xcom_pull(task_ids='extract_data_from_github', key='raw_data')
    df = pd.read_json(raw_data_json)
    
    # Example transformation: Remove null values and convert column names to lowercase
    df = df.dropna()
    df.columns = df.columns.str.lower()
    
    ti.xcom_push(key='transformed_data', value=df.to_json())
    print("Data transformation successful.")


def write_transformed_data(**kwargs):
    """Writes the transformed data to a CSV file."""
    ti = kwargs['ti']
    transformed_data_json = ti.xcom_pull(task_ids='transform_github_data', key='transformed_data')
    df = pd.read_json(transformed_data_json)
    
    output_path = "/opt/airflow/dags/transformed_data.csv"
    df.to_csv(output_path, index=False)
    print(f"Transformed data written to {output_path}")