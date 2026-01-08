with

customers as (
    select *
    from {{ source('snowflake_e_commerce', 'customers') }}
),

stg_customers as (
    select
        customer_id,
        subscription_plan
    from customers
)

select *
from stg_customers