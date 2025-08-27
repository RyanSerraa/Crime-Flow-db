create table dcrime
(
    id             uuid default gen_random_uuid() not null
        primary key,
    nome           varchar(255),
    nome_abreviado varchar(255)
);