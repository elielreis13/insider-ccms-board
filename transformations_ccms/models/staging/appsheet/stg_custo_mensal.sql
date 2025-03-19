{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(Entrada_nica AS STRING) AS Entrada_nica,
    CAST(Creator_Code AS STRING) AS Creator_Code,
    CAST(MsAno AS STRING) AS MsAno,
    CAST(Custo AS STRING) AS Custo,
    CAST(Observaes AS STRING) AS Observaes

FROM {{ source("appsheet", "12_custo mensal") }}