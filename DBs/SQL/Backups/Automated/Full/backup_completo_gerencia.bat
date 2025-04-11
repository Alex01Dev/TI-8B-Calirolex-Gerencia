@echo off
:: Encabezado personalizado en ASCII
echo "+============================================================================+";
echo "|                                                                            |";
echo "|       ____                       _     _                                   |";
echo "|      |  _ \ ___  ___ _ __   __ _| | __| | ___                              |";
echo "|      | |_) / _ \/ __| '_ \ / _` | |/ _` |/ _ \                             |";
echo "|      |  _ <  __/\__ \ |_) | (_| | | (_| | (_) |                            |";
echo "|      |_| \_\___||___/ .__/ \__,_|_|\__,_|\___/                             |";
echo "|                     |_|                                                    |";
echo "|                            _      _                                        |";
echo "|   ___ ___  _ __ ___  _ __ | | ___| |_ ___                                  |";
echo "|  / __/ _ \| '_ ` _ \| '_ \| |/ _ \ __/ _ \                                 |";
echo "| | (_| (_) | | | | | | |_) | |  __/ || (_) |                                |";
echo "|  \___\___/|_| |_| |_| .__/|_|\___|\__\___/                                 |";
echo "|                     |_|                                                    |";
echo "+============================================================================+";    
echo  Respaldos Completos con CronJobs de la BD del módulo de gerencia
echo ==============================================

:: Desactivar impresión en terminal
@echo off

:: Variables de conexión
set DB_NAME=gerencia_calirolex 
set DB_USER=tu_usuario
set DB_PASSWORD=tu_contraseña
set MYSQLDUMP=C:\Program Files\MySQL\MySQL Server 8.0\bin\mysqldump.exe

:: Variables para la ruta y nombre del archivo
set BACKUP_DIR=C:\Respaldos
set BACKUP_FILE=%BACKUP_DIR%\backup_completo_%date:~-4,4%-%date:~-7,2%-%date:~-10,2%_%time:~0,2%-%time:~3,2%.sql

:: Crear directorio si no existe
if not exist %BACKUP_DIR% mkdir %BACKUP_DIR%

:: Capturar la hora de inicio
set START_TIME=%time%

:: Mensaje de inicio
echo ==============================================
echo Estado: Iniciando respaldo completo de la base de datos europe_soccer_fixed...
echo Fecha de Inicio: %date% %START_TIME%
echo ==============================================

:: Respaldo completo
"%MYSQLDUMP%" -u %DB_USER% -p%DB_PASSWORD% -P tu_puerto %DB_NAME% > "%BACKUP_FILE%"

:: Capturar la hora de término
set END_TIME=%time%

:: Calcular duración
for /F "tokens=1-4 delims=:.," %%a in ("%START_TIME%") do set /A START_SEC=(((%%a*60)+%%b)*60+%%c)
for /F "tokens=1-4 delims=:.," %%a in ("%END_TIME%") do set /A END_SEC=(((%%a*60)+%%b)*60+%%c)
set /A DURATION=%END_SEC%-%START_SEC%


:: Obtener tamaño del archivo
for %%A in ("%BACKUP_FILE%") do set SIZE=%%~zA

:: Mensaje final con los 6 elementos requeridos
echo ==============================================
echo Estado: Respaldo Completo Finalizado
echo Fecha de Inicio: %date% %START_TIME%
echo Fecha de Término: %date% %END_TIME%
echo Duración: %DURATION% segundos
echo Tamaño del Archivo: %SIZE% bytes
echo Ubicación del Archivo: %BACKUP_FILE%
echo ==============================================

:: Guardar salida en log
 echo ==============================================
 echo Estado: Respaldo Completo Finalizado
 echo Fecha de Inicio: %date% %START_TIME%
 echo Fecha de Término: %date% %END_TIME%
 echo Duración: %DURATION% segundos
 echo Tamaño del Archivo: %SIZE% bytes
 echo Ubicación del Archivo: %BACKUP_FILE%
 echo ==============================================

:: Pausa para ver salida
pause

