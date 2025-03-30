 with lineitem_data as (
          select
              order_key,
              part_key,
              supplier_key,
              line_number,
              quantity,
              extended_price,
              discount,
              tax,
              return_flag,
              line_status,
              ship_date,
              commit_date,
              receipt_date,
              ship_instruct,
              ship_mode,
              comment
          from {{ ref('stg_lineitem') }}
      )
      select *
      from lineitem_data