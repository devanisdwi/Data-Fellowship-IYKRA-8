WITH ratecode_stg AS(
    SELECT DISTINCT 
        rate_code
    FROM {{ ref('stg__yellowtrip_2019') }}
)

SELECT 
    rate_code,
FROM 
    ratecode_stg
ORDER BY
    rate_code ASC