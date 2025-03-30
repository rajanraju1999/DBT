  with part_data as (
          select
              part_key,
              name,
              manufacturer,
              brand,
              type,
              size,
              container,
              retail_price
          from {{ ref('stg_part') }}
      )
      select *
      from part_data