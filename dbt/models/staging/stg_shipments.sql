with

shipments as (
    select *
    from {{ source('snowflake_e_commerce', 'shipments') }}
),

stg_shipments as (
    select
        shipment_id,
        order_id,
        shipped_date::date as shipped_date,
        delivery_date::date as delivery_date,
        carrier
    from shipments
)

select *
from stg_shipments