create SOURCE CONNECTOR study_source with (
    'connector.class'                           = 'io.debezium.connector.postgresql.PostgresConnector',
    'database.port'                             = '5432',
    'database.hostname'                         = 'postgres',
    'database.dbname'                           = 'db_postgres',
    'database.user'                             = 'postgres_u',
    'database.password'                         = 'postpass',
    'database.server.name'                      = 'db_postgres',
    'database.whitelist'                        = 'db_postgres',
    'topic.prefix'                              = 'psql_connect01',
    'table.include.list'                        = 'db_postgres.practicum_report',
    'database.history.kafka.bootstrap.servers'  = 'broker:9092',
    'database.history.kafka.topic'              = 'schema-changes.db_postgres',
    'key.converter'                             = 'org.apache.kafka.connect.storage.StringConverter',
    'value.converter'                           = 'io.confluent.connect.avro.AvroConverter',
    'key.converter.schemas.enable'              = 'false',
    'value.converter.schemas.enable'            = 'true',
    'value.converter.schema.registry.url'       = 'http://schema-registry:8081'
);

create table practicum_report (
    id int primary key,
	nim varchar(7),
    student_name varchar(50),
	modules varchar(15),
    score float,
    assistant varchar(50)
);

insert into practicum_report values 
    (1, '201901', 'Ayana', 'kafka', 81, 'dwi'),
    (2, '201902', 'Azmi', 'dbt', 70, 'dwi'),
    (3, '201903', 'Briana', 'spark', 76, 'dwi'),
    (4, '201904', 'Boby', 'python', 70, 'dwi'),
    (5, '201905', 'Cantika', 'python', 60, 'devanis'),
    (6, '201906', 'Citrus', 'python', 90, 'devanis'),
    (7, '201907', 'Diana', 'docker', 95, 'farli'),
    (8, '201908', 'Dion', 'spark', 80, 'devanis'),
    (9, '201909', 'Elika', 'dbt', 92, 'farli'),
    (10, '201910', 'Eywa', 'dbt', 91, 'devanis'),
    (11, '201911', 'Fama', 'dbt', 93, 'farli'),
    (12, '201912', 'Fajar', 'bigquery', 40, 'devanis'),
    (13, '201913', 'Gaia', 'kafka', 50, 'farli'),
    (14, '201914', 'Gipo', 'kafka', 70, 'farli'),
    (15, '201914', 'Haya', 'bigquery', 80, 'farli');

create stream stream_table (
    id int key,
	nim varchar(7),
    student_name varchar(50),
	modules varchar(15),
    score double,
    assistant varchar(50)) 
    with (kafka_topic='psql_connect1_practicum_report', value_format='json', partitions=1
);

create table ksql_table as
    select
        modules, 
        avg(score) as avg_score,
    from stream_table
    group by 
        modules
    emit changes;

select * from ksql_table where score > 50;