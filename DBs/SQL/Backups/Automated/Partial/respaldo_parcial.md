# 🛠️ Manual: Uso de Cron Jobs en Windows con el Programador de Tareas para Respaldo Parcial del Módulo de Gerencia

![Windows](https://img.shields.io/badge/Windows-0078D6?style=for-the-badge&logo=windows&logoColor=white)  
![Backup](https://img.shields.io/badge/Backup-4CAF50?style=for-the-badge&logo=databricks&logoColor=white) 
![MySQL](https://img.shields.io/badge/MySQL-005C84?style=for-the-badge&logo=mysql&logoColor=white) 
![Full](https://img.shields.io/badge/Full-1976D2?style=for-the-badge&logo=verizon&logoColor=white)  
![Partial](https://img.shields.io/badge/Partial-FBC02D?style=for-the-badge&logo=verizon&logoColor=white)  
![.bat](https://img.shields.io/badge/-bat-616161?style=for-the-badge&logo=gnu-bash&logoColor=white)  

## 📌 Introducción
Este manual explica cómo programar un respaldo parcial automático de bases de datos MySQL en Windows utilizando el **Programador de Tareas** y un archivo `.bat`.

---

## 1️⃣ Preparación del Archivo de Respaldo

Antes de programar la tarea, asegúrate de:
✅ Tener la base de datos completa ya creada.
✅ Contar con el archivo `backup_parcial_gerencia.bat` que se encuentra en esta misma carpeta.
✅ Modificar el puerto, usuario y password con los datos correctos para el respaldo.

```bat
set DB_USER=tu_usuario
set DB_PASSWORD=tu_contraseña
"%MYSQLDUMP%" -u %DB_USER% -p%DB_PASSWORD% -P tu_puerto %DB_NAME% > "%BACKUP_FILE%"
```

---

## 2️⃣ Crear una Tarea en el Programador de Tareas

### 🔹 Paso 1: Abrir el Programador de Tareas
1. Presiona 🏁 `Win`, escribe `Tareas` y selecciona **Programador de Tareas**.
2. En el panel derecho, haz clic en **Crear Tarea...**.

### 🔹 Paso 2: Configurar la Tarea
1. En la pestaña **General**:
   - Asigna un nombre a la tarea, por ejemplo: `Respaldo_parcial_gerencia`.
   - Marca la casilla **Ejecutar con los privilegios más altos** ⚡.
   - En "Configurar para:", selecciona **Windows 11** (o tu versión de Windows).

### 🔹 Paso 3: Establecer el Disparador
1. Ve a la pestaña **Desencadenadores** y haz clic en **Nuevo** ➕.
2. Configura la frecuencia del respaldo:
   - En "Iniciar la tarea", selecciona **Diariamente** 📅.
   - Establece la hora deseada ⏰.
   - Asegúrate de que la tarea esté habilitada ✅.

### 🔹 Paso 4: Configurar la Acción
1. Ve a la pestaña **Acciones** y haz clic en **Nueva** ➕.
2. En "Acción", selecciona **Iniciar un programa** ▶️.
3. En "Programa o script", haz clic en **Examinar** y selecciona `backup_parcial_gerencia.bat`.

### 🔹 Paso 5: Configurar Condiciones y Opciones
- En la pestaña **Condiciones**, desmarca la opción *Iniciar la tarea solo si el equipo está en corriente alterna* 🔌 (si deseas que funcione en laptops con batería).
- En la pestaña **Configuración**, marca *Permitir que la tarea se ejecute a petición* 🔄.

---

## 3️⃣ Probar la Tarea ✅
1. Ve al **Programador de Tareas**.
2. Selecciona la tarea creada y haz clic en **Ejecutar** ▶️.
3. Verifica que el archivo de respaldo se haya generado en `C:\Respaldos` 📂.

---

## 🏁 Conclusión
Siguiendo estos pasos, puedes automatizar respaldos de las tablas necesarias en Windows usando el **Programador de Tareas**. Esto garantiza la seguridad de tus datos sin intervención manual 🛡️.

✨ ¡Tu información estará segura y respaldada de forma automática! 🚀

