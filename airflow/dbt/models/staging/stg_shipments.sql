with

shipments as (
    select *
    from {{ source('bigquery_e_commerce', 'shipments') }}
),

stg_shipments as (
    select
        shipment_id,
        order_id,
        cast(shipped_date as date) as shipped_date,
        cast(delivery_date as date) as delivery_date,
        carrier
    from shipments
)

select *
from stg_shipments