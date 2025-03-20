with
    cupons as (
        select
            CanalPerfil,
            STRING_AGG(Link, ', ') AS links

        from {{ ref('stg_links') }}
        group by 1
    )

select
    idCreator,
    links

from {{ ref('stg_cadastro_creators') }} cd
left join cupons cp on cp.CanalPerfil = cd.idCreator


