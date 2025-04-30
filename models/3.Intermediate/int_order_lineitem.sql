{{ config(materialized='table') }}

WITH region_data AS (
    SELECT
        region_key,
        region_name
    FROM {{ ref('stg_region') }}
),
nation_data AS (
    SELECT
        nation_key,
        region_key
    FROM {{ ref('stg_nation') }}
),
customer_data AS (
    SELECT
        customer_key,
        nation_key
    FROM {{ ref('stg_customers') }}
),
orders_data AS (
    SELECT 
        *
    FROM {{ ref('stg_orders') }}
),
lineitem_data AS (
    SELECT 
        *
    FROM {{ ref('stg_lineitem') }}
)

SELECT 
    o.order_key,
    o.customer_key,
    o.order_status,
    o.total_price,
    o.order_date,
    o.order_priority,
    o.clerk,
    o.ship_priority,
    
    l.part_key,
    l.supplier_key,
    l.line_number,
    l.quantity,
    l.extended_price,
    l.discount,
    l.tax,
    l.return_flag,
    l.line_status,
    l.ship_date,
    l.commit_date,
    l.receipt_date,
    l.ship_instruct,
    l.ship_mode,
    l.comment AS lineitem_comment,
    
    r.region_key,
    r.region_name

FROM orders_data o
JOIN lineitem_data l ON o.order_key = l.order_key
JOIN customer_data c ON o.customer_key = c.customer_key
JOIN nation_data n ON c.nation_key = n.nation_key
JOIN region_data r ON n.region_key = r.region_key
