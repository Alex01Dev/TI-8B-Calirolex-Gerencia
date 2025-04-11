CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `auditoria_de_operaciones` AS
    SELECT 
        `b`.`ID` AS `bitacora_id`,
        `b`.`Operacion` AS `Operacion`,
        `b`.`Tabla` AS `Tabla`,
        `b`.`Descripcion` AS `Descripcion`,
        `b`.`Fecha_Registro` AS `Fecha_Registro`,
        `u`.`nombre_usuario` AS `nombre_usuario`,
        CONCAT(`p`.`nombre`, ' ', `p`.`primer_apellido`) AS `nombre_completo`
    FROM
        ((`tbb_bitacora` `b`
        JOIN `tbb_usuarios` `u` ON ((`b`.`Usuario` = `u`.`nombre_usuario`)))
        JOIN `tbb_personas` `p` ON ((`u`.`persona_id` = `p`.`id`)))
    ORDER BY `b`.`Fecha_Registro` DESC
    LIMIT 100