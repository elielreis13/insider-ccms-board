{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

WITH dados_originais AS (
    SELECT
        cast(RowNumber as integer) as RowNumber,
        EntradaUnica,
        CanalPerfil,
        cast(Ano as integer) as Ano,
        cast(Mes as integer) as Mes,
        Briefing,
        Account_Manager,
        Cupom_divulgado_no_ms,
        Link_divulgado_no_ms,
        Data_de_envio,
        Comentrios_do_AM,
        Tipo_de_briefing,
        Flag_Email_Enviado

    FROM {{ source("appsheet", "3_briefings") }}
)

SELECT *
FROM dados_originais