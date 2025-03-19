{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(Row_ID AS STRING) AS Row_ID,
    CAST(Datahora AS STRING) AS Datahora,
    CAST(Canal_Perfil AS STRING) AS Canal_Perfil,
    CAST(Ao AS STRING) AS Ao,
    CAST(Formato_de_parceria AS STRING) AS Formato_de_parceria,
    CAST(Modelo_de_gerenciamento AS STRING) AS Modelo_de_gerenciamento,
    CAST(Data_de_fechamento AS STRING) AS Data_de_fechamento,
    CAST(Responsvel_Comercial AS STRING) AS Responsvel_Comercial,
    CAST(Escopo_detalhado AS STRING) AS Escopo_detalhado,
    CAST(Investimento_mensal AS STRING) AS Investimento_mensal,
    CAST(Final_do_contrato AS STRING) AS Final_do_contrato,
    CAST(Prazo_de_Pagamento AS STRING) AS Prazo_de_Pagamento,
    CAST(Contrato_assinado AS STRING) AS Contrato_assinado,
    CAST(Autorizao_de_Imagem AS STRING) AS Autorizao_de_Imagem,
    CAST(Exclusividade AS STRING) AS Exclusividade,
    CAST(Criado_custo_mensal AS STRING) AS Criado_custo_mensal,
    CAST(Tamanho_do_canal AS STRING) AS Tamanho_do_canal,
    CAST(Incio_do_contrato AS STRING) AS Incio_do_contrato,
    CAST(CPM AS STRING) AS CPM,
    CAST(Observaes AS STRING) AS Observaes,
    CAST(Montante_a_ser_ajustado AS STRING) AS Montante_a_ser_ajustado,
    CAST(Contedo AS STRING) AS Contedo,
    CAST(Motivo AS STRING) AS Motivo,
    CAST(hubspotid AS STRING) AS hubspotid

FROM {{ source("appsheet", "11_historico comercial") }}
