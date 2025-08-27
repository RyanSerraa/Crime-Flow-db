create view vconfrontosfatais
            (data_crime, departamento_policia, causa_morte, arma_usada, status_ameaca, status_fuga, policial_com_camera,
             sexo_vitima, raca_vitima, tipo_vitima, faixa_etaria_criminoso, estado, cidade, latitude, longitude)
as
SELECT make_date(f.ano, f.mes, f.dia)             AS data_crime,
       d.nome                                     AS departamento_policia,
       COALESCE(c.nome_abreviado, 'DESCONHECIDO') AS causa_morte,
       COALESCE(a.nome_abreviado, 'DESCONHECIDA') AS arma_usada,
       f.status_de_ameaca                         AS status_ameaca,
       f.fuga                                     AS status_fuga,
       f.camera_corporal                          AS policial_com_camera,
       p.genero                                   AS sexo_vitima,
       p.raca                                     AS raca_vitima,
       p.tipo_pessoa                              AS tipo_vitima,
       (p.faixa_inf || ' - ') || p.faixa_sup      AS faixa_etaria_criminoso,
       l.estado                                   AS estado,
       l.cidade                                   AS cidade,
       l.latitude                                 AS latitude,
       l.longitude                                AS longitude
FROM defaultdb.public.fconfrontosfatais AS f
         JOIN defaultdb.public.darma AS a ON f.id_arma = a.id
         JOIN defaultdb.public.dcausamorte AS c ON f.id_causa_morte = c.id
         JOIN defaultdb.public.ddepartamento AS d ON f.id_departamento = d.id
         JOIN defaultdb.public.dpessoa AS p ON (f.id_pessoa = p.id) AND (f.id_faixa_etaria = p.id_faixa_etaria)
         JOIN defaultdb.public.dlocalidade AS l ON f.id_localidade = l.id;
