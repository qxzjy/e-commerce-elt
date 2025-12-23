with

products as (
    select *
    from {{ source('snowflake_e_commerce', 'products') }}
),

products_staged as (
    select
        product_id,
        name,
        price,
        case
            when price <= 75 then '0 - 75'
            when price <= 150 then '75 - 150'
            else '+150'
        end as price_range,
        category
    from products
)

select *
from products_staged