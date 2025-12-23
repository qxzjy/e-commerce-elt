SELECT
    product_id,
    name,
    price,
    category
FROM {{ source('snowflake_e_commerce', 'products') }}