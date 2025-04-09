# Diccionario de Datos - Colección `reportes`

| Campo                | Tipo         | Requerido | Descripción                                                                 | Restricciones                                                                 | Ejemplo                                |
|----------------------|--------------|-----------|-----------------------------------------------------------------------------|------------------------------------------------------------------------------|----------------------------------------|
| `_id`               | ObjectId     | Sí        | ID único generado por MongoDB                                               | Formato hexadecimal (12 bytes)                                               | `ObjectId("507f...")`                 |
| `fecha_inicio`      | ISODate      | Sí        | Fecha de inicio del período                                                 | Debe ser anterior a `fecha_fin` (formato ISO 8601)                           | `ISODate("2025-02-01T00:00:00Z")`     |
| `fecha_fin`         | ISODate      | Sí        | Fecha de fin del período                                                    | Debe ser posterior a `fecha_inicio`                                          | `ISODate("2025-03-01T00:00:00Z")`     |
| `ingresos`          | Decimal128   | Sí        | Total de ingresos                                                           | ≥ 0, 2 decimales                                                            | `NumberDecimal("2581753.59")`          |
| `egresos`           | Decimal128   | Sí        | Total de egresos                                                            | ≥ 0, 2 decimales                                                            | `NumberDecimal("2620211.53")`          |
| `ganancia`          | Decimal128   | Sí        | Resultado neto (ingresos - egresos)                                         | Calculado automáticamente                                                   | `NumberDecimal("-38457.94")`           |
| `rentabilidad`      | String       | No        | Porcentaje de rentabilidad                                                  | Formato `"-X.XX%"` o `"+X.XX%"`                                             | `"-1.49%"`                             |
| `tipo_resultado`    | String       | No        | Clasificación del resultado                                                 | Valores: `GANANCIA`/`PÉRDIDA`/`NEUTRO`                                      | `"PÉRDIDA"`                            |
| `total_transacciones` | Integer     | No        | Cantidad de transacciones                                                   | Entero ≥ 0                                                                  | `2093`                                 |

## Relaciones y validaciones
1. **Validación de fechas**:  
   ```javascript
   fecha_fin > fecha_inicio