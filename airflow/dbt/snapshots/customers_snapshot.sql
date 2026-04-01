{% snapshot customers_snapshot %}

{{
    config(
        target_schema='snapshots',
        unique_key='customer_id',
        strategy='check',
        check_cols=[
            'first_name',
            'last_name',
            'email',
            'subscription_plan',
            'is_old_client'
        ]
    )
}}

select
    customer_id,
    first_name,
    last_name,
    email,
    subscription_plan,
    created_at,
    is_old_client
from {{ ref('stg_customers') }}

{% endsnapshot %}
