create table ddroga
(
    id   uuid default gen_random_uuid() not null
        constraint ddrug_pkey
            primary key,
    nome varchar(255)
);
