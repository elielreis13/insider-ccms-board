{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(_RowNumber AS INT) AS RowNumber,
    CAST(`Data e hora` AS STRING) AS Data_e_hora,
    CAST(CanalPerfil AS STRING) AS CanalPerfil,
    CAST(Cupom AS STRING) AS Cupom,
    CAST(`Data de criação` AS STRING) AS Data_de_criacao,
    CAST(Porcentagem AS STRING) AS Porcentagem

FROM landing.`1_cupons`