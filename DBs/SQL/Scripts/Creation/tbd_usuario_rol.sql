CREATE TABLE `tbd_usuarios_roles` (
  `Usuario_ID` int NOT NULL COMMENT 'Descripción: Identificador del Usuario. Hace referencia a la tabla Usuarios.\nNaturaleza: Cuantitativa\nDominio: Números enteros positivos\nComposición: 1 a 9 dígitos (0-9)',
  `Rol_ID` int NOT NULL COMMENT 'Descripción: Identificador del rol el cual le es asignado a un usuario.\nNaturaleza: Cuantitativa\nDominio: Números enteros positivos\nComposición: 1 a 9 dígitos (0-9)',
  `Estatus` tinyint(1) NOT NULL COMMENT 'Descripción: Dato de Auditoría que define el estatus actual del registro, siendo Activo (1) o Inactivo (0) para uso en el sistema\nNaturaleza: Cuantitativa\nDominio: Booleano\nComposición: [0|1]',
  `Fecha_Registro` datetime NOT NULL COMMENT 'Descripción: Indica la fecha y hora exacta en que la sucursal fue registrada en el sistema. Esta información es importante para llevar un control de la antigüedad de la sucursal y su historial de operaciones.\\\\\\\\nNaturaleza: Cuantitativa\\\\\\\\nDominio:Conjunto de valores permitidos: (Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto).\\\\\\\\nComposicion:\\\\\\\\\\\\\\\\<br>\\\\\\\\\\\\\\\\<br>Año = 4{0-9}4\\\\\\\\\\\\\\\\<br>Mes = [01|02|...|12]\\\\\\\\\\\\\\\\<br>Dia = [01|02|..|31]\\\\\\\\\\\\\\\\<br>\\\\\\\\\\\\\\\\<br>Hora = [00|01|...|23]\\\\\\\\\\\\\\\\<br>Minutos = [00|01|...|59]\\\\\\\\\\\\\\\\<br>Seguntodos = [00|01|...|59]\\\\\\\\\\\\\\\\<br>\\\\\\\\\\\\\\\\<br>Fecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Descripción: Última fecha y hora en que se modificó la información de la sucursal.\\\\nNaturaleza: Cuantitativa\\\\nDominio:Conjunto de valores permitidos: (Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto).\\\\nComposicion:\\\\\\\\<br>\\\\\\\\<br>Año = 4{0-9}4\\\\\\\\<br>Mes = [01|02|...|12]\\\\\\\\<br>Dia = [01|02|..|31]\\\\\\\\<br>\\\\\\\\<br>Hora = [00|01|...|23]\\\\\\\\<br>Minutos = [00|01|...|59]\\\\\\\\<br>Seguntodos = [00|01|...|59]\\\\\\\\<br>\\\\\\\\<br>Fecha_Actualización= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`Usuario_ID`,`Rol_ID`),
  KEY `Rol_ID` (`Rol_ID`),
  CONSTRAINT `tbd_usuarios_roles_ibfk_1` FOREIGN KEY (`Usuario_ID`) REFERENCES `tbb_usuarios` (`id`),
  CONSTRAINT `tbd_usuarios_roles_ibfk_2` FOREIGN KEY (`Rol_ID`) REFERENCES `tbc_roles` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Tabla intermedia que establece la relación entre usuarios y roles, permitiendo asignar múltiples roles a un usuario y definir sus permisos en el sistema.';
