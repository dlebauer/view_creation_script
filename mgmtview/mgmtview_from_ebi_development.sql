CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `DLEBAUER`@`LOCALHOST` 
    SQL SECURITY DEFINER
VIEW `mgmtview` AS
    SELECT 
        `yields`.`id` AS `yield_id`,
        `planting`.`date` AS `planting`,
        `seeding`.`date` AS `seeding`,
        `coppice`.`date` AS `coppice`
    FROM
        (((`yields`
        LEFT JOIN `planting` ON ((`yields`.`treatment_id` = `planting`.`treatment_id`)))
        LEFT JOIN `seeding` ON ((`yields`.`treatment_id` = `seeding`.`treatment_id`)))
        LEFT JOIN `coppice` ON ((`yields`.`treatment_id` = `coppice`.`treatment_id`)))
