CREATE DEFINER=`root`@`localhost` FUNCTION `fn_numero_aleatorio_rangos`(p_min INT, p_max INT) RETURNS int
    DETERMINISTIC
BEGIN
    RETURN FLOOR(RAND() * (p_max - p_min + 1)) + p_min;
END