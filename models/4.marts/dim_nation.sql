{{ config(materialized='table') }}


with nation_data as (
select
    nation_key,
    nation_name,
    region_key
from {{ ref('stg_nation') }}
)

Select * 
from nation_data
