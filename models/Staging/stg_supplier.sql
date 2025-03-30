with supplier_source_data as (
          select
              S_SUPPKEY as supplier_key,
              S_NAME as name,
              S_ADDRESS as address,
              S_NATIONKEY as nation_key,
              S_PHONE as phone,
              S_ACCTBAL as account_balance,
              S_COMMENT as comment
          from {{ source('tpch_sf1000', 'supplier') }}
      )
      select *
      from supplier_source_data
