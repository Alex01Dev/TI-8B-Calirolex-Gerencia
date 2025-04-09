CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_bandera_porcentaje`(porcentaje int) RETURNS tinyint(1)
    DETERMINISTIC
BEGIN
	declare flag boolean;
    
    if porcentaje < 0 or porcentaje > 100 then
		signal sqlstate '45000'
        set message_text = 'El porcentaje debe estar entre 0 y 100';
	end if;
    
    set flag = (rand() * 100 < porcentaje);

RETURN flag;
END