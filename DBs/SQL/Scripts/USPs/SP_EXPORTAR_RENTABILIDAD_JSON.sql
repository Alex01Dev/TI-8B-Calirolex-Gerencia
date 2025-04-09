CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_exportar_rentabilidad_json`(
    IN p_fecha_inicio DATE,
    IN p_fecha_fin DATE
)
BEGIN
    DECLARE v_ingresos DECIMAL(15,2) DEFAULT 0;
    DECLARE v_egresos DECIMAL(15,2) DEFAULT 0;
    DECLARE v_ganancia DECIMAL(15,2) DEFAULT 0;
    DECLARE v_rentabilidad DECIMAL(10,2) DEFAULT 0;
    DECLARE v_path VARCHAR(255);
    
    -- Ruta para el archivo JSON de salida
    SET v_path = CONCAT('C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/rentabilidad_', p_fecha_inicio, '_', p_fecha_fin, '.json');
    
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
        
        -- Exportar los resultados en formato JSON
        SET @sql = CONCAT(
            "SELECT JSON_OBJECT(
                'fecha_inicio', '", p_fecha_inicio, "',
                'fecha_fin', '", p_fecha_fin, "',
                'ingresos', ", v_ingresos, ",
                'egresos', ", v_egresos, ",
                'ganancia', ", v_ganancia, ",
                'rentabilidad', CONCAT(ROUND(", v_rentabilidad, ", 2), '%'),
                'tipo_resultado', CASE WHEN ", v_ganancia, " < 0 THEN 'PÉRDIDA' ELSE 'GANANCIA' END,
                'total_transacciones', (SELECT COUNT(*) FROM tbb_transacciones 
                                        WHERE fecha_registro BETWEEN '", p_fecha_inicio, "' AND '", p_fecha_fin, "')
            ) INTO OUTFILE '", v_path, "'
            CHARACTER SET utf8mb4
            FIELDS TERMINATED BY ''
            LINES TERMINATED BY '\\n';"
        );

        PREPARE stmt FROM @sql;
        EXECUTE stmt;
        DEALLOCATE PREPARE stmt;

        -- Confirmación de archivo exportado
        SELECT 'Archivo exportado correctamente a: ' AS Mensaje, v_path AS Ruta_Archivo;
    END IF;
END