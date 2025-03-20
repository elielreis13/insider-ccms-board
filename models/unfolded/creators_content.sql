with
    cupons as (
        select
            CanalPerfil,
            '[' ||  STRING_AGG(Cupom, ', ') || ']' AS releated_cupons

        from {{ ref('stg_cupons') }}
        group by 1
    ),

    links as (
        select
            CanalPerfil,
            '[' ||  STRING_AGG(Link, ', ') || ']' AS releated_links

        from {{ ref("stg_links") }}
        group by 1
    ),

    briefing as (
        select
            CanalPerfil,
            '[' ||  STRING_AGG(EntradaUnica, ', ') || ']' AS releated_briefings
        
        from {{ ref('stg_briefings') }}
        group by 1
    ),

    aprovacao_conteudos as (
        select
            Content_Creator,
            '[' ||  STRING_AGG(Row_ID, ', ') || ']' AS releated_briefings
            
        from {{ ref('stg_aprovacao_conteudos') }}
    )


select
    idCreator,
    releated_cupons,
    releated_links,
    releated_briefings

from {{ ref('stg_cadastro_creators') }} cd
left join cupons cp on cp.CanalPerfil = cd.idCreator
left join links lk on lk.CanalPerfil = cd.idCreator
left join briefing bf on bf.CanalPerfil = cd.idCreator


