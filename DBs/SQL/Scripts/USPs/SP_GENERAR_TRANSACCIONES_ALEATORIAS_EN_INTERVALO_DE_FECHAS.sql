CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_generar_transacciones_aleatorias_custom`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE,
    IN p_total_transacciones INT
)
BEGIN
    DECLARE v_usuario_id INT;
    DECLARE v_monto FLOAT;
    DECLARE v_tipo_transaccion ENUM('INGRESO','EGRESO');
    DECLARE v_metodo_pago ENUM('TARJETA_DEBITO','TARJETA_CREDITO','EFECTIVO','TRANSFERENCIA');
    DECLARE v_estatus ENUM('PROCESANDO','PAGADA','CANCELADA','RECHAZADA');
    DECLARE v_detalles VARCHAR(255);
    DECLARE v_fecha_registro DATETIME;
    DECLARE v_contador INT DEFAULT 0;
    DECLARE v_max_usuarios INT;
    DECLARE v_servicio VARCHAR(100);

    -- Servicios ejemplo
    DECLARE servicios_array TEXT DEFAULT 'Proteina,Agua,Creatina,Zumba,Masaje,Nutricion,Gatorade,Consulta,Electrolit,Energizante';

    -- Validar fechas
    IF p_fecha_inicio IS NULL OR p_fecha_fin IS NULL OR p_fecha_inicio > p_fecha_fin THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Fechas inválidas. La fecha de inicio debe ser menor o igual a la fecha de fin.';
    END IF;

    -- Obtener total de usuarios
    SELECT COUNT(*) INTO v_max_usuarios FROM tbb_usuarios;

    -- Validar que haya usuarios
    IF v_max_usuarios = 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No hay usuarios registrados en la tabla tbb_usuarios.';
    END IF;

    -- Bucle de inserción
    WHILE v_contador < p_total_transacciones DO
        -- Usuario aleatorio
        SELECT id INTO v_usuario_id
        FROM tbb_usuarios
        ORDER BY RAND()
        LIMIT 1;

        -- Monto aleatorio
        SET v_monto = ROUND(10 + (RAND() * 4990), 2);

        -- Tipo de transacción aleatorio
        SET v_tipo_transaccion = ELT(FLOOR(1 + RAND() * 2), 'INGRESO', 'EGRESO');

        -- Método de pago aleatorio
        SET v_metodo_pago = ELT(FLOOR(1 + RAND() * 4), 'TARJETA_DEBITO', 'TARJETA_CREDITO', 'EFECTIVO', 'TRANSFERENCIA');

        -- Estatus aleatorio
        SET v_estatus = 'PROCESANDO';

        -- Servicio aleatorio
        SET v_servicio = ELT(FLOOR(1 + RAND() * 10), 'Proteina','Agua','Creatina','Zumba','Masaje','Nutricion','Gatorade','Consulta','Electrolit','Energizante');

        -- Fecha aleatoria en el rango
        SET v_fecha_registro = DATE_ADD(p_fecha_inicio, INTERVAL FLOOR(RAND() * DATEDIFF(p_fecha_fin, p_fecha_inicio)) DAY);

        -- Detalles
        SET v_detalles = CONCAT(v_servicio, ' - ', v_tipo_transaccion, ' - $', v_monto);

        -- Inserción
        INSERT INTO tbb_transacciones (
            usuario_id, detalles, tipo_transaccion, metodo_pago, monto, estatus, fecha_registro, fecha_actualizacion
        ) VALUES (
            v_usuario_id, v_detalles, v_tipo_transaccion, v_metodo_pago, v_monto, v_estatus, v_fecha_registro, NOW()
        );

        -- Incrementar contador
        SET v_contador = v_contador + 1;
    END WHILE;
END