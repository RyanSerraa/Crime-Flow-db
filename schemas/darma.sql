create table darma
(
    id             uuid default gen_random_uuid() not null
        constraint dweapon_pkey
            primary key,
    nome           varchar(255),
    nome_abreviado varchar(255)
);