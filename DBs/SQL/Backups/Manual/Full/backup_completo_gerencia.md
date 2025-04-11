# 📘 Manual: Exportación Completa de una Base de Datos con mysqldump

## 🛠 Requisitos Previos
- **MySQL** instalado en tu equipo.
- Un usuario con privilegios suficientes para acceder a la base de datos.
- Asegurar que MySQL está en ejecución y accesible.
- Tener el archivo sql para realizar el respaldo.

## 🚀 Paso 1: Abrir la Terminal o Línea de Comandos
Abre la terminal o línea de comandos en tu sistema operativo.

## 🚀 Paso 2: Navegar al Directorio de MySQL
Para ejecutar comandos de MySQL, primero debes ubicarte en el directorio donde se encuentra el cliente MySQL. Si instalaste MySQL en la ruta predeterminada de Windows, puedes acceder con el siguiente comando:

```sh
cd C:\Program Files\MySQL\MySQL Server 8.0\bin
```

Si estás en Linux o Mac y MySQL está en el `PATH`, puedes ejecutar los comandos directamente desde cualquier ubicación.

## 🚀 Paso 3: Exportar la Base de Datos Completa
Para exportar completamente una base de datos, usa el siguiente comando:

```sh
mysqldump -u tu_susuario -p --port=tu_puerto mi_base_de_datos > respaldo_completo.sql
```

### 🔹 Explicación del comando
- `mysqldump` → Comando para exportar la base de datos.
- `-u tu_usuario` → Usuario con los permisos necesarios de MySQL.
- `-p` → Solicita la contraseña.
- `--port=tu_puerto` → Puerto en el que MySQL está escuchando, debes modificarlo según tu puerto.
- `mi_base_de_datos` → Nombre de la base de datos a exportar.
- `> respaldo_completo.sql` → Archivo donde se guardará el respaldo.

## 🚀 Paso 4: Verificar el Respaldo
Cuando el proceso termine, en el archivo `respaldo_completo.sql` estarán todos los datos exportados de la base de datos.

## 🚀 Paso 5: Restaurar el Respaldo (Opcional)
Para restaurar el respaldo, primero debes ubicar la carpeta donde se encuentra el archivo `respaldo_completo.sql`. Si el archivo está en `C:\Respaldo`, primero accede a esa carpeta en la terminal:

```sh
cd C:\Respaldo
```

Luego, accede al directorio de MySQL antes de ejecutar el comando de restauración:

```sh
cd C:\Program Files\MySQL\MySQL Server 8.0\bin
```

Ejecuta el siguiente comando para restaurar la base de datos:

```sh
mysql -u root -p --port=3307 mi_base_de_datos < C:\Respaldo\respaldo_completo.sql
```

---
