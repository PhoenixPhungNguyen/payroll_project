{% set s3_bucket = 's3://payroll-project/' %}
{% set processed_file_path = params["processed_file_path"] %}
{% set raw_name = processed_file_path.split('/')[-1].split('.')[0] %}
{% set table_name = "LND_" ~ raw_name.upper() %}
{% set full_s3_path = processed_file_path %}

COPY INTO {{ table_name }}
FROM '{{ full_s3_path }}'
FILE_FORMAT = (TYPE = 'PARQUET')
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE
STORAGE_INTEGRATION = s3_payroll;