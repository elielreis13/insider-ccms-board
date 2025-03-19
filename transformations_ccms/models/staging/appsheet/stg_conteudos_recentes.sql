{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(RowNumber1 AS INT) AS RowNumber1,
    CAST(Row_ID AS STRING) AS Row_ID,
    CAST(Datahora_do_Agendamento AS STRING) AS Datahora_do_Agendamento,
    CAST(AccountManager AS STRING) AS AccountManager,
    CAST(CanalPerfil AS STRING) AS CanalPerfil,
    CAST(Data AS STRING) AS Data,
    CAST(TIER AS STRING) AS TIER,
    CAST(Plataforma AS STRING) AS Plataforma,
    CAST(Formato AS STRING) AS Formato,
    CAST(Link AS STRING) AS Link,
    CAST(Link_2 AS STRING) AS Link_2,
    CAST(Observacoes AS STRING) AS Observacoes,
    CAST(Content_Creator AS STRING) AS Content_Creator,
    CAST(Entrada_unica AS STRING) AS Entrada_unica,
    CAST(Controle_ms AS STRING) AS Controle_ms
FROM {{ source("appsheet", "conteudos_recentes") }}