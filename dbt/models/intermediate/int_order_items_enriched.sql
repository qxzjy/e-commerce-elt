with

order_items as (
    select * from {{ ref('stg_order_items') }}
),

products as (
    select * from {{ ref('stg_products') }}
),

order_items_enriched as (
    select
        o.item_id,
        o.order_id,
        p.product_id,
        p.name as product_name,
        p.category as product_category,
        o.quantity,
        p.price as product_unit_price,
        o.quantity * p.price as total_price
    from order_items o
    left join products p on o.product_id = p.product_id
)

select * from order_items_enriched
