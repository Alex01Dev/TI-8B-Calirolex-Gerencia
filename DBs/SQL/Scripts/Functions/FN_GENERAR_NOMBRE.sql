CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(100) DEFAULT NULL;
    DECLARE num_aleatorio INT;

    -- Genera un número aleatorio entre 1 y 20
    SET num_aleatorio = fn_numero_aleatorio_rangos(1, 20); 

    -- Lista de nombres disponibles
    SET v_nombre_generado = ELT(num_aleatorio,
        "Alina", "Carlos", "Jesús", "Alex", "Marco", "Sofía", "Luis", 
        "María", "Juan", "Ana", "Miguel", "Lucía", "Pedro", "Elena", 
        "Fernando", "Isabel", "Jorge", "Carmen", "Ricardo", "Laura");

    RETURN v_nombre_generado;
END