with
    cupons as (
        select
            CanalPerfil,
            '[' ||  STRING_AGG(Cupom, ', ') || ']' AS related_cupons

        from {{ ref('stg_cupons') }}
        group by 1
    ),

    links as (
        select
            CanalPerfil,
            '[' ||  STRING_AGG(Link, ', ') || ']' AS related_links

        from {{ ref("stg_links") }}
        group by 1
    ),

    briefing as (
        select
            CanalPerfil,
            '[' ||  STRING_AGG(EntradaUnica, ', ') || ']' AS related_briefings
        
        from {{ ref('stg_briefings') }}
        group by 1
    ),

    aprovacao_conteudos as (
        select
            Content_Creator,
            '[' ||  STRING_AGG(Row_ID, ', ') || ']' AS related_aprovacao_conteudo

        from {{ ref('stg_aprovacao_conteudos') }}
        group by 1
    ),

    historico_comercial as (
        select
            Canal_Perfil,
            '[' ||  STRING_AGG(_ComputedKey, ', ') || ']' AS related_hist_com_ComputedKey,
            min(Incio_do_contrato) as inicio_da_parceria,
            max(Incio_do_contrato) as Inicio_do_ultimo_contrato

        from {{ ref('stg_historico_comercial') }}
        group by 1
    ),

    envio_escritorio as (
        select
            Perfil_Canal,
            '[' ||  STRING_AGG(Nmero_do_pedido, ', ') || ']' AS related_Nmero_do_pedido
        
        from {{ref('stg_envio_escritorio')}}
        group by 1
    ),

    enderecos_tamanhos as (
        select
            Seu_Creator_Code,
            '[' ||  STRING_AGG(_ComputedKey, ', ') || ']' AS related_end_tam_ComputedKey,
            case
                when count(_ComputedKey) > 0 then 'Y'
                else 'N'
            end as flag_envio_pecas_endereco_tamanho
        
        from {{ref('stg_enderecos_e_tamanhos')}}
        group by 1
    ),

    envio_site as (
        select
            Creator_Code,
            Numero_do_pedido,
            '[' ||  STRING_AGG(Carimbo_de_datahora, ', ') || ']' AS related_envio_site,
            case
                when count(Creator_Code) > 0 and length(Numero_do_pedido) > 0 then 'Y'
                else 'N'
            end as flag_envio_pecas_pedido_feito
        
        from{{ref('stg_envio_site')}}
        group by 1,2
    )


select
    idCreator,
    related_cupons,
    related_links,
    related_briefings,
    related_aprovacao_conteudo,
    related_hist_com_ComputedKey,
    related_Nmero_do_pedido,
    related_end_tam_ComputedKey,
    related_envio_site,
    case
        when Account_Manager = 'Amanda Garcia' then 'amanda.garcia@insiderstore.com.br'
        when Account_Manager = 'Nicole Leme' then 'nicole.leme@insiderstore.com.br'
        when Account_Manager = 'Ariane Krause' then 'ariane.krause@insiderstore.com.br'
        when Account_Manager = 'João Tavares' then 'joao.tavares@insiderstore.com.br'
        when Account_Manager = 'Letícia Santana' then 'leticiasantana@insiderstore.com.br'
        when Account_Manager = 'Juliana Sato' then 'juliana.sato@insiderstore.com.br'
        else null
    end as email_am,
    inicio_da_parceria,
    Inicio_do_ultimo_contrato,
    coalesce(flag_envio_pecas_endereco_tamanho, 'N') as flag_envio_pecas_endereco_tamanho, --caso n encontre o idCreator
    coalesce(flag_envio_pecas_pedido_feito, 'N') as flag_envio_pecas_pedido_feito --caso n encontre o idCreator



from {{ ref('stg_cadastro_creators') }} cd
left join cupons cp on cp.CanalPerfil = cd.idCreator
left join links lk on lk.CanalPerfil = cd.idCreator
left join briefing bf on bf.CanalPerfil = cd.idCreator
left join aprovacao_conteudos ac on ac.Content_Creator = cd.idCreator
left join historico_comercial hc on hc.Canal_Perfil = cd.idCreator
left join envio_escritorio es on es.Perfil_Canal = cd.idCreator
left join enderecos_tamanhos et on et.Seu_Creator_Code = cd.idCreator
left join envio_site est on est.Creator_Code = cd.idCreator

where true
    and idCreator in ('09890f9a', '11dd981a')

