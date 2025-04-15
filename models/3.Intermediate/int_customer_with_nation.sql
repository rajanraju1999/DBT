{{ config(materialized='ephemeral') }}

select
    c.customer_key,
    c.customer_name,
    c.customer_address,
    c.customer_phone,
    c.market_segment,
    n.nation_name,
    r.region_name
from {{ ref('stg_customers') }} c
left join {{ ref('stg_nation') }} n on c.nation_key = n.nation_key
left join {{ ref('stg_region') }} r on n.region_key = r.region_key