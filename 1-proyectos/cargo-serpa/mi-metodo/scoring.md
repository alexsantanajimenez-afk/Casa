# Scoring de leads y reparto de cuota (BORRADOR, 13/10/2026)

**Estado: propuesta, sin aplicar.** No se ha cambiado la tarea programada de las 06:52 ni ningún dato de Notion.
Alex pidió empezar por el scoring y el reparto de cuota (13/10/2026). Los pesos son una primera hipótesis
y hay que contrastarlos con los envíos ya hechos antes de aplicarlos.

Inspirado en los 6 pasos de un GTM engineer de LinkedIn (ICP, TAM, espacio de trabajo, scoring,
playbook de outbound, señales), adaptados a lo que usamos: Apollo, Notion y Supabase (Clay no se usa).

## 1. Scoring de 0 a 100

Misma escala que el campo `Puntuación` de Notion (ya usado en fichas antiguas, por ejemplo 92 y 58).
Se calcula **antes de enriquecer**, con los datos de la búsqueda de Apollo (que no gasta créditos de lead),
y se escribe en `Puntuación`.

| Criterio | Puntos | Cómo se puntúa |
|---|---|---|
| Encaje de sector | 0-30 | 30: sanitario, ortopedia, farma, energía/EPC, maquinaria y recambios. 20: importación y distribución, alimentación, construcción. 10: otros industriales. 0: logística y partners |
| Señal de Canarias | 0-30 | 30: sede, delegación o clientes en Canarias, verificado. 20: Baleares verificado. 10: probable, sin verificar. 0: ninguna |
| Señal de momento | 0-15 | 15: licitación, ZEC, BORME u oferta de empleo de los últimos 30 días. 8: de los últimos 90 días. 0: ninguna |
| Tamaño | 0-15 | 15: 20-500 empleados. 8: 10-19 o más de 500. 0: menos de 10 |
| Contacto | 0-10 | 10: compras, logística o comercio exterior. 7: dirección en pyme. 3: operativo. Email no verificado: se descarta, no puntúa |

Umbrales:
- **70 o más**: se contacta ya.
- **50-69**: se contacta si hay hueco en la cuota del día.
- **Menos de 50**: no se gastan créditos; queda como nurturing.

Usos: ordenar candidatos de la rutina diaria, elegir los segundos toques (el 13/10 se eligieron a criterio) y priorizar
la cartera fría.

### Límites conocidos
- La señal de Canarias no está contrastada como predictor de respuesta: Eranovum, Solarig y Herco respondieron sin ella.
- La fórmula `Temperatura` de Notion puede depender de `Puntuación`; no se pudo leer. `[POR COMPROBAR]` antes de rellenar el campo en masa.
- Pendiente: aplicar el scoring a los 226 contactos del 1:1 ya enviados y ver si los que respondieron puntúan más (backtest).

### Contraste inicial de la señal de Canarias (13/10/2026, 226 contactos de "Outlook 1:1")

Clasificación hecha por texto en `Notas` (aproximada):

| Señal en Notas | Enviados | Respondieron | Útiles ("Encaja") |
|---|---|---|---|
| Canarias verificada | 92 | 7 (7,6 %) | 5 (5,4 %) |
| No consta (incluye "sin señal" y fichas sin ese dato) | 126 | 11 (8,7 %) | 4 (3,2 %) |
| Baleares verificada | 8 | 0 | 0 |

Lectura: la tasa de respuesta es parecida con o sin señal de Canarias; las respuestas **útiles** son algo mayores con señal (5,4 % frente a 3,2 %),
pero la diferencia (5 frente a 4 casos) es demasiado pequeña para concluir. No se puede confirmar ni descartar el peso de 30 puntos.
Se mantiene por la razón de negocio (el 67,7 % de lo que se factura llega a Canarias) y se revisa tras la prueba de 2 semanas.
Baleares: 0 de 8, muestra mínima.

## 2. Reparto de cuota diaria (sobre 20)

Datos del 13/10/2026, campaña "Outlook 1:1" (226 contactos enviados). Muestras pequeñas; los envíos del 13/10 no han madurado.

| Segmento (cluster de Notion) | Enviados | Respondieron | Útiles ("Encaja") |
|---|---|---|---|
| Material médico | 37 | 3 | 3 |
| Material eléctrico y fotovoltaico | 51 | 5 | 2 |
| Maquinaria y equipos industriales | 41 | 4 | 1 |
| Recambios de automoción | 17 | 2 | 1 |
| Alimentación y bebidas | 16 | 1 | 1 |
| Importación y distribución | 14 | 1 | 0 |
| Farmacéutico | 12 | 1 | 1 |
| Construcción | 8 | 0 | 0 |
| Logística y transitarios | 7 | 0 | 0 |
| Otro (exportadores genéricos) | 22 | 0 | 0 |

Cuota propuesta (prueba de 2 semanas, luego revisar):

| Grupo de la rutina | Hoy | Propuesta |
|---|---|---|
| A Sanitario, farma y diagnóstico | 8 | 8 |
| B Maquinaria, recambios y vehículos | 4 | 4 |
| C Energía, instalaciones y renovables | 2 | **5** |
| D Logística, transporte y handling | 2-3 | **0** (partners fuera del outbound, decisión de Alex del 13/10) |
| E Importación y distribución | 3 | 3 (priorizar quien importa de Asia) |
| F Industria, ingeniería y otros | 1 | **0** (0 de 22 en "Otro") |

Los gemelos siguen con un máximo de 4 dentro de los 20.

## 3. Cambios previstos en la tarea "Rutina diaria de leads" (no aplicados)

1. Punto 1: nuevas cuotas (A 8, B 4, C 5, D 0, E 3, F 0).
2. Paso nuevo antes del cruce del punto 4: calcular la puntuación con la tabla de arriba, descartar por debajo de 50 sin gastar créditos
   y escribirla en `Puntuación`.
3. Quitar del punto 3 la excepción de logística (grupo D) y avisar en el resumen del reparto real por grupo y de la puntuación media.

Editar el prompt de la tarea requiere el OK explícito de Alex.

## Siguientes pasos acordados
- Hecho: este borrador.
- Pendiente (cuando vuelvan Notion y Supabase): backtest sobre los 226 enviados.
- Después, con OK de Alex: aplicar a la tarea, empezar la prueba de 2 semanas y revisar.
- Más adelante: ICP v2 desde los 62 clientes, tabla de Cuentas separada de Contactos, TAM, pruebas A/B de mensaje.
