CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `informacion_completa_usuario` AS
    SELECT 
        `u`.`id` AS `usuario_id`,
        `u`.`nombre_usuario` AS `nombre_usuario`,
        `u`.`correo_electronico` AS `correo_electronico`,
        CONCAT(`p`.`titulo_cortesia`,
                ' ',
                `p`.`nombre`,
                ' ',
                `p`.`primer_apellido`,
                ' ',
                COALESCE(`p`.`segundo_apellido`, '')) AS `nombre_completo`,
        `p`.`fecha_nacimiento` AS `fecha_nacimiento`,
        `p`.`genero` AS `genero`,
        `p`.`tipo_sangre` AS `tipo_sangre`,
        `u`.`estatus` AS `estado_usuario`
    FROM
        (`tbb_usuarios` `u`
        JOIN `tbb_personas` `p` ON ((`u`.`persona_id` = `p`.`id`)))
    WHERE
        (`u`.`estatus` = 'Activo')