CREATE DEFINER=`root`@`localhost` FUNCTION `fn_genera_nombre_simple`(genero CHAR(1)) RETURNS varchar(100) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE v_nombre_generado VARCHAR(100) DEFAULT NULL;
    DECLARE num_aleatorio INT;

    -- Genera un número aleatorio entre 1 y 100
    SET num_aleatorio = fn_numero_aleatorio_rangos(1, 100);

    IF genero = 'H' THEN 
        SET v_nombre_generado = ELT(num_aleatorio,
            "Alejandro", "Alonso", "Andrés", "Antonio", "Armando", "Arturo", "Benjamín", "Bruno", "Camilo", "Carlos",
            "Cristian", "Daniel", "David", "Diego", "Eduardo", "Emilio", "Emmanuel", "Enrique", "Esteban", "Ezequiel",
            "Fabián", "Felipe", "Fernando", "Francisco", "Gabriel", "Germán", "Gilberto", "Guillermo", "Gustavo", "Héctor",
            "Horacio", "Hugo", "Ignacio", "Isaac", "Ismael", "Iván", "Jaime", "Javier", "Jesús", "Joaquín",
            "Jorge", "José", "Juan", "Julio", "Kevin", "Leandro", "Leonardo", "Lorenzo", "Luis", "Manuel",
            "Marcos", "Martín", "Mateo", "Matías", "Mauricio", "Maximiliano", "Miguel", "Nicolás", "Omar", "Orlando",
            "Oscar", "Pablo", "Patricio", "Pedro", "Rafael", "Ramón", "Raúl", "Ricardo", "Roberto", "Rodrigo",
            "Rogelio", "Román", "Romeo", "Rubén", "Salvador", "Samuel", "Santiago", "Sebastián", "Sergio", "Teodoro",
            "Tomás", "Uriel", "Valentín", "Vicente", "Víctor", "Wilfredo", "William", "Xavier", "Yahir", "Yandel",
            "Zacarías", "Abel", "Adrián", "Braulio", "Baltasar", "César", "Damián", "Efraín", "Fausto", "Genaro"
        );

    ELSE
        SET v_nombre_generado = ELT(num_aleatorio,
            "Abigail", "Adriana", "Alejandra", "Alicia", "Ana", "Andrea", "Angela", "Antonia", "Aurora", "Beatriz",
            "Belén", "Blanca", "Brenda", "Camila", "Carla", "Carmen", "Carolina", "Cecilia", "Clara", "Claudia",
            "Concepción", "Cristina", "Daniela", "Diana", "Dolores", "Elena", "Elizabeth", "Emilia", "Esperanza", "Estefanía",
            "Estela", "Eugenia", "Eva", "Fabiola", "Fernanda", "Flor", "Francisca", "Gabriela", "Gloria", "Graciela",
            "Guadalupe", "Helena", "Inés", "Irene", "Isabel", "Jacqueline", "Jimena", "Josefina", "Juana", "Julia",
            "Karen", "Laura", "Leticia", "Liliana", "Lorena", "Lucía", "Luisa", "Luz", "Magdalena", "Manuela",
            "Marcela", "Margarita", "María", "Mariana", "Marina", "Marta", "Mercedes", "Micaela", "Miriam", "Monserrat",
            "Natalia", "Norma", "Olga", "Patricia", "Paula", "Paulina", "Pilar", "Raquel", "Rebeca", "Rocío",
            "Rosalía", "Rosario", "Sandra", "Sara", "Silvia", "Sofía", "Susana", "Teresa", "Valentina", "Vanessa",
            "Verónica", "Victoria", "Virginia", "Ximena", "Yesenia", "Yolanda", "Zaira", "Zulema", "Amalia", "Berta"
        );
    END IF;

    RETURN v_nombre_generado;
END