with supplier_data as (
          select
              supplier_key,
              name,
              address,
              nation_key,
              phone,
              account_balance,
              comment
          from {{ ref('stg_supplier') }}
      )
      select *
      from supplier_data