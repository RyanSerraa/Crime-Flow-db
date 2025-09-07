create view vmortepolicial
            (data_crime, causa_morte, tipo_policia, faixa_etaria_criminoso, estado, cidade, latitude, longitude) as
SELECT make_date(f.ano, f.mes, f.dia)             AS data_crime,
       c.nome_abreviado                           AS causa_morte,
       p.tipo_pessoa                              AS tipo_policia,
       (p.faixa_inf || ' - ') || p.faixa_sup      AS faixa_etaria_criminoso,
       l.estado                                   AS estado,
       l.cidade                                   AS cidade,
       l.latitude                                 AS latitude,
       l.longitude                                AS longitude
FROM defaultdb.public.fmortepolicial AS f
         JOIN defaultdb.public.dcausamorte AS c ON f.id_causa_morte = c.id
         JOIN defaultdb.public.ddepartamento AS d ON f.id_departamento = d.id
         JOIN defaultdb.public.dpessoa AS p ON (f.id_pessoa = p.id) AND (f.id_faixa_etaria = p.id_faixa_etaria)
         JOIN defaultdb.public.dlocalidade AS l ON f.id_localidade = l.id;