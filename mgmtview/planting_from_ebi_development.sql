CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `DLEBAUER`@`LOCALHOST` 
    SQL SECURITY DEFINER
VIEW `planting` AS
    SELECT 
        `mt`.`treatment_id` AS `treatment_id`,
        `mt`.`management_id` AS `management_id`,
        `m`.`mgmttype` AS `mgmttype`,
        `m`.`date` AS `date`,
        `m`.`level` AS `level`,
        `m`.`units` AS `units`
    FROM
        (`managements` `m`
        JOIN `managements_treatments` `mt` ON ((`m`.`id` = `mt`.`management_id`)))
    WHERE
        (`m`.`mgmttype` = _LATIN1'planting')
