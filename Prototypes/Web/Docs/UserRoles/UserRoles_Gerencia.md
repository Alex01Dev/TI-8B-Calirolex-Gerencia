# 📂 UserRoles  

![User Roles](https://img.shields.io/badge/User%20Roles-Permissions-blue?style=for-the-badge)  
![Security](https://img.shields.io/badge/Security-Management-green?style=for-the-badge)  
![Access](https://img.shields.io/badge/Access-Control-purple?style=for-the-badge)  

---

## 📁 **Descripción**  

Esta carpeta contiene la documentación detallada de los **roles de usuario** del sistema web del gimnasio, incluyendo sus permisos y funciones.  

El objetivo es:  
1. **Definir claramente los niveles de acceso** para cada tipo de usuario.  
2. **Establecer las responsabilidades específicas** de cada usuario.  

---

## 🔑 **Roles del Sistema**

### 👑 **1. Gerente**
El **Gerente** tiene el nivel más alto de permisos operativos, con la capacidad de administrar las sucursales, gestionar el personal, consultar reportes y supervisar las operaciones.  

**Permisos:**  
- 📌 Gestión total de sucursales: creación, edición, activación/inactivación.  
- 📌 Administración del personal: registro, modificación y asignación de roles.  
- 📌 Acceso completo a las transacciones (ingresos y egresos).  
- 📌 Generación y exportación de reportes mensuales.  
- 📌 Supervisión del inventario de equipos.  
- 📌 Acceso a la bitácora de auditoría.  
- 📌 Acceso a su perfil personal.  

**Funciones:**  
- Crear y gestionar sucursales.  
- Administrar datos del personal.  
- Consultar reportes financieros y operativos.  
- Supervisar las operaciones generales.  

---

### 🛠️ **2. Colaborador (Trabajador)**  
El **Colaborador** tiene permisos relacionados con la ejecución de tareas diarias del gimnasio, como la gestión de clientes, reservas y mantenimiento.  

**Permisos:**  
- 📌 Gestión de reservas de clases grupales.  
- 📌 Registro de la asistencia de clientes.  
- 📌 Acceso al inventario de equipos.  
- 📌 Registro de reportes de mantenimiento.  
- 📌 Visualización de reportes locales básicos.  

**Funciones:**  
- Atender clientes y gestionar sus reservas.  
- Registrar la asistencia a clases.  
- Actualizar el estado de los equipos.  
- Reportar incidencias de mantenimiento.  

---

### 💳 **3. Cliente **  
El rol de **Cliente** tiene permisos limitados, orientados a la gestión de su cuenta personal y la participación en las clases y servicios del gimnasio.  

**Permisos:**  
- 📌 Acceso a su perfil personal.  
- 📌 Consulta de su historial de membresía.  
- 📌 Visualización de horarios y disponibilidad de clases.  
- 📌 Reserva y cancelación de clases grupales.  
- 📌 Seguimiento de su progreso físico.  

**Funciones:**  
- Consultar su información personal.  
- Reservar o cancelar clases.  
- Ver su historial de pagos y membresía.  
- Actualizar sus datos de contacto.  

---

### 🚶 **4. Visitante**  
El rol de **Visitante** representa a los usuarios no registrados que acceden al sistema de forma pública, con permisos muy limitados.  

**Permisos:**  
- 📌 Visualización básica de información pública del gimnasio.  
- 📌 Consulta de horarios de clases.  
- 📌 Acceso a la página de contacto.  
- 📌 Realizar transacciones de compra de servicios o productos en la sucursal.  

**Funciones:**  
- Consultar información de servicios.  
- Ver horarios de clases disponibles.  
- Acceder a la página de contacto.  
- Comprar en la sucursal servicios o productos.  

---

## ✅ **Tabla de Permisos por Rol**

<table style="width: 100%; border-collapse: collapse; margin-top: 30px;">
  <thead>
    <tr>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Función</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Gerente</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Colaborador</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Cliente</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Visitante</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">Gestionar sucursales</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">Generar reportes</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">Visualizar inventario</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">Acceso a la bitácora</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
      <td style="border: 1px solid #ddd; text-align: center;">❌</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px;">Comprar servicios y productos</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
      <td style="border: 1px solid #ddd; text-align: center;">✅</td>
    </tr>
  </tbody>
</table>

--- 

📌 **Nota:** Esta documentación define los roles del sistema web del gimnasio, sus permisos y funciones para garantizar un control adecuado del acceso y la gestión de la información. 🚀  
