# 📘 Manual: Exportación Completa de una Base de Datos con MySQL Shell

## 🛠 Requisitos Previos
- Tener **MySQL Shell** instalado en tu sistema.
- Contar con un usuario con privilegios suficientes para acceder a la base de datos.
- Asegurarte de que el servicio MySQL está en ejecución.
- Tener el archivo .sql con la base de datos.

## 🚀 Paso 1: Iniciar MySQL Shell
Para abrir MySQL Shell, ejecuta el siguiente comando en la terminal o línea de comandos:

```sh
mysqlsh
```

Si estás en Windows y tienes MySQL Shell agregado al PATH, puedes ejecutarlo directamente en `cmd` o `PowerShell`. En Linux o macOS, usa la terminal.

## 🚀 Paso 2: Conectarse al Servidor MySQL
Dentro de MySQL Shell, conéctate al servidor MySQL utilizando el siguiente comando:

```sql
\connect root@localhost:3307
```

- `root` → Usuario administrador.
- `localhost` → Servidor donde corre MySQL (ajustar si es remoto).
- `3307` → Puerto en el que MySQL está escuchando.

Una vez ejecutado, se pedirá la contraseña del usuario `root`.

## 🚀 Paso 3: Exportar la Base de Datos Completa
Para exportar completamente una base de datos, usa el siguiente comando:

```sql
util.dumpInstance("respaldo_completo", {"ocimds": false})
```

### 🔹 Explicación del comando
- `util.dumpInstance("respaldo_completo")` → Realiza un volcado de toda la instancia y lo guarda en la carpeta `respaldo_completo`.
- `{"ocimds": false}` → Opción recomendada para evitar problemas de compatibilidad con almacenamiento en la nube.

## 🚀 Paso 4: Verificar el Respaldo
Cuando el proceso termine, en la carpeta `respaldo_completo` estarán todos los archivos generados.

## 🚀 Paso 5: Restaurar el Respaldo (Opcional)
Si deseas restaurar la base de datos, usa el siguiente comando en MySQL Shell:

```sql
util.loadDump("respaldo_completo", {"schema":"nombre_de_tu_bd"})
```

---
📌 **Consejo:** Se recomienda programar respaldos periódicos para evitar la pérdida de información. 🚀

