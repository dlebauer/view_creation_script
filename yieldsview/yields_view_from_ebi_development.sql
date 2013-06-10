CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `EBI_USER`@`LOCALHOST` 
    SQL SECURITY DEFINER
VIEW `yields_view` AS
    SELECT 
        `yields`.`id` AS `yield_id`,
        `yields`.`citation_id` AS `citation_id`,
        `yields`.`site_id` AS `site_id`,
        `sites`.`sitename` AS `site`,
        `sites`.`lat` AS `lat`,
        `sites`.`lon` AS `lon`,
        `species`.`scientificname` AS `sp`,
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
        `yields`.`checked` AS `checked`,
        `yields`.`access_level` AS `access_level`,
        `yields`.`user_id` AS `user_id`
    FROM
        (((((`yields`
        JOIN `sites` ON ((`yields`.`site_id` = `sites`.`id`)))
        JOIN `species` ON ((`yields`.`specie_id` = `species`.`id`)))
        JOIN `citations` ON ((`yields`.`citation_id` = `citations`.`id`)))
        JOIN `treatments` ON ((`yields`.`treatment_id` = `treatments`.`id`)))
        JOIN `users` ON ((`yields`.`user_id` = `users`.`id`)))
