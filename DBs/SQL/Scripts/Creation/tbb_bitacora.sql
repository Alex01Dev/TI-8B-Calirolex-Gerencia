CREATE TABLE `tbb_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Descripción: Atributo identificador entero autoincremental que distingue de manera única la bitacora.<br>Dominio: Cuantitativo<br>Naturaleza: Enteros Positivos<br>Composición: 1 (0-9)',
  `Usuario` varchar(50) NOT NULL COMMENT 'Descripción:Identificador del Usuario. Hace referencia a la tabla Usuarios.<br>Naturaleza: Cuantitativa<br>Dominio:Números enteros positivos<br>Composición:1 a 9 dígitos (0-9)',
  `Operacion` enum('Create','Read','Update','Delete') NOT NULL COMMENT 'Descripcion: Datos alusivo al tipo de accion realizado las cuales forman parte de operaciones CRUD\\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\nDominio: Conjunto de valoesr Permitidos\\\\\\\\\\\\\\\\nComposicion: \\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nOperacion = [''Create'',''Read'',''Update'', ''Delete''] ',
  `Tabla` varchar(50) NOT NULL COMMENT 'Descripción: Lugar de origen donde se realizo dicha acción o modificació. \\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\nDominio: Caracteres alfabéticos, tildes y signos de puntuación\\\\\\\\\\\\\\\\nComposición: 1{A-z| | .|,|}50',
  `Descripcion` text COMMENT 'Descripción: Información quejustifica las acciones realizadas por un usuario. \\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\nDominio: Caracteres alfabéticos, tildes y signos de puntuación\\\\\\\\\\\\\\\\nComposición: {A-z| | .|,|}',
  `Estatus` bit(1) DEFAULT b'1' COMMENT 'Descripcion: Dato de Auditoria que define el estatus actual del regitro, siendo 0 para un datos no activos y 1 para datos activos para uso en el sistema\\\\\\\\\\\\\\\\nNaturaleza: Cuantativo\\\\\\\\\\\\\\\\nDominio: Booleano\\\\\\\\\\\\\\\\nComposicion: [0|1]\\\\\\\\\\\\\\\\n',
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena un historial de eventos o acciones realizadas dentro del sistema, permitiendo el seguimiento de actividades. Cada registro en la bitácora está vinculado a un usuario.';
CREATE TABLE `tbb_personas` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Descripcion: Atributo identificador numero auto incremental que distingue de manera unica a la persona. \\\\nNaturaleza: Cuantitativo\\\\nDominio: Enteos positivos\\\\nComposicion: 1{0-9}',
  `titulo_cortesia` varchar(20) DEFAULT NULL COMMENT 'Descripcion: Abreviatur o Palabra de Cortesia para dirigirse de manera formal a la persona, por ejemplo:Sr., Sra.,Ing., Dra, etc.\\\\nNaturaleza: Cualitativa \\\\nDominio: Caracteres Alfanumericos y puntos (.)\\\\nComposicion: 0{A-Z|a-z|.}20',
  `nombre` varchar(80) NOT NULL COMMENT 'Descripcion: Valos asociado a la persona dentro de su registro civil\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, vocales con tilde, espacios separados \\\\\\\\nComposicion: 0{A-Z|a-z| |}80',
  `primer_apellido` varchar(80) NOT NULL COMMENT 'Descripcion: Valos asociado a la persona dentro de su registro civil, generalmente conocido como Apellido Paterno\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, vocales con tilde, espacios separados \\\\\\\\nComposicion: 0{A-Z|a-z| |}80',
  `segundo_apellido` varchar(80) DEFAULT NULL COMMENT 'Descripcion: Valos asociado a la persona dentro de su registro civil, generalmente conocido como Apellido Materno\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, vocales con tilde, espacios separados \\\\\\\\nComposicion: 0{A-Z|a-z| |}80',
  `fecha_nacimiento` date NOT NULL COMMENT 'Descripcion: Fecha que determina la edad de la persona, indicado el dia, mes y año de natalicio\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\nFecha_Nacimiento = Año+''-''+Mes+''-''+Diaa',
  `fotografia` varchar(100) DEFAULT NULL COMMENT 'Descripcion: Nombre y extension del archivo de la imagen de portada de la persona.\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, mas la extension permitida de imagenes como .jpg, .png, etc. \\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nNombre_Archivo = 0{A-z|0-9}96\\\\\\\\nExtension_Archivo = 0{A-z}4\\\\\\\\nFotografia = Nombre_Archivo+''-''+Extension_Archivo',
  `numero_telefonico` varchar(20) DEFAULT NULL COMMENT 'Descripción: Datos alusivos al número de teléfono de la persona\\\\nNaturaleza: Cualitativo\\\\nDominio: Cadena de caracteresTeléfono = [Código de País, Código de Área, Número de Teléfono, Extensión (opcional)]',
  `genero` enum('H','M','NB') NOT NULL COMMENT 'Descripcion: Datos alusivo al genero biologico de la persona\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\nDominio: Conjunto de valoesr Permitidos\\\\\\\\nComposicion: \\\\\\\\n\\\\\\\\nGenero = [''H'',''M'',''N/B''] ',
  `tipo_sangre` enum('A_POSITIVO','A_NEGATIVO','B_POSITIVO','B_NEGATIVO','AB_POSITIVO','AB_NEGATIVO','O_POSITIVO','O_NEGATIVO') NOT NULL COMMENT 'Descripcion: Datos referentes al tipo y grupo sanguineo\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nDominio: Conjunto de valores Permitidos\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nComposicion: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nTipo_Sangre = [''A_Positivo'', ''A_Negativo'', ''B_Positivo'', ''B_Negativo'', ''AB_Positivo'', ''AB_Negativo'', ''O_Positivo'', ''O_Negativo''] ',
  `estatus` enum('Activo','Inactivo') NOT NULL COMMENT 'Descripcion: Dato de Auditoria que define el estatus actual del regitro, siendo 0 para un datos no activos y 1 para datos activos para uso en el sistema\\\\\\\\nNaturaleza: Cuantativo\\\\\\\\nDominio: Booleano\\\\\\\\nComposicion: [0|1]\\\\\\\\n',
  `fecha_registro` datetime NOT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de la ultima modificacion del registro\\\\nNaturaleza: Cuantitativo\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\nComposicion:\\\\n\\\\n\\\\nAño = 4{0-9}4\\\\nMes =  [01|02|...|12]\\\\nDia =  [01|02|..|31]\\\\n\\\\nHora = [00|01|...|23]\\\\nMinutos = [00|01|...|59]\\\\nSeguntodos = [00|01|...|59]\\\\n\\\\nFecha_Actualizacion = Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`id`),
  KEY `ix_tbb_personas_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=796 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla almacenara los datos de las personas asociadas a los usuarios de la plataforma de administracion de gimnasio, es importante denotar que la presona es una superentidad de : USUARIOS';
CREATE TABLE `tbb_transacciones` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Descripción: Atributo numérico autoincremental que distingue de manera única a la transacción realizada por o hacia un usuario.\nNaturaleza: Cuantitativo.\nDominio: Entero Positivo.\nComposición: 1{0-1}',
  `usuario_id` int NOT NULL COMMENT 'Descripción: Atributo numérico que identifica de manera única a un usuario del gimnasio que realiza o se le realiza la transacción.\\nNaturaleza: Cuantitativo.\\nDominio: Entero Positivo.\\nComposición: 1{0-1}',
  `detalles` varchar(255) NOT NULL COMMENT 'Descripción: Información redacta la razón de una transacción.\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\nDominio: Caracteres alfanuméricos\\\\\\\\nComposición: 1{A-z|0-9|'' ''}255',
  `tipo_transaccion` enum('INGRESO','EGRESO') NOT NULL COMMENT 'Descripción: Indica si la transacción corresponde a un ingreso o un egreso de dinero.\\nNaturaleza: Cualitativo.\\nDominio: Conjunto de valores permitidos.\\nComposición: [''Ingreso'',''Egreso'']',
  `metodo_pago` enum('TARJETA_DEBITO','TARJETA_CREDITO','EFECTIVO','TRANSFERENCIA') NOT NULL COMMENT 'Descripción: Almacena la información de pago de un usuario o cliente.\\nNaturaleza: Cualitativo.\\nDominio: Conjunto de valores predeterminados.\\nComposición: [''TARJETA_DEBITO'', ''TARJETA_CREDITO'', ''EFECTIVO'',''TRANSFERENCIA'']',
  `monto` float NOT NULL COMMENT 'Descripción: Determina la cantidad monetaria a pagar por un usuario.\\nNaturaleza: Cuantitativo.\\nDominio: Números enteros, números decimales y punto.\\nComposición: Número_entero = 1{0-9}10\\nPunto_decimal = [.]\\nNúmero_decimal = 0{0-9}2\\nMonto = Número_entero + Punto + Número_decimal',
  `estatus` enum('PROCESANDO','PAGADA','CANCELADA','RECHAZADA') NOT NULL COMMENT 'Descripción: Dato de auditoría que define el estatus de la transacción.\nNaturaleza: Cualitativo.\nDominio: Conjunto de valores permitidos.\nComposición: [''Cancelada'', ''Pagada'', ''Procesando'']',
  `fecha_registro` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\\\\\\\\\nComposicion:\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nAño = 4{0-9}4\\\\\\\\\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nHora = [00|01|...|23]\\\\\\\\\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de la ultima modificacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Actualizacion = Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`id`),
  KEY `usuario_id` (`usuario_id`),
  KEY `ix_tbb_transacciones_id` (`id`),
  CONSTRAINT `tbb_transacciones_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `tbb_usuarios` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41835 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Registra las operaciones financieras o movimientos dentro del sistema, como pagos o compras. Cada transacción está asociada a un usuario que la realiza.';
CREATE TABLE `tbb_usuarios` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Descripcion: Atributo identificador numero auto incremental que distingue de manera unica al usuario.\\nNaturaleza: Cuantitativo\\nDominio: Enteos positivos\\nComposicion: 1{0-9}',
  `persona_id` int NOT NULL COMMENT 'Descripcion: Identificador de la persona asociada al cliente. Relaciona con la tabla tbb_personas.\\\\nNaturaleza: Cuantitativa\\\\nDominio: Enteros positivos\\\\nComposicion: 1{0-9}',
  `nombre_usuario` varchar(60) NOT NULL COMMENT 'Descripción: Nombre que es generado por el sistema y asignado a una persona.\\\\nNaturaleza: Cualitativo\\\\nDominio: Cadena de texto, vocales con tilde, espacios separados\\\\nComposicion: 0{A-z| |}60z',
  `correo_electronico` varchar(100) NOT NULL COMMENT 'Descripción: Datos alusivos al correo electrónico de la persona\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\nDominio: Cadena de caracteres\\\\\\\\nComposición:\\\\\\\\nCorreo Electrónico = [Usuario, Dominio, Extensión]',
  `contrasena` varchar(128) NOT NULL COMMENT 'Descripción: Clave de seguridad reservada la cual permite un acceso seguro al sistema.\\\\nNaturaleza:Cualitativo\\\\nDominio: Caracteres alfanumericos\\\\nComposición: 0{A-z|0-9}40',
  `estatus` enum('Activo','Inactivo') NOT NULL COMMENT 'Descripcion: Dato de Auditoria que define el estatus actual del regitro, siendo 0 para un datos no activos y 1 para datos activos para uso en el sistema\\\\\\\\\\\\\\\\nNaturaleza: Cuantativo\\\\\\\\\\\\\\\\nDominio: Booleano\\\\\\\\\\\\\\\\nComposicion: [0|1]\\\\\\\\\\\\\\\\n',
  `fecha_registro` datetime NOT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\\\\\\\\\nComposicion:\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nAño = 4{0-9}4\\\\\\\\\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nHora = [00|01|...|23]\\\\\\\\\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de la ultima modificacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Actualizacion = Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uq_nombre_usuario` (`nombre_usuario`),
  UNIQUE KEY `uq_correo_electronico` (`correo_electronico`),
  KEY `persona_id` (`persona_id`),
  CONSTRAINT `tbb_usuarios_ibfk_1` FOREIGN KEY (`persona_id`) REFERENCES `tbb_personas` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=790 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa a una persona registrada en el sistema con credenciales de acceso. Depende de la entidad Persona, ya que hereda sus datos básicos.';
CREATE TABLE `tbc_roles` (
  `ID` int NOT NULL AUTO_INCREMENT COMMENT 'Descripcion: Atributo identificador numero auto incremental que distingue de manera unica un rol. \nNaturaleza: Cuantitativo\nDominio: Enteros positivos\nComposicion: 1{0-9}',
  `Nombre` varchar(60) NOT NULL COMMENT 'Descripcion: Abreviatura o Palabra que determina el cargo que tiene una persona o usuario dentro del gimnasio, cargos tales como cliente, colaborador, administrador, entrenador... etc.\nNaturaleza: Cualitativa\nDominio: Caracteres Alfanumericos y puntos (.)\nComposicion: 0{A-Z|a-z|.}60',
  `Descripcion` text NOT NULL COMMENT 'Descripción: Información que dicta lo que realiza este rol.\nNaturaleza: Cualitativo\nDominio: Caracteres alfabéticos, tildes y signos de puntuación\nComposición: {A-z| | .|,|}',
  `Estatus` tinyint(1) NOT NULL COMMENT 'Descripcion: Dato de Auditoria que define el estatus actual del regitro, siendo 0 para un datos no activos y 1 para datos activos para uso en el sistema\\\\\\\\nNaturaleza: Cuantativo\\\\\\\\nDominio: Booleano\\\\\\\\nComposicion: [0|1]\\\\\\\\n',
  `Fecha_Registro` datetime NOT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de la ultima modificacion del registro\\\\nNaturaleza: Cuantitativo\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\nComposicion:\\\\n\\\\n\\\\nAño = 4{0-9}4\\\\nMes =  [01|02|...|12]\\\\nDia =  [01|02|..|31]\\\\n\\\\nHora = [00|01|...|23]\\\\nMinutos = [00|01|...|59]\\\\nSeguntodos = [00|01|...|59]\\\\n\\\\nFecha_Actualizacion = Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Define los permisos y responsabilidades que un usuario puede tener dentro del sistema, determinando su nivel de acceso y acciones permitidas.';
CREATE TABLE `tbc_sucursales` (
  `Id` int NOT NULL AUTO_INCREMENT COMMENT 'Descripción: Atributo identificador entero autoincremental que distingue de manera única a la sucursal.<br>Dominio: Cuantitativo<br>Naturaleza: Enteros Positivos<br>Composición: 1 (0-9)',
  `Nombre` varchar(60) NOT NULL COMMENT 'Descripción: Contiene el nombre de la sucursal registrada en el sistema. Es un atributo obligatorio para identificar a la sucursal.\\\\\\\\<br>Naturaleza:Cualitativa.\\\\\\\\<br>Dominio: Caracteres alfabéticos (A-Z, a-z) y espacios en blanco.\\\\\\\\<br>Composición: 0{A-z| |}60',
  `Direccion` varchar(150) NOT NULL COMMENT 'Descripción: Guarde la dirección física donde se encuentra la sucursal.\\\\\\\\<br>Naturaleza:Cualitativa.\\\\\\\\<br>Dominio: Caracteres alfanuméricos y símbolos de dirección y espacios en blanco.\\\\\\\\<br>Composición: 0{A-z| |0-9}150',
  `Responsable_Id` int NOT NULL COMMENT 'Descripción:Identificador del Gerente responsable de la sucursal. Hace referencia a la tabla Usuario_Roles.<br>Naturaleza: Cuantitativa<br>Dominio:Números enteros positivos<br>Composición:1 a 9 dígitos (0-9)',
  `Capacidad_Maxima` int NOT NULL COMMENT 'Descripción:Número máximo de clientes permitidos en la sucursal.\\\\nNaturaleza:Cuantitativa\\\\nDominio:Números enteros positivos\\\\nComposición:1 a 9 dígitos (0-9)',
  `Horario_Disponibilidad` text NOT NULL COMMENT 'Descripción:Contiene información detallada sobre los horarios de apertura y cierre de la sucursal.\nNaturaleza:Cualitativa\nDominio:Texto libre con caracteres alfanuméricos y símbolos\nComposición: 0{A-z|0-9}255',
  `Estatus` tinyint(1) NOT NULL COMMENT 'Descripción:Indica si la sucursal está activa (1) o inactiva (0).\\\\\\\\<br>Naturaleza:Cuantitativa\\\\\\\\<br>Dominio: Valores binarios (0 o 1)\\\\\\\\<br>Composición:1 dígito (0,1)',
  `Fecha_Registro` datetime NOT NULL COMMENT 'Descripción: Indica la fecha y hora exacta en que la sucursal fue registrada en el sistema. Esta información es importante para llevar un control de la antigüedad de la sucursal y su historial de operaciones.\\\\nNaturaleza: Cuantitativa\\\\nDominio:Conjunto de valores permitidos: (Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto).\\\\nComposicion:\\\\\\\\<br>\\\\\\\\<br>Año = 4{0-9}4\\\\\\\\<br>Mes = [01|02|...|12]\\\\\\\\<br>Dia = [01|02|..|31]\\\\\\\\<br>\\\\\\\\<br>Hora = [00|01|...|23]\\\\\\\\<br>Minutos = [00|01|...|59]\\\\\\\\<br>Seguntodos = [00|01|...|59]\\\\\\\\<br>\\\\\\\\<br>Fecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `Fecha_Actualizacion` datetime DEFAULT NULL COMMENT 'Descripción: Última fecha y hora en que se modificó la información de la sucursal.\\nNaturaleza: Cuantitativa\\nDominio:Conjunto de valores permitidos: (Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto).\\nComposicion:\\\\<br>\\\\<br>Año = 4{0-9}4\\\\<br>Mes = [01|02|...|12]\\\\<br>Dia = [01|02|..|31]\\\\<br>\\\\<br>Hora = [00|01|...|23]\\\\<br>Minutos = [00|01|...|59]\\\\<br>Seguntodos = [00|01|...|59]\\\\<br>\\\\<br>Fecha_Actualización= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`Id`),
  KEY `Responsable_Id` (`Responsable_Id`),
  CONSTRAINT `tbc_sucursales_ibfk_1` FOREIGN KEY (`Responsable_Id`) REFERENCES `tbd_usuarios_roles` (`Usuario_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Representa una unidad operativa dentro del negocio, encargada de ofrecer servicios o productos.';
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
CREATE TABLE `tbb_bitacora` (
  `ID` int unsigned NOT NULL AUTO_INCREMENT COMMENT 'Descripción: Atributo identificador entero autoincremental que distingue de manera única la bitacora.<br>Dominio: Cuantitativo<br>Naturaleza: Enteros Positivos<br>Composición: 1 (0-9)',
  `Usuario` varchar(50) NOT NULL COMMENT 'Descripción:Identificador del Usuario. Hace referencia a la tabla Usuarios.<br>Naturaleza: Cuantitativa<br>Dominio:Números enteros positivos<br>Composición:1 a 9 dígitos (0-9)',
  `Operacion` enum('Create','Read','Update','Delete') NOT NULL COMMENT 'Descripcion: Datos alusivo al tipo de accion realizado las cuales forman parte de operaciones CRUD\\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\nDominio: Conjunto de valoesr Permitidos\\\\\\\\\\\\\\\\nComposicion: \\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\nOperacion = [''Create'',''Read'',''Update'', ''Delete''] ',
  `Tabla` varchar(50) NOT NULL COMMENT 'Descripción: Lugar de origen donde se realizo dicha acción o modificació. \\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\nDominio: Caracteres alfabéticos, tildes y signos de puntuación\\\\\\\\\\\\\\\\nComposición: 1{A-z| | .|,|}50',
  `Descripcion` text COMMENT 'Descripción: Información quejustifica las acciones realizadas por un usuario. \\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\nDominio: Caracteres alfabéticos, tildes y signos de puntuación\\\\\\\\\\\\\\\\nComposición: {A-z| | .|,|}',
  `Estatus` bit(1) DEFAULT b'1' COMMENT 'Descripcion: Dato de Auditoria que define el estatus actual del regitro, siendo 0 para un datos no activos y 1 para datos activos para uso en el sistema\\\\\\\\\\\\\\\\nNaturaleza: Cuantativo\\\\\\\\\\\\\\\\nDominio: Booleano\\\\\\\\\\\\\\\\nComposicion: [0|1]\\\\\\\\\\\\\\\\n',
  `Fecha_Registro` datetime DEFAULT CURRENT_TIMESTAMP COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2401 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Almacena un historial de eventos o acciones realizadas dentro del sistema, permitiendo el seguimiento de actividades. Cada registro en la bitácora está vinculado a un usuario.';
CREATE TABLE `tbb_personas` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT 'Descripcion: Atributo identificador numero auto incremental que distingue de manera unica a la persona. \\\\nNaturaleza: Cuantitativo\\\\nDominio: Enteos positivos\\\\nComposicion: 1{0-9}',
  `titulo_cortesia` varchar(20) DEFAULT NULL COMMENT 'Descripcion: Abreviatur o Palabra de Cortesia para dirigirse de manera formal a la persona, por ejemplo:Sr., Sra.,Ing., Dra, etc.\\\\nNaturaleza: Cualitativa \\\\nDominio: Caracteres Alfanumericos y puntos (.)\\\\nComposicion: 0{A-Z|a-z|.}20',
  `nombre` varchar(80) NOT NULL COMMENT 'Descripcion: Valos asociado a la persona dentro de su registro civil\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, vocales con tilde, espacios separados \\\\\\\\nComposicion: 0{A-Z|a-z| |}80',
  `primer_apellido` varchar(80) NOT NULL COMMENT 'Descripcion: Valos asociado a la persona dentro de su registro civil, generalmente conocido como Apellido Paterno\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, vocales con tilde, espacios separados \\\\\\\\nComposicion: 0{A-Z|a-z| |}80',
  `segundo_apellido` varchar(80) DEFAULT NULL COMMENT 'Descripcion: Valos asociado a la persona dentro de su registro civil, generalmente conocido como Apellido Materno\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, vocales con tilde, espacios separados \\\\\\\\nComposicion: 0{A-Z|a-z| |}80',
  `fecha_nacimiento` date NOT NULL COMMENT 'Descripcion: Fecha que determina la edad de la persona, indicado el dia, mes y año de natalicio\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\nFecha_Nacimiento = Año+''-''+Mes+''-''+Diaa',
  `fotografia` varchar(100) DEFAULT NULL COMMENT 'Descripcion: Nombre y extension del archivo de la imagen de portada de la persona.\\\\\\\\nNaturaleza: Cualitativa \\\\\\\\nDominio: Caracteres Alfanumericos, mas la extension permitida de imagenes como .jpg, .png, etc. \\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nNombre_Archivo = 0{A-z|0-9}96\\\\\\\\nExtension_Archivo = 0{A-z}4\\\\\\\\nFotografia = Nombre_Archivo+''-''+Extension_Archivo',
  `numero_telefonico` varchar(20) DEFAULT NULL COMMENT 'Descripción: Datos alusivos al número de teléfono de la persona\\\\nNaturaleza: Cualitativo\\\\nDominio: Cadena de caracteresTeléfono = [Código de País, Código de Área, Número de Teléfono, Extensión (opcional)]',
  `genero` enum('H','M','NB') NOT NULL COMMENT 'Descripcion: Datos alusivo al genero biologico de la persona\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\nDominio: Conjunto de valoesr Permitidos\\\\\\\\nComposicion: \\\\\\\\n\\\\\\\\nGenero = [''H'',''M'',''N/B''] ',
  `tipo_sangre` enum('A_POSITIVO','A_NEGATIVO','B_POSITIVO','B_NEGATIVO','AB_POSITIVO','AB_NEGATIVO','O_POSITIVO','O_NEGATIVO') NOT NULL COMMENT 'Descripcion: Datos referentes al tipo y grupo sanguineo\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nNaturaleza: Cualitativo\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nDominio: Conjunto de valores Permitidos\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nComposicion: \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\n\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\nTipo_Sangre = [''A_Positivo'', ''A_Negativo'', ''B_Positivo'', ''B_Negativo'', ''AB_Positivo'', ''AB_Negativo'', ''O_Positivo'', ''O_Negativo''] ',
  `estatus` enum('Activo','Inactivo') NOT NULL COMMENT 'Descripcion: Dato de Auditoria que define el estatus actual del regitro, siendo 0 para un datos no activos y 1 para datos activos para uso en el sistema\\\\\\\\nNaturaleza: Cuantativo\\\\\\\\nDominio: Booleano\\\\\\\\nComposicion: [0|1]\\\\\\\\n',
  `fecha_registro` datetime NOT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de creacion del registro\\\\\\\\nNaturaleza: Cuantitativo\\\\\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\\\\\nComposicion:\\\\\\\\n\\\\\\\\nAño = 4{0-9}4\\\\\\\\nMes =  [01|02|...|12]\\\\\\\\nDia =  [01|02|..|31]\\\\\\\\n\\\\\\\\nHora = [00|01|...|23]\\\\\\\\nMinutos = [00|01|...|59]\\\\\\\\nSeguntodos = [00|01|...|59]\\\\\\\\n\\\\\\\\nFecha_Registro= Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  `fecha_actualizacion` datetime DEFAULT NULL COMMENT 'Descripcion: Dato de Auditoria que documenta la fecha y hora de la ultima modificacion del registro\\\\nNaturaleza: Cuantitativo\\\\nDominio: Numeros Enteros Positivos imitados por el calendario y limites de mes y/o año bisiesto.\\\\nComposicion:\\\\n\\\\n\\\\nAño = 4{0-9}4\\\\nMes =  [01|02|...|12]\\\\nDia =  [01|02|..|31]\\\\n\\\\nHora = [00|01|...|23]\\\\nMinutos = [00|01|...|59]\\\\nSeguntodos = [00|01|...|59]\\\\n\\\\nFecha_Actualizacion = Año+''-''+Mes+''-''+Dia+''-''+Hora+''-''+Munutos+''-''+Segundos',
  PRIMARY KEY (`id`),
  KEY `ix_tbb_personas_id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=796 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Esta tabla almacenara los datos de las personas asociadas a los usuarios de la plataforma de administracion de gimnasio, es importante denotar que la presona es una superentidad de : USUARIOS';
