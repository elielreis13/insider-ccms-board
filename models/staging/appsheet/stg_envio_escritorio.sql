{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(Creator_code AS STRING) AS Creator_code,
    CAST(Perfil__Canal AS STRING) AS Perfil_Canal,
    CAST(Solicitante AS STRING) AS Solicitante,
    CAST(Peas_enviadas AS STRING) AS Peas_enviadas,
    CAST(Destinatrio AS STRING) AS Destinatrio,
    CAST(Endereo_com_CEP AS STRING) AS Endereo_com_CEP,
    CAST(WhatsApp AS STRING) AS WhatsApp,
    CAST(Observaes AS STRING) AS Observaes,
    CAST(Status AS STRING) AS Status,
    CAST(Data_do_envio AS INT) AS Data_do_envio,
    CAST(Plataforma AS STRING) AS Plataforma,
    CAST(Nmero_do_pedido AS STRING) AS Nmero_do_pedido,
    CAST(Custo_de_envio AS STRING) AS Custo_de_envio

FROM {{ source("appsheet", "9_envios do escritório") }}