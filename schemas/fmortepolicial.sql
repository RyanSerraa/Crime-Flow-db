create table fmortepolicial
(
    id_pessoa       uuid   not null
        constraint fdeathpolice_pkey
            primary key,
    id_faixa_etaria bigint not null,
    id_causa_morte  uuid   not null
        constraint fdeathpolice_iddeathcause_fkey
            references dcausamorte,
    id_departamento uuid   not null
        constraint fdeathpolice_iddept_fkey
            references ddepartamento,
    id_localidade   uuid   not null
        constraint fdeathpolice_idlocal_fkey
            references dlocalidade,
    ano             bigint,
    mes             bigint,
    dia             bigint,
    constraint fdeathpolice_idperson_idgroupage_fkey
        foreign key (id_pessoa, id_faixa_etaria) references dpessoa
);