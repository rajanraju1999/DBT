 {{ config(materialized='table') }}

with supplier_data as (
    select
        supplier_key,
        supplier_name,
        address,
        phone,
        nation_name,
        region_name
    from {{ ref('int_supplier_with_nation') }}
)

select *
from supplier_data



