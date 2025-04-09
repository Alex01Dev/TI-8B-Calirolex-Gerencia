CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_titulo_cortesia`(genero CHAR(1)) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE titulo_generado VARCHAR(20) DEFAULT NULL;
    DECLARE bandera_titulo BOOLEAN DEFAULT (fn_genera_bandera_porcentaje(25));

    IF bandera_titulo THEN
    IF genero = 'H' THEN
        SET titulo_generado = ELT(fn_numero_aleatorio_rangos(1, 20),
            'Sr.', 'Joven', 'Dr.', 'Mtr.', 'Lic.', 'Profr.', 'C.', 'C.P.', 'Med.', 'LAE', 
            'Ing.', 'Arq.', 'Gral.', 'Cnel.', 'Tte.', 'Almte.', 'Pdte.', 'Sen.', 'Dip.', 'Dir.');
    ELSE
        SET titulo_generado = ELT(fn_numero_aleatorio_rangos(1, 20),
            'Sra.', 'Srita.', 'Dra.', 'Mtra.', 'Lic.', 'Profra.', 'C.', 'C.P.', 'Med.', 'LAE', 
            'Ing.', 'Arq.', 'Gral.', 'Cnel.', 'Tte.', 'Almte.', 'Pdta.', 'Sen.', 'Dip.', 'Dir.');
		END IF;
	END IF;

    RETURN titulo_generado;
END