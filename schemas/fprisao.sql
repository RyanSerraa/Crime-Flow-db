create table fprisao
(
    id_crime        uuid   not null
        constraint farrest_idcrime_fkey
            references dcrime,
    id_localidade   uuid   not null
        constraint farrest_idlocal_fkey
            references dlocalidade,
    id_pessoa       uuid   not null,
    id_faixa_etaria bigint not null,
    id_arma         uuid   not null
        constraint farrest_idweapon_fkey
            references darma,
    id_droga        uuid   not null
        constraint farrest_iddrug_fkey
            references ddroga,
    ano             bigint not null,
    dia             bigint not null,
    mes             bigint not null,
    constraint farrest_pkey
        primary key (id_crime, id_localidade, id_pessoa, id_faixa_etaria, id_arma, id_droga, dia, mes, ano),
    constraint farrest_idperson_idgroupage_fkey
        foreign key (id_pessoa, id_faixa_etaria) references dpessoa
);