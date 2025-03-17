{{
    config(
        materialized = 'view',
        schema = "staging"
    )
}}

WITH dados_originais AS (
    SELECT *
    FROM {{ source("appsheet", "3_briefings") }}
)

SELECT *
FROM dados_originais