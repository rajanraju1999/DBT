 with part_source_data as (
          select
              P_PARTKEY as part_key,
              P_NAME as name,
              P_MFGR as manufacturer,
              P_BRAND as brand,
              P_TYPE as type,
              P_SIZE as size,
              P_CONTAINER as container,
              P_RETAILPRICE as retail_price
          from {{ source('tpch_sf1', 'part') }}
      )
      select *
      from part_source_data