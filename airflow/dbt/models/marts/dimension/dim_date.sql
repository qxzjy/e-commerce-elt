with 

dim_date_raw as (
    {{ dbt_date.get_date_dimension('2024-01-01', '2026-12-31') }}
),

dim_date as (
    select
        {{ dbt_utils.generate_surrogate_key(['date_day']) }} as date_sk,
        dim_date_raw.*
    from dim_date_raw
)

select *
from dim_date