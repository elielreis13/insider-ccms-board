{{
    config(
        materialized = 'table',
        schema = "staging"
    )
}}

SELECT
    CAST(RowNumber AS INT) AS RowNumber,
    CAST(Data_de_criao AS STRING) AS Data_de_criao,
    CAST(CanalPerfil AS STRING) AS CanalPerfil,
    CAST(Link AS STRING) AS Link,
    CAST(Collection AS STRING) AS Collection,
    CAST(QR_code AS STRING) AS QR_code

FROM {{ source("appsheet", "2_links") }}