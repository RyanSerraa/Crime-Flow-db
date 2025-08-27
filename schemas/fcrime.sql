create table fcrime
(
    id_crime        uuid   not null
        constraint fcrime_idcrime_fkey
            references dcrime,
    id_pessoa       uuid   not null,
    id_faixa_etaria bigint not null,
    id_arma         uuid   not null
        constraint fcrime_idweapon_fkey
            references darma,
    id_localidade   uuid   not null
        constraint fcrime_idlocal_fkey
            references dlocalidade,
    ano             bigint not null,
    dia             bigint not null,
    mes             bigint not null,
    primary key (id_crime, id_pessoa, id_faixa_etaria, id_arma, id_localidade, dia, mes, ano),
    constraint fcrime_idperson_idgroupage_fkey
        foreign key (id_pessoa, id_faixa_etaria) references dpessoa
);