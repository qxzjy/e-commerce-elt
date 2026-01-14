with

payments as (
    select
        payment_id,
        order_id,
        amount,
        payment_method,
        payment_date
    from {{ ref('stg_payments') }}
),

orders as (
    select
        order_id,
        customer_id,
        order_date
    from {{ ref('stg_orders') }}
),

customers as (
    select *
    from {{ ref('dim_customers') }}
),

payment_methods as (
    select *
    from {{ ref('dim_payment_method') }}
),

dates as (
    select *
    from {{ ref('dim_date') }}
),

fact_payments as (
    select
        p.payment_id,
        p.order_id,
        d.date_sk as payment_date_sk,
        c.customer_sk,
        pm.payment_method_sk,
        p.amount as payment_amount
    from payments p
    left join orders o on p.order_id = o.order_id
    left join customers c on o.customer_id = c.customer_id
       and p.payment_date >= c.valid_from
       and (p.payment_date < c.valid_to or c.valid_to is null)
    left join payment_methods pm on p.payment_method = pm.payment_method
    left join dates d on p.payment_date = d.date_day
)

select * from fact_payments
