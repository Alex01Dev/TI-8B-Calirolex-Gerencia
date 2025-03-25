# 📌 Requerimientos No Funcionales - Módulo de Gerencia 

![Documentation](https://img.shields.io/badge/Documentation-Important-orange?style=for-the-badge)
![Markdown](https://img.shields.io/badge/Markdown-000000?style=for-the-badge&logo=markdown&logoColor=white)
![Requerimientos No Funcionales](https://img.shields.io/badge/Requerimientos%20No%20Funcionales-8E44AD?style=for-the-badge&logo=gear&logoColor=white)


### RNF-01 Tiempo de Respuesta
**Descripción:** El sistema debe garantizar que las respuestas a las acciones del usuario no excedan los 5 segundos en operaciones comunes y los 5 segundos en generación de reportes.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    | |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-02 Capacidad de Escalabilidad
**Descripción:** El sistema debe ser capaz de manejar un aumento en la cantidad de usuarios simultáneos sin degradar el rendimiento.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí    |             |
| Alex A. Marquez        | Backend      | ✅ Sí   |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-03 Escalabilidad
**Descripción:** La arquitectura del sistema debe permitir la escalabilidad horizontal y vertical para admitir un crecimiento en el número de usuarios y sucursales.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí   |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-04 Interfaz Intuitiva
**Descripción:** La interfaz debe ser clara y sencilla, siguiendo principios de usabilidad como jerarquía visual y accesibilidad para facilitar la navegación del gerente.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí   |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-05 Compatibilidad con Dispositivos
**Descripción:** El sistema debe ser responsive y funcionar correctamente en computadoras y tabletas de diferentes tamaños.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí    |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    | Falta... |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-06 Autenticación y Autorización
**Descripción:** El sistema debe implementar autenticación basada en JWT y control de acceso basado en roles para garantizar que solo los gerentes autorizados puedan acceder a las funcionalidades del módulo.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     | Falta... |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-07 Protección de Datos
**Descripción:** La contraseña de los usuarios debe ser cifrada en la base de datos mediante algoritmos de cifrado.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí    |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    | |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-08 Disponibilidad
**Descripción:** El sistema debe estar disponible al menos el 99.5% del tiempo, asegurando que las interrupciones no superen los 4 horas al mes.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    | |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-09 Backup y Recuperación
**Descripción:** El sistema debe realizar copias de seguridad automáticas diariamente y permitir la restauración de datos en caso de fallos.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí     |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-10 Mantenimiento
**Descripción:** La plataforma debe permitir actualizaciones sin afectar la operatividad de los gerentes mediante despliegues controlados y mantenimiento programado.

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí    |             |
| Alex A. Marquez        | Backend      | ✅ Sí    |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí     | |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---

### RNF-11 Compatibilidad con Navegadores
**Descripción:** El sistema debe ser compatible con los navegadores más utilizados: Google Chrome, Mozilla Firefox, Microsoft Edge y Safari (últimas versiones).

| Desarrollador | Rol           | Validado | Comentarios |
|--------------|--------------|----------|-------------|
| Carlos J. Carballo        | Frontend     | ✅ Sí  |             |
| Alex A. Marquez        | Backend      | ✅ Sí  |             |
| Jesús E. Arroyo       | Base de datos | ✅ Sí    |  |
| Alina Bonilla      | Documentador | ✅ Sí    |  

---


