CREATE DEFINER=`root`@`localhost` EVENT `ev_actualizar_estatus_transacciones` ON SCHEDULE EVERY 5 SECOND STARTS ''2025-04-07 18:18:19'' ON COMPLETION NOT PRESERVE ENABLE DO BEGIN
    UPDATE tbb_transacciones
    SET 
        estatus = ELT(FLOOR(1 + RAND() * 2), ''PAGADA'', ''RECHAZADA''),
        fecha_actualizacion = NOW()
    WHERE 
        estatus = ''PROCESANDO'';
END