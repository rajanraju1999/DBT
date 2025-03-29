with customer_source_data as (
    select
        C_CUSTKEY as customer_key,
        C_NAME as customer_name,
        C_ADDRESS as customer_address,
        C_NATIONKEY as nation_key,
        C_PHONE as customer_phone,
        C_ACCTBAL as account_balance,
        C_MKTSEGMENT as market_segment,
        C_COMMENT as customer_comment
    from {{ source('tpch_sf1000', 'customer') }}
)

select *
from customer_source_data