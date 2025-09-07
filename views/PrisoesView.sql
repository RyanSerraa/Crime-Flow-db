create view vprisao
            (data_prisao, droga, nome_crime, arma_usada, sexo_criminoso, raca_criminoso, tipo_criminoso,
             faixa_etaria_criminoso, estado, cidade, latitude, longitude)
as
SELECT make_date(f.ano, f.mes, f.dia)             AS data_prisao,
       d.nome                                     AS droga,
       c.nome_abreviado                           AS nome_crime,
       a.nome_abreviado                           AS arma_usada,
       p.genero                                   AS sexo_criminoso,
       p.raca                                     AS raca_criminoso,
       p.tipo_pessoa                              AS tipo_criminoso,
       (p.faixa_inf || ' - ') || p.faixa_sup      AS faixa_etaria_criminoso,
       l.estado                                   AS estado,
       l.cidade                                   AS cidade,
       l.latitude                                 AS latitude,
       l.longitude                                AS longitude
FROM defaultdb.public.fprisao AS f
         JOIN defaultdb.public.dcrime AS c ON f.id_crime = c.id
         JOIN defaultdb.public.ddroga AS d ON f.id_droga = d.id
         JOIN defaultdb.public.darma AS a ON f.id_arma = a.id
         JOIN defaultdb.public.dpessoa AS p ON (f.id_pessoa = p.id) AND (f.id_faixa_etaria = p.id_faixa_etaria)
         JOIN defaultdb.public.dlocalidade AS l ON f.id_localidade = l.id;