with

shipments as (
    select distinct carrier
    from {{ ref('stg_shipments') }}
),

dim_carrier as (
    select
        {{ dbt_utils.generate_surrogate_key(['carrier']) }} as carrier_sk,
        carrier
    from shipments
)

select *
from dim_carrier