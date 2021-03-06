DROP VIEW IF EXISTS traitsview;

CREATE VIEW traitsview AS
       SELECT
              'traits' AS result_type,
              traits.id AS id,
              traits.citation_id,
              traits.site_id,
              traits.treatment_id,
              sites.sitename,
              sites.city,
              sites.lat,
              sites.lon,
              species.scientificname,
              species.commonname,
              species.genus,
              citations.author AS author,
              citations.year AS citation_year,
              treatments.name AS treatment,
              traits.date,
              extract(month from traits.date) AS month,
              extract(year from traits.date) AS year,
              traits.dateloc,
              variables.name AS trait,
              traits.mean,
              variables.units,
              traits.n,
              traits.statname,
              traits.stat,
              traits.notes,
              users.name AS user_name

              
       FROM
                 traits
            LEFT JOIN sites ON traits.site_id = sites.id
            LEFT JOIN species ON traits.specie_id = species.id
            LEFT JOIN citations ON traits.citation_id = citations.id
            LEFT JOIN treatments ON traits.treatment_id = treatments.id
            LEFT JOIN variables ON traits.variable_id = variables.id
            LEFT JOIN users ON traits.user_id = users.id;
