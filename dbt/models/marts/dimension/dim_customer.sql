with

customers as (
    select *
    from {{ ref('customers_snapshot') }}
),

dim_customer as (
    select
        {{ dbt_utils.generate_surrogate_key(['customer_id', 'dbt_valid_from']) }} as customer_sk,
        customer_id,
        first_name,
        last_name,
        email,
        subscription_plan,
        created_at,
        is_old_client,
        dbt_valid_from  as valid_from,
        dbt_valid_to    as valid_to,
        dbt_valid_to is null as is_current
    from customers
)

select *
from dim_customer