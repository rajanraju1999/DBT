 select
          o.order_key,
          o.customer_key,
          c.customer_name,
          c.market_segment,
          o.order_status,
          o.total_price,
          o.order_date,
          l.part_key,
          p.name as part_name,
          p.brand,
          s.supplier_key,
          s.name as supplier_name,
          l.quantity,
          l.extended_price,
          l.discount,
          l.tax
      from {{ ref('dim_orders') }} o
      join {{ ref('dim_customer') }} c on o.customer_key = c.customer_key
      join {{ ref('dim_lineitem') }} l on o.order_key = l.order_key
      join {{ ref('dim_part') }} p on l.part_key = p.part_key
      join {{ ref('dim_supplier') }} s on l.supplier_key = s.supplier_key

