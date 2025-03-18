import boto3
import os

# Configuration
BUCKET_NAME = "alchemy-data-sse"  # S3 bucket name
S3_PREFIX = "sales-data/"  # Folder in S3
LOCAL_DATA_FOLDER = "pipeline\data"  # Folder containing CSV files

s3_client = boto3.client("s3")

def upload_files():
    """Uploads all CSV files from the local folder to S3"""
    files = [f for f in os.listdir(LOCAL_DATA_FOLDER) if f.endswith('.csv')]

    print(files)
    
    if not files:
        print("No CSV files found to upload.")
        return

    for file_path in files:
        file_name = os.path.basename(file_path)
        s3_key = f"{S3_PREFIX}{file_name}"  # S3 path

        try:
            s3_client.upload_file(file_path, BUCKET_NAME, s3_key)
            print(f"Uploaded: {file_name} file to s3://{BUCKET_NAME}/{s3_key}")
        except Exception as e:
            print(f"Error uploading {file_name}: {e}")

if __name__ == "__main__":
    upload_files()
