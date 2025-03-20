{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(Carimbo_de_datahora AS STRING) AS Carimbo_de_datahora,
    CAST(CreatorCanal AS STRING) AS CreatorCanal,
    CAST(Endereo_de_email AS STRING) AS Endereco_de_email,
    CAST(Solicitante AS STRING) AS Solicitante,
    CAST(Peas_a_serem_enviadas AS STRING) AS Peas_a_serem_enviadas,
    CAST(SKUs AS STRING) AS SKUs,
    CAST(Destinatrio AS STRING) AS Destinatario,
    CAST(Email AS STRING) AS Email,
    CAST(CEP AS STRING) AS CEP,
    CAST(Endereo AS STRING) AS Endereco,
    CAST(CPF AS STRING) AS CPF,
    CAST(WhatsApp AS STRING) AS WhatsApp,
    CAST(Tipo_de_pedido AS STRING) AS Tipo_de_pedido,
    CAST(Status AS STRING) AS Status,
    CAST(Data_do_pedido AS STRING) AS Data_do_pedido,
    CAST(Nmero_do_pedido AS STRING) AS Numero_do_pedido,
    CAST(Agente AS STRING) AS Agente,
    CAST(Custo_total_pedido AS STRING) AS Custo_total_pedido,
    CAST(Creator_Code AS STRING) AS Creator_Code,
    CAST(Status_Entrega AS STRING) AS Status_Entrega

FROM {{ source("appsheet", "8_envios do site") }}