with orders as (
  select * from {{ ref('stg_orders') }}
)
select
  *
from
  orders
where
  total_price < 0