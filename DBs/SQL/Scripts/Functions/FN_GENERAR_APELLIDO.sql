CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_apellido`() RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_apellido_generado VARCHAR(100) DEFAULT NULL;
    DECLARE num_aleatorio INT;

    -- Genera un número aleatorio entre 1 y 20
    SET num_aleatorio = fn_numero_aleatorio_rangos(1, 100); 

    -- Lista de apellidos disponibles
    SET v_apellido_generado = ELT(num_aleatorio,
"García", "Rodríguez", "Martínez", "López", "González", "Pérez", "Sánchez", "Ramírez", "Torres", "Flores",
        "Gutiérrez", "Morales", "Rivera", "Cruz", "Hernández", "Vásquez", "Álvarez", "Jiménez", "Mendoza", "Castillo",
        "Ortega", "Reyes", "Delgado", "Romero", "Silva", "Suárez", "Ramos", "Aguilar", "Ortega", "Navarro",
        "Domínguez", "Guerrero", "Cabrera", "Vega", "Herrera", "Méndez", "Ríos", "Valencia", "Carrasco", "Vargas",
        "Paredes", "Escobar", "Fuentes", "Camacho", "Campos", "Montes", "Salazar", "Peña", "León", "Cordero",
        "Acosta", "Mora", "Solís", "Lara", "Rojas", "Beltrán", "Montalvo", "Quintero", "Espinoza", "Bravo",
        "Benítez", "Farías", "Zamora", "Mejía", "Bermúdez", "Pizarro", "Figueroa", "Castañeda", "Arenas", "Toledo",
        "Godoy", "Padilla", "Palacios", "Ponce", "Saavedra", "Sepúlveda", "Urrutia", "Vergara", "Zavala", "Valdés",
        "Valenzuela", "Villarreal", "Huerta", "Cano", "Aguirre", "Arellano", "Salinas", "Peralta", "Barrera", "Bustamante",
        "Cedillo", "Guevara", "Chávez", "Osorio", "Tapia", "Muñoz", "Patiño", "Serrano", "Montoya", "Esquivel");

    RETURN v_apellido_generado;
END