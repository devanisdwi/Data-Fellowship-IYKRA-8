{{ config(materialized='table') }}

WITH fact_db AS ( 
    SELECT
        facts_data.*,
        pl.Borough AS pickup_location,
        dl.Borough AS dropoff_location,
    FROM {{ ref('stg__yellowtrip_2019') }} facts_data
    INNER JOIN {{ ref('dim_location') }} pl
    ON facts_data.pickup_locationid = pl.LocationId
    INNER JOIN {{ ref('dim_location') }} dl
    ON facts_data.dropoff_locationid = dl.LocationId
)

SELECT * FROM fact_db