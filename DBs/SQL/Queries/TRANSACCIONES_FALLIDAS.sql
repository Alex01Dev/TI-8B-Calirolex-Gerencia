CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `clientes_problematicos` AS
    SELECT 
        `p`.`id` AS `persona_id`,
        CONCAT(`p`.`nombre`, ' ', `p`.`primer_apellido`) AS `nombre_completo`,
        `p`.`numero_telefonico` AS `numero_telefonico`,
        `u`.`correo_electronico` AS `correo_electronico`,
        COUNT(`t`.`id`) AS `transacciones_rechazadas`,
        MAX(`t`.`fecha_registro`) AS `ultimo_rechazo`
    FROM
        ((`tbb_personas` `p`
        JOIN `tbb_usuarios` `u` ON ((`p`.`id` = `u`.`persona_id`)))
        JOIN `tbb_transacciones` `t` ON ((`u`.`id` = `t`.`usuario_id`)))
    WHERE
        (`t`.`estatus` = 'RECHAZADA')
    GROUP BY `p`.`id` , `u`.`correo_electronico`
    HAVING (COUNT(`t`.`id`) > 1)
    ORDER BY `transacciones_rechazadas` DESC