{{ config(
    materialized='incremental',
    unique_key='order_id',
    incremental_strategy='merge'
) }}

WITH source_data AS (
    SELECT
        order_id,
        product_id,
        quantity,
        total_price,
        order_date
    FROM {{ source('dbt_demo_sources', 'sales_data') }}
    {% if is_incremental() %}
        -- For incremental runs, fetch only new or changed records (based on `order_date` or another relevant column)
        WHERE order_date > (SELECT MAX(order_date) FROM {{ this }})
    {% endif %}
)

-- Select all the data for insertion or update based on the `unique_key`
SELECT 
    order_id,
    product_id,
    quantity,
    total_price,
    order_date
FROM source_data
