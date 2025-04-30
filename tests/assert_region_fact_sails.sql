WITH original_counts AS (
    SELECT 
        region_name,
        COUNT(*) AS original_count
    FROM {{ ref('fact_sales') }}
    GROUP BY region_name
),

fact_counts AS (
    SELECT 'ASIA' AS region_name, COUNT(*) AS fact_count
    FROM {{ ref('fact_sales_asia') }}

    UNION ALL

    SELECT 'EUROPE', COUNT(*)
    FROM {{ ref('fact_sales_europe') }}

    UNION ALL

    SELECT 'MIDDLE EAST', COUNT(*)
    FROM {{ ref('fact_sales_middle_east') }}

    UNION ALL

    SELECT 'AMERICA', COUNT(*)
    FROM {{ ref('fact_sales_america') }}

    UNION ALL

    SELECT 'AFRICA', COUNT(*)
    FROM {{ ref('fact_sales_africa') }}
),

validation AS (
    SELECT 
        o.region_name,
        o.original_count,
        f.fact_count,
        CASE 
            WHEN o.original_count = f.fact_count THEN 'MATCH'
            ELSE 'MISMATCH'
        END AS validation_result
    FROM original_counts o
    LEFT JOIN fact_counts f ON o.region_name = f.region_name
)

SELECT *
FROM validation
WHERE validation_result = 'MISMATCH'
