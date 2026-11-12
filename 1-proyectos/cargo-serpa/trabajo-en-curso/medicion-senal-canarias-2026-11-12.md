# Medición: ¿responde más quien tiene señal de Canarias? (12/11/2026)

Medición de solo lectura sobre Notion, base "Prospectos", hecha el 12/11/2026. No se cambió nada en Notion.

## Conclusión

Las fichas con señal de Canarias responden unas 4 veces más que las marcadas "sin señal" (20,0 % frente a 4,6 %).
La dirección es clara y se repite en cada corte. **La magnitud exacta no es fiable** (ver sesgos).

## Alcance y definiciones

- **Base**: Prospectos (`collection://13d4b104-efef-4349-a37d-75405ae10799`).
- **Contactos fríos**: se excluyen `Origen = Cartera CRM` y las campañas `REACT…`.
- **Enviado**: `Estado` = Contactado, Respondió o Cerrado sin éxito.
- **Respuesta**: `Estado = Respondió`. Quien contestó y acabó en "Cerrado sin éxito" no cuenta.
- **Respuesta "Encaja"**: `Estado = Respondió` y `Veredicto = Encaja`.
- **Señal**: no hay campo en Notion; se clasificó por el texto de `Notas`.
  - "Sin señal": contiene "sin señal", "no hay señal", "no verificada" o "sin verificar señal".
  - "Con señal": no es "sin señal" y menciona Canarias, Tenerife o Las Palmas.
  - "No dice nada": el resto.

## Totales

823 enviados, 71 respuestas (8,6 %), 34 respuestas "Encaja" (4,1 %).

Por mes de creación de la ficha: septiembre 114 enviados y 14 respuestas; octubre 694 y 56; noviembre 15 y 1.

## Por señal de Canarias

| Grupo | Enviados | Respuestas | Respuestas "Encaja" |
|---|---|---|---|
| Con señal | 120 | 24 (20,0 %) | 16 (13,3 %) |
| No dice nada de señal | 246 | 26 (10,6 %) | 8 (3,3 %) |
| "Sin señal" explícito | 457 | 21 (4,6 %) | 10 (2,2 %) |

Mismo corte solo con fichas de `Origen` Apollo y "F · Rutina diaria" creadas en octubre (misma plantilla, mismo mes):

| Grupo | Enviados | Respuestas | Respuestas "Encaja" |
|---|---|---|---|
| Con señal | 46 | 8 (17,4 %) | 5 (10,9 %) |
| No dice nada de señal | 143 | 16 (11,2 %) | 4 (2,8 %) |
| "Sin señal" explícito | 449 | 21 (4,7 %) | 10 (2,2 %) |

## Sesgos

- **Las notas se amplían después de responder.** Las fichas que respondieron tienen notas unas tres veces más largas
  (700-950 caracteres frente a 250-290), y ahí puede aparecer "Canarias" por lo que dijo el prospecto. Infla "con señal".
- **El grupo "sin señal" no tiene ese problema** (la regla le da prioridad): su 4,7 % es el dato más limpio.
  En el peor caso, todo lo demás junto responde al 12,7 % (24 de 189) en el corte de octubre.
- **"Sin señal" coincide con las cargas masivas de finales de octubre** (empresas grandes, enviadas más tarde):
  parte de la diferencia puede ser tamaño de empresa o menos tiempo para contestar.
- **Muestras pequeñas** en "con señal": 46 envíos en el corte limpio.
- "Con señal" incluye algunos inbound y referidos (al menos 4 respuestas), que no son fríos puros.

## Por origen

| Origen | Enviados | Respuestas | Respuestas "Encaja" |
|---|---|---|---|
| Apollo | 429 | 35 (8,2 %) | 13 (3,0 %) |
| F · Rutina diaria | 218 | 11 (5,0 %) | 7 (3,2 %) |
| A · Receptor islas | 56 | 3 (5,4 %) | 2 |
| B · Emisor peninsular | 51 | 9 (17,6 %) | 5 (9,8 %) |
| Clay | 35 | 5 (14,3 %) | 0 |
| Búsqueda inicial | 12 | 0 | 0 |
| Referido | 10 | 3 | 3 |
| E · Señal de momento | 7 | 0 | 0 |
| Inbound | 2 | 2 | 2 |
| Sin origen | 3 | 3 | 2 |

## Por sector (Cluster)

| Sector | Enviados | Respuestas | Respuestas "Encaja" |
|---|---|---|---|
| Material eléctrico y fotovoltaico | 194 | 16 (8,2 %) | 11 (5,7 %) |
| Maquinaria y equipos industriales | 141 | 14 (9,9 %) | 5 (3,5 %) |
| Material médico | 123 | 9 (7,3 %) | 5 (4,1 %) |
| Otro | 100 | 8 (8,0 %) | 6 (6,0 %) |
| Farmacéutico | 87 | 7 (8,0 %) | 2 (2,3 %) |
| Construcción | 48 | 5 (10,4 %) | 2 (4,2 %) |
| Recambios de automoción | 40 | 2 (5,0 %) | 1 |
| Alimentación y bebidas | 32 | 1 (3,1 %) | 1 |
| Importación y distribución | 31 | 2 (6,5 %) | 0 |
| Logística y transitarios | 16 | 3 | 0 |
| Sin sector | 11 | 4 | 1 |

El sector mueve poco la tasa (casi todo entre el 7 % y el 10 %). La señal separa mucho más.

## Otros hallazgos

- **Solo 219 de los 823 enviados (27 %) tienen "Fecha primer envío"** en Prospectos. No se puede medir por tanda de envío.
- **Base "Por contactar"** (`collection://4f2bc9fe-3fd6-4b47-b280-7373c66ce811`), 12/11/2026: 574 sin contactar,
  114 contactadas, 10 respondieron y 1 cerrada (699 fichas). Las 125 ya enviadas siguen ahí, no en Prospectos.
  Estas 125 **no están incluidas** en las tablas de arriba ni desglosadas por señal `[POR COMPROBAR]`
  (Notion cortó las consultas por límite de uso).

## Qué se propone (pendiente de decisión de Alex)

1. Ordenar la cola de "Por contactar" por señal de Canarias: primero las que la tienen, al final las "sin señal".
2. No cargar contactos nuevos sin señal mientras haya cola.
3. El experimento de mensaje con gancho queda en segundo plano: la medición apoya a quién se escribe, no qué se dice.
