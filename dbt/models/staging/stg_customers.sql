with

customers as (
    select *
    from {{ source('snowflake_e_commerce', 'customers') }}
),

stg_customers as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        subscription_plan,
        created_at::date as created_at,
        case
            when current_date - created_at::date > 730 then True
            else False
        end as is_old_client
    from customers
)

select *
from stg_customers