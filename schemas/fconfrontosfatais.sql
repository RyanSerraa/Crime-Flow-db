create table fconfrontosfatais
(
    id_pessoa        uuid        not null
        constraint ffatalencounters_pkey
            primary key,
    id_faixa_etaria  bigint      not null,
    id_causa_morte   uuid        not null
        constraint ffatalencounters_iddeathcause_fkey
            references dcausamorte,
    id_arma          uuid        not null
        constraint ffatalencounters_idweapon_fkey
            references darma,
    id_departamento  uuid        not null
        constraint ffatalencounters_iddept_fkey
            references ddepartamento,
    id_localidade    uuid        not null
        constraint ffatalencounters_idlocal_fkey
            references dlocalidade,
    status_de_ameaca ameaca_enum not null,
    fuga             fuga_enum   not null,
    camera_corporal  boolean,
    ano              bigint,
    mes              bigint,
    dia              bigint,
    constraint ffatalencounters_idperson_idgroupage_fkey
        foreign key (id_pessoa, id_faixa_etaria) references dpessoa
);