{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(Carimbo_de_datahora AS STRING) AS Carimbo_de_datahora,
    CAST(Seu_Creator_Code AS STRING) AS Seu_Creator_Code,
    CAST(Nome_do_canal_ou_perfil AS STRING) AS Nome_do_canal_ou_perfil,
    CAST(Nome_do_host_do_canalperfil AS STRING) AS Nome_do_host_do_canalperfil,
    CAST(Gnero AS STRING) AS Gnero,
    CAST(Aniversrio AS STRING) AS Aniversrio,
    CAST(Destinatrio AS STRING) AS Destinatrio,
    CAST(CPF AS STRING) AS CPF,
    CAST(Endereo_de_email AS STRING) AS Endereo_de_email,
    CAST(WhatsApp AS STRING) AS WhatsApp,
    CAST(Endereo AS STRING) AS Endereo,
    CAST(Cidade AS STRING) AS Cidade,
    CAST(UF AS STRING) AS UF,
    CAST(CEP AS STRING) AS CEP,
    CAST(Camiseta_e_Regata AS STRING) AS Camiseta_e_Regata,
    CAST(Casaco_e_Bluso AS STRING) AS Casaco_e_Bluso,
    CAST(Shorts_e_Cala AS STRING) AS Shorts_e_Cala,
    CAST(Cueca AS STRING) AS Cueca,
    CAST(Meias AS STRING) AS Meias,
    CAST(Preferncia_de_meias AS STRING) AS Preferncia_de_meias,
    CAST(Preferncia_de_cores AS STRING) AS Preferncia_de_cores,
    CAST(Voc_gostaria_de_fazer_alguma_considerao_para_a_seleo_das_peas AS STRING) AS Voc_gostaria_de_fazer_alguma_considerao_para_a_seleo_das_peas,
    CAST(Camiseta_e_Blusa AS STRING) AS Camiseta_e_Blusa,
    CAST(Top_e_Regata AS STRING) AS Top_e_Regata,
    CAST(Shorts_Cala_e_Saia AS STRING) AS Shorts_Cala_e_Saia,
    CAST(Calcinha AS STRING) AS Calcinha,
    CAST(Preferncia_no_modelo_de_calcinha AS STRING) AS Preferncia_no_modelo_de_calcinha,
    CAST(Suti AS STRING) AS Suti,
    CAST(Meias29 AS STRING) AS Meias29,
    CAST(Preferncia_de_meias30 AS STRING) AS Preferncia_de_meias30,
    CAST(Preferncia_de_cores31 AS STRING) AS Preferncia_de_cores31,
    CAST(Voc_gostaria_de_fazer_alguma_considerao_para_a_nossa_seleo_de_peas AS STRING) AS Voc_gostaria_de_fazer_alguma_considerao_para_a_nossa_seleo_de_peas,
    CAST(Foi_acordado_na_negociao_algum_direcionamento_para_envio_das_peas AS STRING) AS Foi_acordado_na_negociao_algum_direcionamento_para_envio_das_peas,
    CAST(Foi_acordado_na_negociao_algum_direcionamento_para_envio_das_peas34 AS STRING) AS Foi_acordado_na_negociao_algum_direcionamento_para_envio_das_peas34,
    CAST(Email_para_cadastro_no_Portal_de_Pagamentos AS STRING) AS Email_para_cadastro_no_Portal_de_Pagamentos,
    CONCAT(Carimbo_de_datahora,": ", Nome_do_canal_ou_perfil,": ", Nome_do_host_do_canalperfil) AS _ComputedKey

FROM {{ source("appsheet", "7_endereços e tamanhos") }}