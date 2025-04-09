CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Generar_Personas_Usuarios_Clientes_Colaboradores`(
    IN p_cantidad INT
)
BEGIN
    -- Declaración de variables
    DECLARE v_persona_id INT;
    DECLARE v_rol_id INT;
    DECLARE v_usuario_id INT;
    DECLARE v_contador INT DEFAULT 0;
    DECLARE v_nombre_usuario VARCHAR(255);
    DECLARE v_correo_electronico VARCHAR(255);
    DECLARE v_titulo_cortesia VARCHAR(20);
    DECLARE v_genero CHAR(1);
    DECLARE v_nombre VARCHAR(100);

    -- Bucle para generar las personas y usuarios
    WHILE v_contador < p_cantidad DO
        -- Generar el género primero
        SET v_genero = ELT(FLOOR(RAND() * 2) + 1, 'H', 'M');

        -- Generar el título de cortesía basado en el género
        SET v_titulo_cortesia = fn_genera_titulo_cortesia(v_genero);

        -- Generar el nombre basado en el género
        SET v_nombre = fn_genera_nombre_simple(v_genero);

        -- Generar otros datos realistas para la persona
        SET @primer_apellido = fn_genera_apellido();
        SET @segundo_apellido = fn_genera_apellido();
        SET @fecha_nacimiento = DATE_ADD('1980-01-01', INTERVAL FLOOR(RAND() * 15000) DAY); 
        SET @numero_telefonico = CONCAT('555', LPAD(FLOOR(RAND() * 10000000), 7, '0'));
        SET @tipo_sangre = ELT(FLOOR(RAND() * 8) + 1, 
            'A_POSITIVO', 'A_NEGATIVO', 'B_POSITIVO', 'B_NEGATIVO', 
            'O_POSITIVO', 'O_NEGATIVO', 'AB_POSITIVO', 'AB_NEGATIVO');

        -- Generar un nombre de usuario único
        SET v_nombre_usuario = LOWER(CONCAT(v_nombre, '.', @primer_apellido));
        WHILE EXISTS (SELECT 1 FROM tbb_usuarios WHERE Nombre_Usuario = v_nombre_usuario) DO
            SET v_nombre_usuario = CONCAT(v_nombre_usuario, FLOOR(RAND() * 1000));
        END WHILE;

        -- Generar un correo electrónico único
        SET v_correo_electronico = CONCAT(LOWER(v_nombre), '.', LOWER(@primer_apellido), '@example.com');
        WHILE EXISTS (SELECT 1 FROM tbb_usuarios WHERE Correo_Electronico = v_correo_electronico) DO
            SET v_correo_electronico = CONCAT(LOWER(v_nombre), '.', LOWER(@primer_apellido), FLOOR(RAND() * 1000), '@example.com');
        END WHILE;

        -- Insertar la persona
        INSERT INTO tbb_personas (
            Titulo_Cortesia, Nombre, Primer_Apellido, Segundo_Apellido, Fecha_Nacimiento,
            Numero_Telefonico, Genero, Tipo_Sangre, Estatus, Fecha_Registro
        ) VALUES (
            v_titulo_cortesia, v_nombre, @primer_apellido, @segundo_apellido, @fecha_nacimiento,
            @numero_telefonico, v_genero, @tipo_sangre, 'Activo', NOW()
        );

        -- Obtener el ID de la persona recién creada
        SET v_persona_id = LAST_INSERT_ID();

        -- Insertar el usuario asociado a la persona
        INSERT INTO tbb_usuarios (
            Persona_ID, Nombre_Usuario, Correo_Electronico, Contrasena, Estatus, Fecha_Registro
        ) VALUES (
            v_persona_id, v_nombre_usuario, v_correo_electronico,
            SHA2('password123', 256), 'Activo', NOW()
        );

        -- Obtener el ID del usuario recién creado
        SET v_usuario_id = LAST_INSERT_ID();

        -- Asignar rol aleatorio entre Cliente (2) y Colaborador (4)
        SET v_rol_id = ELT(FLOOR(1 + RAND() * 2), 2, 4);

        -- Asignar el rol al usuario
        INSERT INTO tbd_usuarios_roles (
            Usuario_ID, Rol_ID, Estatus, Fecha_Registro
        ) VALUES (
            v_usuario_id, v_rol_id, TRUE, NOW()
        );

        -- Incrementar el contador
        SET v_contador = v_contador + 1;
    END WHILE;
END