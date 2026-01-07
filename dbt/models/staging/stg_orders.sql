with

orders as (
    select *
    from {{ source('snowflake_e_commerce', 'orders') }}
),

orders_staged as (
    select
        order_id,
        customer_id,
        order_date::date as order_date,
        status,
        case
            when status = 'completed' then true
            else false
        end as is_completed_order
    from orders
)

select *
from orders_staged