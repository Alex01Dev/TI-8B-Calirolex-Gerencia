CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `info_sucursal_responsable` AS
    SELECT 
        `s`.`id` AS `sucursal_id`,
        `s`.`Nombre` AS `nombre_sucursal`,
        `s`.`Direccion` AS `Direccion`,
        `s`.`Telefono` AS `Telefono`,
        `s`.`Capacidad_Maxima` AS `Capacidad_Maxima`,
        CONCAT(`p`.`nombre`, ' ', `p`.`primer_apellido`) AS `responsable`,
        `p`.`numero_telefonico` AS `telefono_responsable`
    FROM
        (`tbc_sucursales` `s`
        JOIN `tbb_personas` `p` ON ((`s`.`Responsable_Id` = `p`.`id`)))
    WHERE
        (`s`.`Estatus` = 'ACTIVA')