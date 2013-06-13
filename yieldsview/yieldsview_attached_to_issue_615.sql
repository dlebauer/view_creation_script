DROP VIEW IF EXISTS yieldsview;

CREATE VIEW yieldsview AS
       SELECT
              'yield data' AS result_type,
              yields.id AS id,
              yields.citation_id,
              yields.site_id,
              yields.treatment_id,
              COALESCE(sites.sitename, sites.city) AS sitename_or_city,
              ROUND(sites.lat, 2) AS lat,
              ROUND(sites.lon, 2) AS lon,
              species.scientificname,
              species.commonname,
              species.genus,
              citations.author AS author,
              citations.year AS citation_year,
              treatments.name AS treatment,
              yields.date,
              month(yields.date) AS month,
              year(yields.date) AS year,
              yields.dateloc,
              variables.name AS trait,
              CONCAT(yields.mean, ' ', variables.units) AS mean,
              yields.n,
              yields.statname,
              yields.stat,
              yields.notes,
              users.name AS user_name
              -- mgmtview.planting,
              -- mgmtview.seeding
       FROM
                   yields
              LEFT JOIN sites ON yields.site_id = sites.id
              LEFT JOIN species ON yields.specie_id = species.id
              LEFT JOIN citations ON yields.citation_id = citations.id
              LEFT JOIN treatments ON yields.treatment_id = treatments.id
              LEFT JOIN variables ON variables.name = 'Ayield' AND variables.id = 63
              LEFT JOIN users ON yields.user_id = users.id
              ; -- LEFT JOIN mgmtview ON yields.id = mgmtview.yield_id;

DROP VIEW IF EXISTS traits_and_yields_view;

CREATE VIEW traits_and_yields_view AS
       SELECT * FROM traitsview
           UNION
       SELECT * FROM yieldsview;
