CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_calculo_rentabilidad_simple`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    DECLARE v_ingresos DECIMAL(15,2) DEFAULT 0;
    DECLARE v_egresos DECIMAL(15,2) DEFAULT 0;
    DECLARE v_ganancia DECIMAL(15,2) DEFAULT 0;
    DECLARE v_rentabilidad DECIMAL(10,2) DEFAULT 0;
    
    -- Validación básica de fechas
    IF p_fecha_inicio IS NULL OR p_fecha_fin IS NULL OR p_fecha_inicio > p_fecha_fin THEN
        SELECT 'Error: Fechas inválidas. La fecha inicio debe ser menor o igual a fecha fin.' AS Mensaje;
    ELSE
        -- Cálculo de ingresos (solo transacciones de tipo INGRESO)
        SELECT IFNULL(SUM(monto), 0) INTO v_ingresos
        FROM tbb_transacciones
        WHERE tipo_transaccion = 'INGRESO'
          AND fecha_registro BETWEEN p_fecha_inicio AND p_fecha_fin;
        
        -- Cálculo de egresos (solo transacciones de tipo EGRESO)
        SELECT IFNULL(SUM(monto), 0) INTO v_egresos
        FROM tbb_transacciones
        WHERE tipo_transaccion = 'EGRESO'
          AND fecha_registro BETWEEN p_fecha_inicio AND p_fecha_fin;
        
        -- Cálculo de ganancia
        SET v_ganancia = v_ingresos - v_egresos;
        
        -- Cálculo de rentabilidad
        IF v_ingresos > 0 THEN
            SET v_rentabilidad = (v_ganancia / v_ingresos) * 100;
        END IF;
        
        -- Mostrar resultados
        SELECT 
            p_fecha_inicio AS Fecha_Inicio,
            p_fecha_fin AS Fecha_Fin,
            v_ingresos AS Ingresos,
            v_egresos AS Egresos,
            v_ganancia AS Ganancia,
            CASE 
                WHEN v_ganancia < 0 THEN 'PÉRDIDA'
                ELSE 'GANANCIA'
            END AS Tipo_Resultado,
            CONCAT(ROUND(v_rentabilidad, 2), '%') AS Rentabilidad,
            (SELECT COUNT(*) FROM tbb_transacciones 
             WHERE fecha_registro BETWEEN p_fecha_inicio AND p_fecha_fin) AS Total_Transacciones;
    END IF;
END