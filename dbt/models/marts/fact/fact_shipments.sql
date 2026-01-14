with

shipments as (
    select
        shipment_id,
        order_id,
        shipped_date,
        delivery_date,
        carrier
    from {{ ref('stg_shipments') }}
),

carriers as (
    select *
    from {{ ref('dim_carrier') }}
),

dates as (
    select *
    from {{ ref('dim_date') }}
),

fact_shipments as (
    select
        s.shipment_id,
        s.order_id,
        sd.date_sk as shipped_date_sk,
        dd.date_sk as delivery_date_sk,
        c.carrier_sk,
        datediff(
            day,
            s.shipped_date,
            s.delivery_date
        ) as shipping_duration_days
    from shipments s
    left join carriers c on s.carrier = c.carrier
    left join dates sd on s.shipped_date = sd.date_day
    left join dates dd on s.delivery_date = dd.date_day
)

select * from fact_shipments
