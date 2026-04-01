with

orders as (
    select *
    from {{ source('bigquery_e_commerce', 'orders') }}
),

stg_orders as (
    select
        order_id,
        customer_id,
        cast(order_date as date) as order_date,
        status,
        case
            when status = 'completed' then true
            else false
        end as is_completed_order
    from orders
)

select *
from stg_orders