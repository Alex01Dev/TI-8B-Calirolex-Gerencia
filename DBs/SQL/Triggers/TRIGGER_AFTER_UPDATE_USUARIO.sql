CREATE DEFINER=`root`@`localhost` TRIGGER `tbb_usuarios_AFTER_UPDATE` AFTER UPDATE ON `tbb_usuarios` FOR EACH ROW BEGIN
    DECLARE v_usuario_id INT;

    -- Seleccionar aleatoriamente un usuario con rol id = 1
    SELECT Usuario_ID INTO v_usuario_id
    FROM tbd_usuarios_roles
    WHERE Rol_ID = 1
    ORDER BY RAND()
    LIMIT 1;

    -- Insertar en la tabla bitacora
    INSERT INTO tbb_bitacora (Usuario, Operacion, Tabla, Descripcion, Estatus, Fecha_Registro)
    VALUES (v_usuario_id, 'Update', 'tbb_usuarios', CONCAT('Actualizado usuario ID=', OLD.id, ' a ', NEW.id), 1, NOW());
END