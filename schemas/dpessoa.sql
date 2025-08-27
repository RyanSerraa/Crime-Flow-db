create table dpessoa
(
    id              uuid                not null,
    id_faixa_etaria bigint              not null,
    name            varchar(255),
    genero          genero_enum,
    raca            raca_enum,
    tipo_pessoa     tipo_de_pessoa_enum not null,
    faixa_inf       bigint,
    faixa_sup       bigint,
    constraint dperson_pkey
        primary key (id, id_faixa_etaria)
);