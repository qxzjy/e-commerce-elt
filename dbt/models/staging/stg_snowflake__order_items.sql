SELECT
    item_id,
    order_id,
    product_id,
    quantity
FROM {{ source('snowflake_e_commerce', 'order_items') }}