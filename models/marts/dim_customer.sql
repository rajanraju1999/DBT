with customer_data as (
    select
        customer_key,
        customer_name,
        customer_address,
        nation_key,
        customer_phone,
        account_balance,
        market_segment,
        customer_comment
    from {{ ref('stg_customers') }}
)

select *
from customer_data
