# 📌 **Historias de Usuario - Módulo de Gerencia (Sistema Web Gimnasio)**  
![User Stories](https://img.shields.io/badge/User%20Stories-Important-orange?style=for-the-badge)  


## 🛠️ **1️⃣ Gestión de Sucursales**  

### ✅ **HU-01: Registrar una nueva sucursal**  
**Como** gerente del gimnasio,  
**Quiero** registrar una nueva sucursal proporcionando su nombre, dirección, gerente encargado, capacidad máxima y horario de operación,  
**Para que** pueda expandir las operaciones del gimnasio y llevar un control adecuado de las sucursales.  

**Criterios de Aceptación:**  
- El sistema debe validar que solo los gerentes puedan registrar nuevas sucursales.    
- No debe ser posible registrar dos sucursales con la misma dirección.  
- El registro debe quedar almacenado en la base de datos con la fecha de creación.  
  

---  
### ✅ **HU-02: Actualizar la información de una sucursal**  
**Como** gerente del gimnasio,  
**Quiero** actualizar la información de una sucursal,  
**Para que** los datos reflejen la información más reciente.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden actualizar la información.  
- El sistema debe mostrar un mensaje de confirmación al finalizar la actualización.  
- La base de datos debe mantener un registro del historial de actualizaciones.  
- Los cambios se reflejan inmediatamente en la interfaz de usuario.  

---  
### ✅ **HU-03: Eliminar una sucursal **  
**Como** gerente del gimnasio,  
**Quiero** poder eliminar una sucursal,  
**Para que** ya no esté disponible para las operaciones del sistema.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden eliminar sucursales.  
- La sucursal no se eliminará físicamente de la base de datos, sino que se marcará como inactiva.  
- El sistema debe mostrar una advertencia antes de confirmar la acción.  
- No se deben perder las transacciones asociadas a la sucursal eliminada.  
  

---  
### ✅ **HU-04: Consultar lista de sucursales**  
**Como** gerente del gimnasio,  
**Quiero** visualizar la lista de sucursales registradas,  
**Para que** pueda revisar la información de cada sucursal.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden acceder a esta lista de sucursales.  
- La lista debe incluir nombre, dirección, gerente encargado y horario de operación.   

---  

## 📊 **2️⃣ Visualización de Reportes y Gráficas**  

### ✅ **HU-05: Ver tabla dinámica de transacciones**  
**Como** gerente del gimnasio,  
**Quiero** visualizar una tabla dinámica con todas las transacciones realizadas,  
**Para que** pueda filtrar, ordenar y analizar las operaciones financieras.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden visualizar las transacciones.  
- La tabla debe permitir filtrar la información.   
- El sistema debe mostrar el total de ingresos y egresos.  

---  
### ✅ **HU-06: Ver tabla dinámica de ingresos y egresos por mes**  
**Como** gerente del gimnasio,  
**Quiero** visualizar una tabla dinámica con los ingresos y egresos mensuales,  
**Para que** pueda analizar la evolución financiera del gimnasio.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden acceder a esta tabla.  
- Debe mostrar subtotales por mes y tipo de transacción.  

---  
### ✅ **HU-07: Asignar gráficas a las tablas dinámicas**  
**Como** gerente del gimnasio,  
**Quiero** visualizar gráficas asociadas a las tablas de transacciones e ingresos/egresos mensuales,  
**Para que** pueda interpretar visualmente la información financiera.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden acceder a las gráficas.  
- La gráfica debe actualizarse automáticamente al modificar los filtros de la tabla.  
- Los datos deben coincidir con los valores mostrados en la tabla.  

---  
### ✅ **HU-08: Exportar reportes en PDF**  
**Como** gerente del gimnasio,  
**Quiero** exportar los reportes financieros en formato PDF,  
**Para que** pueda compartirlos o almacenarlos para referencia futura.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden exportar reportes.  
- El reporte debe incluir fecha de creación y rango de fechas.  
- Debe mostrar el total de ingresos y egresos del período seleccionado.  
- El PDF debe estar correctamente formateado y legible.  
  
---  

## 👤 **3️⃣ Gestión de Datos Personales del Gerente**  

### ✅ **HU-09: Actualizar datos personales del gerente**  
**Como** gerente del gimnasio,  
**Quiero** actualizar mi información personal (dirección, teléfono),  
**Para que** el sistema tenga mis datos actualizados.  

**Criterios de Aceptación:**  
- Solo el usuario autenticado puede actualizar sus datos personales.  
- El sistema debe validar que los campos sean correctos (teléfono, dirección).  
- Los cambios deben reflejarse inmediatamente en la base de datos.  

---  

## 💳 **4️⃣ Transacciones**  

### ✅ **HU-10: Registrar una nueva transacción manualmente**  
**Como** gerente del gimnasio,  
**Quiero** registrar una nueva transacción financiera,  
**Para que** pueda agregar manualmente ingresos o egresos.  

**Criterios de Aceptación:**  
- Los gerentes pueden registrar transacciones.  
- El sistema debe validar que los montos sean positivos.  
- No debe ser posible registrar transacciones con fechas futuras.  
- El sistema debe asociar la transacción a un usuario.  
- La transacción debe quedar almacenada en la base de datos con fecha, hora y usuario.  

---  
### ✅ **HU-11: Visualizar historial de transacciones**  
**Como** gerente del gimnasio,  
**Quiero** visualizar una tabla con el historial completo de transacciones,  
**Para que** pueda consultar y analizar los detalles financieros.  

**Criterios de Aceptación:**  
- Solo los gerentes pueden acceder al historial.  
- La tabla debe permitir filtrar por fecha, tipo (ingreso/egreso), usuario o sucursal.  
- Los datos deben mostrar detalles como fecha, monto, tipo de pago y descripción.  
- No debe ser posible eliminar transacciones.  

---

✅ **Estas historias de usuario** cubren las funcionalidades principales del **módulo de gerencia** del sistema web para la gestión del gimnasio, asegurando que las operaciones financieras, la administración de sucursales y la gestión de datos personales estén alineadas con las reglas de negocio.
