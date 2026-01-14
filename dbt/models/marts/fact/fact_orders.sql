with

orders as (
    select *
    from {{ ref('int_orders_aggregated') }}
),

customers as (
    select *
    from {{ ref('dim_customers') }}
),

dates as (
    select *
    from {{ ref('dim_date') }}
),

fact_orders as (
    select
        o.order_id,
        d.date_sk as order_date_sk,
        c.customer_sk,
        o.order_status,
        o.total_quantity,
        o.order_total_amount
    from orders o
    left join customers c on o.customer_id = c.customer_id
       and o.order_date >= c.valid_from
       and (o.order_date < c.valid_to or c.valid_to is null)
    left join dates d on o.order_date = d.date_day
)

select * from fact_orders
