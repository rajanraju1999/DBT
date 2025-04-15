{{ config(materialized='table') }}


with region_data as (
    select
        region_key,
        region_name
    from {{ ref('stg_region') }}
)

Select * 
from region_data
