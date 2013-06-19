DROP VIEW IF EXISTS seeding;
/*
CREATE VIEW seeding AS
       SELECT
              mt.treatment_id,
              -- m.id AS management_id,
              -- m.mgmttype,
              m.date,
              -- m.level,
              m.units
       FROM
                   managements AS m
              JOIN managements_treatments AS mt ON m.id = mt.management_id
       WHERE m.mgmttype IN ('seeding', 'seed_density', 'row_spacing');
*/                     
DROP VIEW IF EXISTS coppice;
/*
CREATE VIEW coppice AS
       SELECT
              mt.treatment_id,
              -- m.id AS management_id,
              -- m.mgmttype,
              m.date,
              -- m.level,
              m.units
       FROM
                   managements AS m
              JOIN managements_treatments AS mt ON m.id = mt.management_id
       WHERE m.mgmttype IN ('coppice');
*/
DROP VIEW IF EXISTS planting;
/*
CREATE VIEW planting AS
       SELECT 
              mt.treatment_id,
              -- m.id AS management_id,
              -- m.mgmttype,
              m.date,
              -- m.level,
              m.units
       FROM
              managements AS m
              JOIN managements_treatments AS mt ON m.id = mt.management_id
       WHERE m.mgmttype in ('planting');
*/
DROP VIEW IF EXISTS mgmtview;  
/*
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
*/
/*
CREATE VIEW mgmtview AS
       SELECT
            yields.id AS yield_id,
            m.units
       FROM yields
            LEFT JOIN (
                 managements AS m
                 JOIN managements_treatments AS mt ON m.id = mt.management_id)
            ON yields.treatment_id = mt.treatment_id;
*/
