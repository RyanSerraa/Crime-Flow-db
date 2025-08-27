create table ftiroteio
(
    id_pessoa        uuid        not null
        constraint fshootings_pkey
            primary key,
    id_arma          uuid        not null
        constraint fshootings_idweapon_fkey
            references darma,
    id_faixa_etaria  bigint      not null,
    id_localidade    uuid        not null
        constraint fshootings_idlocal_fkey
            references dlocalidade,
    id_causa_morte   uuid        not null
        constraint fshootings_idcausedeath_fkey
            references dcausamorte,
    status_de_ameaca ameaca_enum not null,
    fuga             fuga_enum   not null,
    camera_corporal  boolean,
    ano              bigint,
    mes              bigint,
    dia              bigint,
    constraint fshootings_idperson_idgroupage_fkey
        foreign key (id_pessoa, id_faixa_etaria) references dpessoa
);