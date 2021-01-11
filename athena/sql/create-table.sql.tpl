CREATE EXTERNAL TABLE IF NOT EXISTS ${athena_database_name}.${athena_table_name} (
    `level` string,
    `msg` string,
    `name` struct<`first`:string, `last`:string>,
    `time` string
)
PARTITIONED BY (`orderdate` string)
ROW FORMAT SERDE 'org.openx.data.jsonserde.JsonSerDe'
WITH SERDEPROPERTIES (
    'serialization.format' = '1'
)
LOCATION 's3://${log_bucket_name}/logs/'
TBLPROPERTIES (
    'projection.enabled' = 'true',
    'projection.orderdate.type' = 'date',
    'projection.orderdate.range' = '2020/01/10,NOW',
    'projection.orderdate.format' = 'yyyy/MM/dd',
    'projection.orderdate.interval' = '1',
    'projection.orderdate.interval.unit' = 'DAYS',
    'storage.location.template' = 's3://${log_bucket_name}/logs/$${orderdate}'
);
