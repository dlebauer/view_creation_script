CREATE ALGORITHM=UNDEFINED DEFINER=`dlebauer`@`localhost` SQL SECURITY DEFINER VIEW `mgmtview` AS select `yields`.`id` AS `yield_id`,`planting`.`date` AS `planting`,`seeding`.`date` AS `seeding`,`coppice`.`date` AS `coppice` from (((`yields` left join `planting` on((`yields`.`treatment_id` = `planting`.`treatment_id`))) left join `seeding` on((`yields`.`treatment_id` = `seeding`.`treatment_id`))) left join `coppice` on((`yields`.`treatment_id` = `coppice`.`treatment_id`)))CREATE ALGORITHM=UNDEFINED DEFINER=`dlebauer`@`localhost` SQL SECURITY DEFINER VIEW `mgmtview` AS select `yields`.`id` AS `yield_id`,`planting`.`date` AS `planting`,`seeding`.`date` AS `seeding`,`coppice`.`date` AS `coppice` from (((`yields` left join `planting` on((`yields`.`treatment_id` = `planting`.`treatment_id`))) left join `seeding` on((`yields`.`treatment_id` = `seeding`.`treatment_id`))) left join `coppice` on((`yields`.`treatment_id` = `coppice`.`treatment_id`)))CREATE 
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
