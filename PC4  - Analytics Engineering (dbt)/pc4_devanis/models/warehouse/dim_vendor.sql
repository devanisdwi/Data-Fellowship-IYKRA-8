WITH vendor_stg AS(
    SELECT DISTINCT 
        vendor
    FROM {{ ref('stg__yellowtrip_2019') }}
)

SELECT 
    vendor,
FROM 
    vendor_stg
ORDER BY
    vendor ASC