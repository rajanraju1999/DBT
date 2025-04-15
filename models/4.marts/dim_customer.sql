{{ config(materialized='table') }}


with customer_data as (

select
    customer_key,
    customer_name,
    customer_address,
    customer_phone,
    market_segment,
    nation_name,
    region_name
from {{ ref('int_customer_with_nation') }}
)


select *
from customer_data




