with

payments as (
    select distinct payment_method
    from {{ ref('stg_payments') }}
),

dim_payment_method as (
    select
        {{ dbt_utils.generate_surrogate_key(['payment_method']) }} as payment_method_sk,
        payment_method
    from payments
)

select *
from dim_payment_method