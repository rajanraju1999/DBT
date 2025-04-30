{% macro split_fact_sales_by_region() %}

    -- Step 1: Get the list of distinct region names from dim_region
    {% set query %}
        SELECT DISTINCT region_name FROM {{ ref('dim_region') }}
    {% endset %}

    {% set results = run_query(query) %}
    
    {% if execute %}
        {% set region_list = results.columns[0].values() %}
    {% else %}
        {% set region_list = [] %}
    {% endif %}

    -- Step 2: Loop through the regions and create a separate table for each
    {% for region in region_list %}
        {% set region_name = region | lower | replace(" ", "_") %}

        {% set sql %}
            CREATE OR REPLACE TABLE {{ target.schema }}.fact_sales_{{ region_name }} AS
            SELECT fs.*
            FROM {{ ref('fact_sales') }} fs
            JOIN {{ ref('dim_region') }} dr
            ON fs.region_key = dr.region_key
            WHERE dr.region_name = '{{ region }}'
        {% endset %}

        {% do run_query(sql) %}
        
        -- Logging for each table creation
        {{ log("Created table: fact_sales_" ~ region_name, info=True) }}
    {% endfor %}

{% endmacro %}
