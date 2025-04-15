{{ config(materialized='ephemeral') }}

select
    s.supplier_key,
    s.name as supplier_name,
    s.address,
    s.phone,
    n.nation_name,
    r.region_name
from {{ ref('stg_supplier') }} s
left join {{ ref('stg_nation') }} n on s.nation_key = n.nation_key
left join {{ ref('stg_region') }} r on n.region_key = r.region_key

 
