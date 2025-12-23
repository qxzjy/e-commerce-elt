SELECT
    shipment_id,
    order_id,
    shipped_date,
    delivery_date,
    carrier
FROM {{ source('snowflake_e_commerce', 'shipments') }}