{{ config(materialized='table') }}

-- Unioning All Tables
WITH staging_data AS (

    -- SELECT *
    -- FROM {{ source('pc4_devanis', 'yellowtrip_201901') }}
    -- UNION ALL 
    SELECT *
    FROM {{ source('pc4_devanis', 'yellowtrip_201902') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201903') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201904') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201905') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201906') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201907') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201908') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201909') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201910') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201911') }}
    UNION ALL 
    SELECT * 
    FROM {{ source('pc4_devanis', 'yellowtrip_201912') }}
    
)

SELECT 

    cast(tpep_pickup_datetime as timestamp) as pickup_datetime,
    cast(tpep_dropoff_datetime as timestamp) as dropoff_datetime,
    cast(passenger_count as integer) as passenger_count,
    cast(trip_distance as numeric) as trip_distance,
    cast(PULocationID as integer) as  pickup_locationid,
    cast(DOLocationID as integer) as dropoff_locationid,
    cast(fare_amount as numeric) as fare_amount,
    cast(extra as numeric) as extra,
    cast(mta_tax as numeric) as mta_tax,
    cast(tip_amount as numeric) as tip_amount,
    cast(tolls_amount as numeric) as tolls_amount,
    cast(improvement_surcharge as numeric) as improvement_surcharge,

    {{ decode_payment('payment_type') }} as payment_type,
    {{ decode_ratecode('RatecodeID') }} as rate_code,
    {{ decode_vendor('VendorID') }} as vendor,
    {{ dollar_to_idr('total_amount') }} as total_amount,    
    {{ create_extra_type('extra') }} as extra_type,
    {{ handling_type__congestion_surcharge('congestion_surcharge') }} as congestion_surcharge,

FROM staging_data
WHERE DATETIME(tpep_pickup_datetime) BETWEEN 
DATETIME("2019-01-01 00:00:00") AND DATETIME("2020-01-01 00:00:00")
ORDER BY tpep_pickup_datetime ASC