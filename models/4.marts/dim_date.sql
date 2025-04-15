{{ config(
    materialized='table'
) }}

WITH raw_dates AS (
    SELECT DATEADD(day, SEQ4(), '1992-01-01') AS date_day
    FROM TABLE(GENERATOR(ROWCOUNT => 10000))
),

dates AS (
    SELECT
        date_day,
        YEAR(date_day) AS year,
        MONTH(date_day) AS month,
        DAY(date_day) AS day,
        DAYOFWEEK(date_day) AS day_of_week,
        CASE 
            WHEN DAYOFWEEK(date_day) IN (6, 7) THEN TRUE 
            ELSE FALSE 
        END AS is_weekend
    FROM raw_dates
)

SELECT * 
FROM dates
