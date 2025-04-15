{{ config(materialized='view') }}


with supplier_source_data as (
    select
        s_suppkey as supplier_key,
        s_name as name,
        s_address as address,
        s_nationkey as nation_key,
        s_phone as phone,
        s_acctbal as account_balance,
        s_comment as comment
    from {{ source('tpch_sf1', 'supplier') }}
)
      
select *
from supplier_source_data