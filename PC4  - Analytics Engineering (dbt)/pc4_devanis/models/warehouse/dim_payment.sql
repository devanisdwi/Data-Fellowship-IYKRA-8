WITH payment_stg AS(
    SELECT DISTINCT 
        payment_type
    FROM {{ ref('stg__yellowtrip_2019') }}
)

SELECT 
    payment_type,
FROM 
    payment_stg
ORDER BY
    payment_type ASC