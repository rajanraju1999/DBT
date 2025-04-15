{{ config(materialized='table') }}

SELECT
    ol.order_key,
    ol.customer_key,
    ol.order_date,
    ol.part_key,
    ol.supplier_key,
    ol.quantity,
    ol.extended_price,
    ol.discount,
    ol.tax,
    ol.ship_date,
    ol.commit_date,
    ol.receipt_date
FROM {{ ref('int_order_lineitem') }} ol


