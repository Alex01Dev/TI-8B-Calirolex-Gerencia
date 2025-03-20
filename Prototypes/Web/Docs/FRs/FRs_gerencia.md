# 📌 Requerimientos Funcionales - Módulo de Gerencia 

![Documentation](https://img.shields.io/badge/Documentation-Important-orange?style=for-the-badge)
![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)
![Requerimientos Funcionales](https://img.shields.io/badge/Requerimientos%20Funcionales-0057B8?style=for-the-badge&logo=codefactor&logoColor=white)


## 1️⃣ Gestión de Sucursales  

### RF-01 Registrar sucursal  
**Descripción:** El sistema debe permitir que un usuario del tipo gerente registre una nueva sucursal proporcionando nombre, dirección, gerente encargado y horario de operación.  

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí    |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    |  |
| Alina Bonilla      | Documentador | ✅ Sí    |             |

---

### RF-02 Actualizar información de sucursal  
**Descripción:** El sistema debe permitir que un usuario del tipo gerente actualice la información de una sucursal.  


| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RF-03 Eliminar sucursal  
**Descripción:** El sistema debe permitir que un ususrio del tipo gerente elimine una sucursal.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RF-04 Consultar lista de sucursales  
**Descripción:** El sistema debe permitir que el gerente visualice todas las sucursales registradas.  

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí    |             |
| Alex A. Marquez        | Backend      | ✅ Sí   |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  
---

## 2️⃣ Visualización de Reportes y Gráficas  

### RF-05 Mostrar tabla dinámica de transacciones  
**Descripción:** El sistema debe mostrar una tabla dinámica que represente todas las transacciones realizadas. Esta tabla debe permitir filtrar y ordenar los datos según diferentes criterios para facilitar su análisis.

| Desarrollador       | Rol           | Validado | Comentarios |
|---------------------|---------------|----------|-------------|
| Carlos J. Carballo  | Frontend      | ✅ Sí     |             |
| Alex A. Marquez     | Backend       | ✅ Sí     |             |
| Jesús E. Arroyo     | Base de datos | ✅ Sí     |    |
| Alina Bonilla       | Documentador  | ✅ Sí     |             |

---

### RF-06 Mostrar tabla dinámica de transacciones por mes  
**Descripción:** El sistema debe mostrar una tabla dinámica que represente de ingresos y egresos por mes. 

| Desarrollador       | Rol           | Validado | Comentarios |
|---------------------|---------------|----------|-------------|
| Carlos J. Carballo  | Frontend      | ✅ Sí      |             |
| Alex A. Marquez     | Backend       | ✅ Sí      |             |
| Jesús E. Arroyo     | Base de datos | ✅ Sí      |     |
| Alina Bonilla       | Documentador  | ✅ Sí     |             |

---

### RF-07 Asignar gráficas a tablas dinámicas  
**Descripción:**  El sistema debe asociar a cada la tabla de transacciones e ingresos y egresos mensuales, una gráfica que permita visualizar la información de manera clara y detallada.

| Desarrollador       | Rol           | Validado | Comentarios |
|---------------------|---------------|----------|-------------|
| Carlos J. Carballo  | Frontend      | ✅ Sí     |             |
| Alex A. Marquez     | Backend       | ✅ Sí     |             |
| Jesús E. Arroyo     | Base de datos | ✅ Sí     |     |
| Alina Bonilla       | Documentador  | ✅ Sí     |             |

---

### RF-08 Exportar reportes  
**Descripción:** El sistema debe permitir la exportación de reportes en formato PDF.  

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

## 3️⃣ Gestión de Datos Personales del Gerente  

### RF-09 Actualizar datos personales  
**Descripción:** El sistema debe permitir que el usuario tipo gerente actualice su información personal, incluyendo  dirección y teléfono.  

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  
|

---
## 2️⃣ Transacciones 

### RF-10 Registrar nueva transacción  
**Descripción:** El sistema debe permitir que un gerente registre manualmente una nueva transacción financiera, especificando el tipo de transacción, el monto, tipo de pago, detalles y el usuario.

| Desarrollador        | Rol           | Validado | Comentarios                      |
|----------------------|--------------|----------|----------------------------------|
| Carlos J. Carballo  | Frontend     | ✅ Sí     |                                  |
| Alex A. Marquez     | Backend      | ✅ Sí     |                                  |
| Jesús E. Arroyo     | Base de datos | ✅ Sí     | Falta definir validaciones       |
| Alina Bonilla       | Documentador | ✅ Sí    |                                  |

---

### RF-11 Visualizar transacciones en una tabla  
**Descripción:** El sistema debe permitir que el gerente visualice una tabla con el historial de transacciones, mostrando los detalles de cada transacción.
| Desarrollador        | Rol           | Validado | Comentarios                      |
|----------------------|--------------|----------|----------------------------------|
| Carlos J. Carballo  | Frontend     | ✅ Sí     |                                  |
| Alex A. Marquez     | Backend      | ✅ Sí     |                                  |
| Jesús E. Arroyo     | Base de datos | ✅ Sí     |         |
| Alina Bonilla       | Documentador | ✅ Sí    |                                  |

---