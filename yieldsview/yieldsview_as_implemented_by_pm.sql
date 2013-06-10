

CREATE VIEW yieldsview AS
       SELECT
              yields.id AS yield_id,
              yields.citation_id,
              yields.site_id,
              
              sites.sitename AS site,
              sites.lat AS lat,
              sites.lon AS lon,
              species.scientificname AS sp,

              
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
              yields.checked AS checked,
              yields.access_level AS access_level,
              yields.user_id AS user_id
       FROM
                   yields
              JOIN sites ON yields.site_id = sites.id
              JOIN species ON yields.specie_id = species.id
              JOIN citations ON yields.citation_id = citations.id
              JOIN treatments ON yields.treatment_id = treatments.id
              JOIN users on yields.user_id = users.id;
