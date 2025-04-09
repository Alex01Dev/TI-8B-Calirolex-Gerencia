# 📌 Reglas de Negocio - Módulo de Gerencia 
![Documentation](https://img.shields.io/badge/Documentation-Important-orange?style=for-the-badge)
![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)
![Regla de Negocio](https://img.shields.io/badge/Regla%20de%20Negocio-2C3E50?style=for-the-badge&logo=briefcase&logoColor=white)


## 1️⃣ Gestión de Sucursales  
- 📌 Solo los gerentes podrá **registrar** nuevas sucursales proporcionando:
  - Nombre de la sucursal
  - Dirección 
  - Teléfono
  - Correo 
  - Gerente encargado 
  - Capacidad Máxima

- 📌 Solo los usuarios del tipo gerente podrán **actualizar** los datos de una sucursal.  
- 📌 Solo los usuarios del tipo gerente podrán **consultar** una lista de todas las sucursales y sus detalles.  

---
## 2️⃣  Transacciones
- 📌 Una transacción debe estar asociada a un usuario.   
- 📌 Una transacción de tipo **egreso** debe estar vinculada a un gasto operativo relacionado con el gimnasio, como mantenimiento, salarios o insumos.  
- 📌 Cada transacción deberá tener un registro de **fecha y hora de creación**, así como el usuario que la generó.  
- 📌 No se podrán realizar transacciones con **fechas futuras** a la fecha actual.  
- 📌 **No se permiten valores negativos** en los montos de las transacciones.  
- 📌 **No está permitido eliminar transacciones**, deberá mantenerse su registro en el sistema, invluso si la sucursal es eliminada.

## 3️⃣ **Generación de Reportes Mensuales**  
- 📌 Los reportes mensuales solo podrán generarse para **fechas anteriores o hasta la fecha actual**. No se permiten reportes con fechas futuras.  
- 📌 Los reportes generados deberán contar con:  
  - Fecha de creación   
  - Intervalo de fechas del reporte  
- 📌 Los reportes históricos no podrán ser modificados, solo visualizados.  

---

## 4️⃣ **Base de Datos**  
- 📌 Toda transacción (ingreso o egreso) deberá ser registrada en la base de datos con un ID único.  
- 📌 El campo **fecha de creación** en las transacciones se generará automáticamente con la fecha y hora del servidor.  
- 📌 Los registros eliminados en el sistema no serán eliminados físicamente de la base de datos, sino que se marcarán como **'inactivos'** o **'anulados'**.  
- 📌 Se debe mantener un registro de auditoría (bitácora) con la siguiente información:  
  - Fecha y hora de la acción  
  - Tipo de operación (Create, Read, Update, Delete)  
  - Descripción detallada de la acción  
- 📌 Los campos relacionados con fechas no podrán almacenar valores posteriores a la fecha actual del servidor.     

---

## 🔒 **5️⃣ Autenticación **  
- 📌 Solo los **gerentes autenticados** podrán acceder al módulo de gerencia.  
- 📌 Los gerentes deberán **iniciar sesión** con sus credenciales (usuario y contraseña) para visualizar, registrar, actualizar o eliminar información en el módulo.  
- 📌 Si la sesión expira o el usuario no está autenticado, se debe redirigir a la página de inicio de sesión.  


