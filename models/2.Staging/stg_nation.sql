{{ config(materialized='view') }}


with nation_source_data as (
select
    n_nationkey as nation_key,
    n_name as nation_name,
    n_regionkey as region_key
from {{ source("tpch_sf1", "nation") }}
)

Select * 
From nation_source_data