-- 1. Total de Ingresos, Egresos y Ganancia Neta
-- Calcula el total de ingresos, egresos y la ganancia neta (ingresos - egresos) de las transacciones con estado 'PAGADA'
SELECT
  SUM(CASE WHEN tipo_transaccion = 'INGRESO' THEN monto ELSE 0 END) AS total_ingresos,
  SUM(CASE WHEN tipo_transaccion = 'EGRESO' THEN monto ELSE 0 END) AS total_egresos,
  SUM(CASE WHEN tipo_transaccion = 'INGRESO' THEN monto ELSE 0 END) -
  SUM(CASE WHEN tipo_transaccion = 'EGRESO' THEN monto ELSE 0 END) AS ganancia_neta
FROM tbb_transacciones
WHERE estatus = 'PAGADA';

-- 2. Cantidad de Usuarios por Rol
-- Muestra la cantidad de usuarios asociados a cada rol, agrupando los resultados por el nombre del rol
SELECT 
  r.Nombre AS Rol,
  COUNT(ur.Usuario_ID) AS Cantidad_Usuarios
FROM tbc_roles r
LEFT JOIN tbd_usuarios_roles ur ON r.ID = ur.Rol_ID
GROUP BY r.Nombre;

-- 3. Métodos de Pago en Transacciones
-- Muestra la cantidad de transacciones y el monto total por cada método de pago, para las transacciones con estado 'PAGADA'
SELECT 
  metodo_pago,
  COUNT(*) AS cantidad,
  SUM(monto) AS total_monto
FROM tbb_transacciones
WHERE estatus = 'PAGADA'
GROUP BY metodo_pago;

-- 4. Últimos 20 Registros de la Bitácora
-- Muestra los últimos 20 registros de la bitácora, ordenados por la fecha de registro en orden descendente
SELECT 
  Usuario,
  Operacion,
  Tabla,
  Descripcion,
  Fecha_Registro
FROM tbb_bitacora
ORDER BY Fecha_Registro DESC
LIMIT 20;

-- 5. Personas Activas
-- Muestra los detalles de las personas activas (estatus 'Activo')
SELECT 
  id,
  CONCAT(nombre, ' ', primer_apellido, ' ', segundo_apellido) AS nombre_completo,
  genero,
  tipo_sangre,
  numero_telefonico,
  estatus
FROM tbb_personas
WHERE estatus = 'Activo';

-- 6. Sucursales Activas y su Capacidad
-- Calcula el número de sucursales activas (estatus '1') y la capacidad total máxima de todas ellas
SELECT 
  COUNT(*) AS sucursales_activas,
  SUM(Capacidad_Maxima) AS capacidad_total
FROM tbc_sucursales
WHERE Estatus = 1;

-- 7. Usuarios Registrados en los Últimos 30 Días
-- Muestra los usuarios registrados en los últimos 30 días, junto con su nombre y la fecha de registro
SELECT 
  u.id,
  u.nombre_usuario,
  p.nombre,
  u.fecha_registro
FROM tbb_usuarios u
JOIN tbb_personas p ON u.persona_id = p.id
WHERE u.fecha_registro >= DATE_SUB(NOW(), INTERVAL 30 DAY);

-- 8. Usuarios con Más de un Rol
-- Muestra los usuarios que tienen más de un rol asignado
SELECT 
  u.id AS usuario_id,
  u.nombre_usuario,
  COUNT(ur.Rol_ID) AS cantidad_roles
FROM tbb_usuarios u
JOIN tbd_usuarios_roles ur ON u.id = ur.Usuario_ID
GROUP BY u.id
HAVING COUNT(ur.Rol_ID) > 1;

-- 9. Transacciones por Día en la Última Semana
-- Muestra el monto total de transacciones (por tipo de transacción) realizadas en los últimos 7 días con estado 'PAGADA'
SELECT 
  DATE(fecha_registro) AS fecha,
  tipo_transaccion,
  SUM(monto) AS total_monto
FROM tbb_transacciones
WHERE fecha_registro >= CURDATE() - INTERVAL 7 DAY
  AND estatus = 'PAGADA'
GROUP BY DATE(fecha_registro), tipo_transaccion
ORDER BY fecha DESC;

-- 10. Personas Sin Usuario Asociado
-- Muestra las personas que no tienen un usuario asociado en el sistema
SELECT 
  p.id,
  CONCAT(p.nombre, ' ', p.primer_apellido, ' ', p.segundo_apellido) AS nombre_completo
FROM tbb_personas p
LEFT JOIN tbb_usuarios u ON u.persona_id = p.id
WHERE u.id IS NULL;

-- 11. Sucursales Activas con su Responsable
-- Muestra las sucursales activas junto con el responsable de cada una (su nombre completo)
SELECT 
  s.Nombre AS sucursal,
  CONCAT(p.nombre, ' ', p.primer_apellido) AS responsable
FROM tbc_sucursales s
JOIN tbb_usuarios u ON s.Responsable_Id = u.id
JOIN tbb_personas p ON u.persona_id = p.id
WHERE s.Estatus = 1;

-- 12. Conteo de Personas Activas por Género
-- Muestra la cantidad de personas activas (estatus 'Activo') agrupadas por género
SELECT 
  genero,
  COUNT(*) AS total
FROM tbb_personas
WHERE estatus = 'Activo'
GROUP BY genero;

-- 13. Usuarios Inactivos Registrados Hace Más de 6 Meses
-- Muestra los usuarios inactivos que fueron registrados hace más de 6 meses
SELECT 
  u.id,
  u.nombre_usuario,
  p.nombre,
  u.fecha_registro
FROM tbb_usuarios u
JOIN tbb_personas p ON u.persona_id = p.id
WHERE u.estatus = 'Inactivo'
  AND u.fecha_registro < DATE_SUB(NOW(), INTERVAL 6 MONTH);

-- 14. Registros en la Bitácora para Transacciones
-- Muestra los registros de la bitácora relacionados con la tabla 'tbb_transacciones'
SELECT 
  b.Usuario,
  b.Operacion,
  b.Descripcion,
  b.Fecha_Registro
FROM tbb_bitacora b
WHERE b.Tabla = 'tbb_transacciones'
ORDER BY b.Fecha_Registro DESC;

-- 15. Monto Total por Tipo de Transacción y Estatus
-- Calcula el monto total de transacciones agrupado por tipo de transacción y estatus
SELECT 
  tipo_transaccion,
  estatus,
  SUM(monto) AS total_monto
FROM tbb_transacciones
GROUP BY tipo_transaccion, estatus;

-- 16. Correos Electrónicos Duplicados
-- Muestra los correos electrónicos que están duplicados en la tabla de usuarios
SELECT 
  correo_electronico,
  COUNT(*) AS cantidad
FROM tbb_usuarios
GROUP BY correo_electronico
HAVING COUNT(*) > 1;

-- 17. Los 5 Días con Más Ingresos
-- Muestra los 5 días con más ingresos, ordenados por el total de ingresos de mayor a menor
SELECT 
  DATE(fecha_registro) AS fecha,
  SUM(monto) AS total_ingresos
FROM tbb_transacciones
WHERE tipo_transaccion = 'INGRESO' AND estatus = 'PAGADA'
GROUP BY DATE(fecha_registro)
ORDER BY total_ingresos DESC
LIMIT 5;
