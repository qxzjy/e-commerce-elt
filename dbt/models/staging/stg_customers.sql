with

customers as (
    select *
    from {{ source('snowflake_e_commerce', 'customers') }}
),

customers_staged as (
    select
        customer_id,
        subscription_plan
    from customers
)

select *
from customers_staged