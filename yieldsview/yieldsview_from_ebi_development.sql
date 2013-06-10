CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `DLEBAUER`@`LOCALHOST` 
    SQL SECURITY DEFINER
VIEW `yieldsview` AS
    SELECT 
        `yields`.`id` AS `yield_id`,
        `yields`.`citation_id` AS `citation_id`,
        `yields`.`site_id` AS `site_id`,
        `yields`.`treatment_id` AS `treatment_id`,
        `sites`.`sitename` AS `site`,
        `sites`.`city` AS `city`,
        `sites`.`lat` AS `lat`,
        `sites`.`lon` AS `lon`,
        `species`.`scientificname` AS `scientificname`,
        `species`.`genus` AS `genus`,
        `citations`.`author` AS `author`,
        `citations`.`year` AS `cityear`,
        `treatments`.`name` AS `trt`,
        `yields`.`date` AS `date`,
        MONTH(`yields`.`date`) AS `month`,
        YEAR(`yields`.`date`) AS `year`,
        `yields`.`mean` AS `mean`,
        `yields`.`n` AS `n`,
        `yields`.`statname` AS `statname`,
        `yields`.`stat` AS `stat`,
        `yields`.`notes` AS `notes`,
        `users`.`name` AS `user`,
        `mgmtview`.`planting` AS `planting`,
        `mgmtview`.`seeding` AS `seeding`
    FROM
        ((((((`yields`
        LEFT JOIN `sites` ON ((`yields`.`site_id` = `sites`.`id`)))
        LEFT JOIN `species` ON ((`yields`.`specie_id` = `species`.`id`)))
        LEFT JOIN `citations` ON ((`yields`.`citation_id` = `citations`.`id`)))
        LEFT JOIN `treatments` ON ((`yields`.`treatment_id` = `treatments`.`id`)))
        LEFT JOIN `users` ON ((`yields`.`user_id` = `users`.`id`)))
        LEFT JOIN `mgmtview` ON ((`yields`.`id` = `mgmtview`.`yield_id`)))
