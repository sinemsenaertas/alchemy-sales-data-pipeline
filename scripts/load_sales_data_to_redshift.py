import sys
from awsglue.context import GlueContext
from pyspark.context import SparkContext
import boto3

# Initialize GlueContext and SparkContext
sc = SparkContext()
glueContext = GlueContext(sc)

# Define Glue Catalog Database and Table
database_name = "sales_db"  # Glue Database name
table_name = "sales_data"   # Glue Table name

# Read data from Glue Catalog (all CSV files in the S3 folder)
datasource = glueContext.create_dynamic_frame.from_catalog(
    database=database_name,
    table_name=table_name
)

# Define Redshift connection options
redshift_options = {
    "url": "jdbc:redshift://cluster-name.region.redshift.amazonaws.com:5439/database",
    "user": "redshift_user",
    "password": "redshift_password",
    "dbtable": "sales_schema.sales_data",  # Target table in Redshift that applied database schema (can be changed with loaded table)
    "redshiftTmpDir": "s3://temp-dir/"  # Temporary directory for intermediate data
}

# Write data into Redshift
glueContext.write_dynamic_frame.from_options(
    frame=datasource,
    connection_type="redshift",
    connection_options=redshift_options,
    transformation_ctx="datasink"
)

print("Data successfully loaded into Redshift")
