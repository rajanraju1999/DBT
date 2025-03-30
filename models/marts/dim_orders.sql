with orders_data as (
          select
              order_key,
              customer_key,
              order_status,
              total_price,
              order_date,
              order_priority,
              clerk,
              ship_priority,
              comment
          from {{ ref('stg_orders') }}
      )
      select *
      from orders_data