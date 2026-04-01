with

orders as (
    select
        order_id,
        customer_id,
        order_date,
        status as order_status
    from {{ ref('stg_orders') }}
),

order_items as (
    select
        order_id,
        quantity,
        gross_amount
    from {{ ref('int_order_items_enriched') }}

),

orders_aggregated as (
    select
        o.order_id,
        o.customer_id,
        o.order_date,
        o.order_status,
        count(*) as total_line_items,
        sum(oi.quantity) as total_quantity,
        sum(oi.gross_amount) as order_total_amount
    from orders o
    left join order_items oi on o.order_id = oi.order_id
    group by
        o.order_id,
        o.customer_id,
        o.order_date,
        o.order_status
)

select * from orders_aggregated
