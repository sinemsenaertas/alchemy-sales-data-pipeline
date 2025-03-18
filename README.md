

# Project: Data Processing with AWS


## **Run Load Data to s3 Script Locally**

To run the script locally, follow these steps:

For loading CSV data into S3:
python upload_to_s3.py

- **Required Python packages** (listed in `requirements.txt`)

```bash
pip install -r requirements.txt
```

## **How the scripts would be scheduled and run on AWS**



The Glue job will insert data into the specified schema and table within Redshift, using the dbtable option in the Glue script.

Add the Pre-SQL (pipeline\ddl\all_schema.sql) in the Glue job settings before the Glue job runs the ETL process.

This approach enables the database schema is explicitly considered in both the table creation and the data loading process.

Run or schedule the Glue job to process all CSV files in the S3 folde at specific times (based on the requirement).