DROP VIEW IF EXISTS yieldsview;

CREATE VIEW yieldsview AS
       SELECT
              yields.id AS yield_id,
              yields.citation_id,
              yields.site_id,
              yields.treatment_id,
              sites.sitename AS site,
              sites.city,
              sites.lat,
              sites.lon,
              species.scientificname,
              species.genus,
              citations.author AS author,
              citations.year AS cityear,
              treatments.name AS trt,
              date,
              month(date) AS month,
              year(date) AS year,
              mean,
              n,
              statname,
              stat,
              yields.notes,
              users.name AS user,
              planting,
              seeding
       FROM
                   yields
              JOIN sites ON yields.site_id = sites.id
              JOIN species ON yields.specie_id = species.id
              JOIN citations ON yields.citation_id = citations.id
              JOIN treatments ON yields.treatment_id = treatments.id
              JOIN users ON yields.user_id = users.id
              JOIN mgmtview ON yields.id = mgmtview.yield_id;
