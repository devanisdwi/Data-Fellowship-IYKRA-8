{{ config(materialized='table') }}

WITH location_stg AS(
    SELECT
    LocationId,
    Borough
    FROM {{ ref('taxi_zone_lookup') }}
)

SELECT 
    *
FROM 
    location_stg

