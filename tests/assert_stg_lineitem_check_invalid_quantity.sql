 SELECT * FROM {{ ref('stg_lineitem') }}
                WHERE quantity <= 0
