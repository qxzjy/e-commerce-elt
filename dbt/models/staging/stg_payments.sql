with

payments as (
    select *
    from {{ source('bigquery_e_commerce', 'payments') }}
),

stg_payments as (
    select
        payment_id,
        order_id,
        amount,
        payment_method,
        case
            when payment_method = 'bank_transfer' then 'delayed'
            else 'instant'
        end as payment_method_type,
        cast(payment_date as date) as payment_date
    from payments
)

select *
from stg_payments