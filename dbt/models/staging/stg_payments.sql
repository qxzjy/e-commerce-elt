with

payments as (
    select *
    from {{ source('snowflake_e_commerce', 'payments') }}
),

payments_staged as (
    select
        payment_id,
        order_id,
        amount,
        payment_method,
        case
            when payment_method = 'bank_transfer' then 'delayed'
            else 'instant'
        end as payment_method_type,
        payment_date::date as payment_date
    from payments
)

select *
from payments_staged