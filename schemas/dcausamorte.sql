create table dcausamorte
(
    id             uuid default gen_random_uuid() not null
        constraint ddeathcause_pkey
            primary key,
    descricao      varchar(255),
    nome_abreviado varchar(255)
);