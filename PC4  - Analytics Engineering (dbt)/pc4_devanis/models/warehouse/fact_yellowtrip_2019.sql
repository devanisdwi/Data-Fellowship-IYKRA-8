{{ config(materialized='table') }}

with facts_data as (
    select * from {{ ref('stg__yellowtrip_2019') }}
)
    select 
    *
    EXCEPT(payment_type, rate_code, vendor)

    FROM  facts_data
