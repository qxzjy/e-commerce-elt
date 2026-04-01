with

order_items as (
    select *
    from {{ source('bigquery_e_commerce', 'order_items') }}
)

select *
from order_items