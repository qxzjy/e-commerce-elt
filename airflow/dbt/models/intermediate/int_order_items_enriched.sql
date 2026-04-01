with

order_items as (
    select
        item_id,
        order_id,
        product_id,
        quantity
    from {{ ref('stg_order_items') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_date,
        status as order_status
    from {{ ref('stg_orders') }}
),

products as (
    select
        product_id,
        price as unit_price
    from {{ ref('stg_products') }}
),

order_items_enriched as (
    select
        oi.item_id as order_item_id,
        oi.order_id,
        o.customer_id,
        oi.product_id,
        o.order_date,
        o.order_status,
        oi.quantity,
        p.unit_price,
        oi.quantity * p.unit_price as gross_amount
    from order_items oi
    left join orders o on oi.order_id = o.order_id
    left join products p on oi.product_id = p.product_id
)

select * from order_items_enriched