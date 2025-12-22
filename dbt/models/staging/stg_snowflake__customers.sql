SELECT
    customer_id,
    first_name,
    last_name,
    email,
    subscription_plan,
    created_at
FROM {{ source('snowflake_e_commerce', 'customers') }}