-- models/intermediate/int_order_lineitem_join.sql
{{ config(materialized='ephemeral') }}


WITH orders_data AS (
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
    l.comment AS lineitem_comment
FROM orders_data o
JOIN lineitem_data l ON o.order_key = l.order_key
