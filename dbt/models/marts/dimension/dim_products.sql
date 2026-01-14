with

products as (
    select *
    from {{ ref('stg_products') }}
),

dim_products as (
    select
        {{ dbt_utils.generate_surrogate_key(['product_id']) }} as product_sk,
        product_id,
        name,
        category,
        price,
        price_range
    from products
)

select *
from dim_products