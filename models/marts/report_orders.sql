select
          customer_key,
          customer_name,
          market_segment,
          sum(total_price) as total_revenue,
          count(distinct order_key) as total_orders,
          sum(quantity) as total_quantity,
          sum(extended_price) as total_extended_price,
          sum(discount) as total_discount,
          sum(tax) as total_tax
      from {{ ref('fact_orders') }}
      group by customer_key, customer_name, market_segment
