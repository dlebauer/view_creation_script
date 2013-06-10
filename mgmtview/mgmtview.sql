drop view if exists seeding;
create view seeding  as select treatment_id, management_id, mgmttype, date, level, units from managements as m join managements_treatments as mt on m.id = mt.management_id where mgmttype in ('seeding', 'seed_density', 'row_spacing');
drop view if exists coppice;
create view coppice as select treatment_id, management_id, mgmttype, date, level, units from managements as m join managements_treatments as mt on m.id = mt.management_id where mgmttype in ('coppice');
drop view if exists planting;
create view planting as select treatment_id, management_id, mgmttype, date, level, units from managements as m join managements_treatments as mt on m.id = mt.management_id where mgmttype in ('planting');
drop view if exists mgmtview;  
create view mgmtview as select yields.id as yield_id, planting.date as planting, seeding.date as seeding, coppice.date as coppice from yields left outer join planting on yields.treatment_id = planting.treatment_id left outer join seeding on yields.treatment_id = seeding.treatment_id left outer join coppice on yields.treatment_id = coppice.treatment_id; 
