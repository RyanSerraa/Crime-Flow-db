create table dlocalidade
(
    id                       uuid default gen_random_uuid() not null
        constraint dlocal_pkey
            primary key,
    estado                   varchar(255),
    cidade                   varchar(255),
    latitude                 numeric(9, 6),
    longitude                numeric(9, 6),
    media_negros             real,
    media_brancos            real,
    media_hispanicos         real,
    media_asiaticos          real,
    desvio_padrao_negros     real,
    desvio_padrao_brancos    real,
    desvio_padrao_hispanicos real,
    desvio_padrao_asiaticos  real
);
