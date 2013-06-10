DROP VIEW IF EXISTS traitsview;

CREATE VIEW traitsview AS
       SELECT
              traits.id AS trait_id,
              traits.citation_id,
              traits.site_id,
              traits.treatment_id,
              sites.sitename AS site,
              sites.city,
              sites.lat,
              sites.lon,
              species.scientificname,
              species.genus,
              species.commonname,
              citations.author AS author,
              citations.year AS cityear,
              treatments.name AS trt,
              traits.date,
              month(traits.date) AS month,
              year(traits.date) AS year,
              traits.dateloc,
              variables.name AS trait,
              traits.mean,
              traits.n,
              traits.statname,
              traits.stat,
              traits.notes,
              users.name AS user
       FROM
                 traits
            JOIN sites ON traits.site_id = sites.id
            JOIN species ON traits.specie_id = species.id
            JOIN citations ON traits.citation_id = citations.id
            JOIN treatments ON traits.treatment_id = treatments.id
            JOIN variables ON traits.variable_id = variables.id
            JOIN users ON traits.user_id = users.id;
