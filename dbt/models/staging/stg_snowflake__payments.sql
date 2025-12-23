SELECT
    payment_id,
    order_id,
    amount,
    payment_method,
    payment_date
FROM {{ source('snowflake_e_commerce', 'payments') }}