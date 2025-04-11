 # 🛠️ Manual de Instalación - - Módulo de Gerencia 

![Installation](https://img.shields.io/badge/Instalación-Guía%20Rápida-blue?style=for-the-badge)  
![Technologies](https://img.shields.io/badge/Tecnologías-FastAPI%20|%20Vue.js%20|%20MySQL-red?style=for-the-badge)  

## 📌 **Descripción**  
Este documento proporciona instrucciones detalladas para la instalación y configuración del sistema de gestión del gimnasio, dirigido a desarrolladores y administradores del sistema.

---

## 🖥️ **Requisitos del Sistema**  

### 🔹 **Software Requerido**  
- **Python 3.9+**  
- **FastAPI**  
- **Vue.js 3**  

---

## 🚀 **Pasos de Instalación**  

### 🔹 **1️⃣ Backend**  
```bash
# Clonar el repositorio
git clone https://github.com/Alex01Dev/backend-gerencia.git
cd backend-gerencia

# Crear entorno virtual
python -m venv venv
source venv/bin/activate  # En Windows usa 'venv\Scripts\activate'

# Instalar dependencias
pip install -r requirements.txt

# Ejecutar el servidor
uvicorn main:app --reload
```

### 🔹 **2️⃣ Frontend**  
```bash
# Clonar el repositorio (si no se ha hecho antes)
git clone https://github.com/Alex01Dev/frontend-gerencia.git
cd frontend-gerencia

# Instalar dependencias
npm install

# Ejecutar la aplicación para desarrollo
npm run serve

# Ejecutar la aplicación para producción
npm run build
```

> [!NOTE]  
> Si tienes dudas o problemas durante la instalación, revisa la documentación oficial o contacta al equipo de desarrollo.


## ✅ Tabla de Revisión  

<table style="width: 100%; border-collapse: collapse; margin-top: 30px;">
  <thead>
    <tr>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Colaborador</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Perfil</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Rol</th>
      <th style="border: 1px solid #ddd; padding: 8px; text-align: center;">Revisión</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Alex Amauri Marquez Canales</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><a href="https://github.com/Alex01Dev" target="_blank">@Amauri</a></td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Líder del Proyecto, Desarrollador Backend</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">✅ Revisión completada</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Alina Bonilla Paredes</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><a href="https://github.com/Ali-2121" target="_blank">@Alina</a></td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Documentadora Técnica</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">✅ Revisión completada</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Carlos Jesus Carballo Cruz</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><a href="https://github.com/CarlosJ67" target="_blank">@Carballo</a></td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Desarrollador Frontend</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">✅ Revisión completada</td>
    </tr>
    <tr>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Jesus Emmanuel Arroyo Rangel</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;"><a href="https://github.com/des-arrosho" target="_blank">@Arroyo</a></td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">Desarrollo de Base de Datos</td>
      <td style="border: 1px solid #ddd; padding: 8px; text-align: center;">❌ Pendiente</td>
    </tr>
  </tbody>
</table>

> **Leyenda:**  
> ✅ = Revisión completada  
> ⏳ = En proceso  
> ❌ = Pendiente  

--- 
