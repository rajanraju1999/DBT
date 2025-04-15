{{ config(materialized='view') }}

with
    customer_source_data as (
select
    c_custkey as customer_key,
    c_name as customer_name,
    c_address as customer_address,
    c_nationkey as nation_key,
    c_phone as customer_phone,
    c_acctbal as account_balance,
    c_mktsegment as market_segment,
    c_comment as customer_comment
from {{ source("tpch_sf1", "customer") }}
)
select *
from customer_source_data