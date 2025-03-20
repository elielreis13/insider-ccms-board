{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT 
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(idCreator AS STRING) AS idCreator,
    CAST(Content_Creator AS STRING) AS Content_Creator,
    CAST(Canal AS STRING) AS Canal,
    CAST(Status_da_conta_legado AS STRING) AS Status_da_conta_legado,
    CAST(Microbolha AS STRING) AS Microbolha,
    CAST(Link AS STRING) AS Link,
    CAST(Link_2 AS STRING) AS Link_2,
    CAST(Escopo AS STRING) AS Escopo,
    CAST(Final_do_contrato AS STRING) AS Final_do_contrato,
    CAST(Responsvel_Comercial AS STRING) AS Responsvel_Comercial,
    CAST(Account_Manager AS STRING) AS Account_Manager,
    CAST(Modelo_de_gerenciamento AS STRING) AS Modelo_de_gerenciamento,
    CAST(Tier AS STRING) AS Tier,
    CAST(Nome_completo_influenciador AS STRING) AS Nome_completo_influenciador,
    CAST(Agncia AS STRING) AS Agncia,
    CAST(Nome_do_assessor AS STRING) AS Nome_do_assessor,
    CAST(Email_principal AS STRING) AS Email_principal,
    CAST(Email_secundrio AS STRING) AS Email_secundrio,
    CAST(WhatsApp AS STRING) AS WhatsApp,
    CAST(Sugesto_de_cupom AS STRING) AS Sugesto_de_cupom,
    CAST(Email_financeiro AS STRING) AS Email_financeiro,
    CAST(email_de_lembrete AS STRING) AS email_de_lembrete

FROM  {{ source("appsheet", "0_cadastro de creators") }}