CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_Generar_Transacciones_Aleatorias`(
    IN p_cantidad INT
)
BEGIN
    -- Declaración de variables
    DECLARE v_usuario_id INT;
    DECLARE v_monto FLOAT;
    DECLARE v_tipo_pago VARCHAR(20); -- Cambiado a VARCHAR para asegurar que coincida con los valores del ENUM
    DECLARE v_tipo_transaccion ENUM('Ingreso', 'Egreso');
    DECLARE v_detalles VARCHAR(500);
    DECLARE v_contador INT DEFAULT 0;
    DECLARE v_servicio VARCHAR(100);

    -- Definir los servicios disponibles
    DECLARE servicios_array TEXT DEFAULT 'Proteina,Agua,Powerade,Electrolit,Suerox,Galletas Proteicas,Creatina,Proteina de chocolate,Proteina de fresa,Collagen I II III V X,Magnesio,Omega 3,Gatorade,Monster,Preetreno,Clase de Pilates,Clase de Zuumba,Clase para alto rendimiento,Masaje,Espa,Consulta de nutricion';

    -- Comienza un bucle para generar transacciones aleatorias
    WHILE v_contador < p_cantidad DO
        -- Seleccionar un usuario aleatorio
        SELECT ID INTO v_usuario_id
        FROM tbb_usuarios
        WHERE ID IN (
            SELECT Usuario_ID FROM tbd_usuarios_roles WHERE Rol_ID = (
                SELECT ID FROM tbc_roles WHERE Nombre = 'Cliente'
            )
        )
        ORDER BY RAND()
        LIMIT 1;

        -- Generar un monto aleatorio
        SET v_monto = ROUND((RAND() * 10000), 2);

        -- Definir el tipo de pago aleatorio (asegurarse de que coincida con los valores del ENUM)
        SET v_tipo_pago = ELT(FLOOR(RAND() * 4) + 1, 'TARJETA_DEBITO',  -- Ahora con guión bajo y mayúsculas
		'TARJETA_CREDITO', 
		'EFECTIVO', 
		'TRANSFERENCIA');

        -- Definir el tipo de transacción aleatorio
        SET v_tipo_transaccion = ELT(FLOOR(RAND() * 2) + 1, 'Ingreso', 'Egreso');

        -- Seleccionar un servicio aleatorio si es Ingreso
        IF v_tipo_transaccion = 'Ingreso' THEN
            SET v_servicio = ELT(FLOOR(RAND() * 21) + 1, 'Proteina','Agua','Powerade','Electrolit','Suerox','Galletas Proteicas','Creatina','Proteina de chocolate','Proteina de fresa','Collagen I II III V X','Magnesio','Omega 3','Gatorade','Monster','Preetreno','Clase de Pilates','Clase de Zuumba','Clase para alto rendimiento','Masaje','Espa','Consulta de nutricion');
        ELSE
            SET v_servicio = 'Pago de nomina';
        END IF;

        -- Generar un detalle aleatorio
        SET v_detalles = CONCAT(v_servicio, ' ', v_tipo_transaccion, ' por ', v_monto);

        -- Insertar la transacción
        INSERT INTO tbb_transacciones (
            Usuario_ID, Detalles, Tipo_Transaccion, Metodo_Pago, Monto, Estatus, Fecha_Registro, Fecha_Actualizacion
        ) VALUES (
            v_usuario_id, v_detalles, v_tipo_transaccion, v_tipo_pago, v_monto, 'Procesando', NOW(), NOW()
        );

        -- Incrementar el contador
        SET v_contador = v_contador + 1;
    END WHILE;
END