with

customers as (
    select *
    from {{ source('bigquery_e_commerce', 'customers') }}
),

stg_customers as (
    select
        customer_id,
        first_name,
        last_name,
        email,
        subscription_plan,
        cast(created_at as date) as created_at,
        case
            when date_diff(current_date(), cast(created_at as date), day) > 730 then true
            else false
        end as is_old_client
    from customers
)

select *
from stg_customers