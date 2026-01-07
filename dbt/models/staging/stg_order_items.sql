with

order_items as (
    select *
    from {{ source('snowflake_e_commerce', 'order_items') }}
)

select *
from order_items