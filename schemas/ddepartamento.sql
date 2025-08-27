create table ddepartamento
(
    id   uuid default gen_random_uuid() not null
        constraint ddept_pkey
            primary key,
    nome varchar(255)
);