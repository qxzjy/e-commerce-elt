with

order_items as (
    select *
    from {{ ref('int_order_items_enriched') }}
),

customers as (
    select *
    from {{ ref('dim_customers') }}
),

products as (
    select *
    from {{ ref('dim_products') }}
),

dates as (
    select *
    from {{ ref('dim_date') }}
),

fact_order_items as (
    select
        {{ dbt_utils.generate_surrogate_key(['oi.order_id', 'oi.product_id']) }} as order_item_sk,
        oi.order_id,
        d.date_sk as order_date_sk,
        c.customer_sk,
        p.product_sk,
        oi.order_status,
        oi.quantity,
        oi.unit_price,
        oi.gross_amount
    from order_items oi
    left join customers c on oi.customer_id = c.customer_id
       and oi.order_date >= c.valid_from
       and (oi.order_date < c.valid_to or c.valid_to is null)
    left join products p on oi.product_id = p.product_id
    left join dates d on oi.order_date = d.date_day
)

select * from fact_order_items