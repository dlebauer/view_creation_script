DROP VIEW IF EXISTS seeding;
CREATE VIEW seeding AS
       SELECT
              treatment_id,
              -- management_id,
              mgmttype,
              date,
              level,
              units
       FROM
                   managements AS m
              JOIN managements_treatments AS mt ON m.id = mt.management_id
       WHERE mgmttype IN ('seeding', 'seed_density', 'row_spacing');
                     
DROP VIEW IF EXISTS coppice;
CREATE VIEW coppice AS
       SELECT treatment_id,
              management_id,
              mgmttype,
              date,
              level,
              units
       FROM
                   managements AS m
              JOIN managements_treatments AS mt ON m.id = mt.management_id
       WHERE mgmttype IN ('coppice');

DROP VIEW IF EXISTS planting;
CREATE VIEW planting AS
       SELECT treatment_id,
              management_id,
              mgmttype,
              date,
              level,
              units
       FROM
              managements AS m
              JOIN managements_treatments AS mt ON m.id = mt.management_id
       WHERE mgmttype in ('planting');

DROP VIEW IF EXISTS mgmtview;  
CREATE VIEW mgmtview AS
       SELECT
              yields.id AS yield_id,
              planting.date AS planting,
              seeding.date AS seeding,
              coppice.date AS coppice
       FROM yields
              LEFT OUTER JOIN planting ON yields.treatment_id = planting.treatment_id
              LEFT OUTER JOIN seeding ON yields.treatment_id = seeding.treatment_id
              LEFT OUTER JOIN coppice ON yields.treatment_id = coppice.treatment_id; 
