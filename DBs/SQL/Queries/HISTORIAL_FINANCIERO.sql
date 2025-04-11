CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `historial_financiero` AS
    SELECT 
        `t`.`id` AS `transaccion_id`,
        `t`.`monto` AS `monto`,
        `t`.`tipo_transaccion` AS `tipo_transaccion`,
        `t`.`metodo_pago` AS `metodo_pago`,
        `t`.`estatus` AS `estado_transaccion`,
        `t`.`fecha_registro` AS `fecha_registro`,
        CONCAT(`p`.`nombre`, ' ', `p`.`primer_apellido`) AS `cliente`,
        `u`.`nombre_usuario` AS `nombre_usuario`
    FROM
        ((`tbb_transacciones` `t`
        JOIN `tbb_usuarios` `u` ON ((`t`.`usuario_id` = `u`.`id`)))
        JOIN `tbb_personas` `p` ON ((`u`.`persona_id` = `p`.`id`)))
    ORDER BY `t`.`fecha_registro` DESC