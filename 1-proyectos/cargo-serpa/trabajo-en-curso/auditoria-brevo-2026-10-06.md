# Auditoría de Brevo y cruce con Notion (06/10/2026)

Solo lectura. Fuentes: Brevo (campañas y listas, estadísticas a 06/10/2026) y Notion "Prospectos" (fichas con `Estado = Respondió`, cruzadas por email).

## Campañas enviadas (11, 249 envíos)

| Campaña | Envío | Enviados | Entregados | Rebote duro | Respuestas identificadas | Tasa (sobre enviados) |
|---|---|---|---|---|---|---|
| REACT Courier / Interislas / Operadores | 28/09 | 23 | 18 | 1 | 0 | 0 % |
| REACT Marítimo | 28/09 | 18 | 18 | 0 | 1 (Coproma) | 5,6 % |
| REACT2 Internacional/otros | 28/09 | 10 | 9 | 1 | 2 (VVO, Induquim) | 20 % |
| REACT2 Marítimo / Courier / Interislas | 28-30/09 | 3 | 3 | 0 | 0 | 0 % |
| REACT3 Dormidos courier (A/B asunto) | 30/09 | 72 | 56 | 10 | 6 (Pfisterer, Recambios OP, Servicio10, Automotor, PD Estación, Improve) + hasta 2 sin identificar | 8,3 % (hasta 11 %) |
| REACT5 Cartera fría 6-12m | 01/10 | 36 | 32 | 3 | 0 | 0 % |
| REACT6 Tanda 1 | 02/10 | 87 | 64 | 13 | 3 (Cororasa, WOC, Surdiesel) | 3,4 % |
| **Total** | | **249** | **200** | **28 (11 %)** | **12 identificadas (4,8 %)** | |

Muestras pequeñas: no sacar conclusiones por campaña, solo orden de magnitud.

## Respuestas útiles de Brevo (veredicto "Encaja")

Pfisterer (hacen portes a Canarias; histórico 8 envíos, 3.718 € en 2023), VVO Construcciones, Induquim y Coproma (pregunta por Baleares, pasada a Lidia/Mercedes). Automotor: oportunidad si se recupera la distribución capilar. En total 4-5 de 249 envíos, alrededor del 2 %. `[POR COMPROBAR]` cuántas se convierten en facturación.

## Hallazgos

1. **Rebotes**: 28 duros de 249 (11 %). Las dos últimas campañas, enviadas desde el subdominio, rebotan un 14,5 % (23 de 159). Riesgo para la reputación de `comunicaciones.cargoserpa.es`.
2. **Remitente mezclado**: 9 de 11 campañas salieron desde `alexsantana@cargoserpa.es`. `[POR COMPROBAR]` si `cargoserpa.es` está autenticado en Brevo (DNS lo lleva Loading).
3. **Particulares**: REACT3 incluye unos 13 contactos marcados `particular` (gmail, hotmail…), no B2B.
4. **Sin medición**: las respuestas llegan a Outlook; ninguna herramienta cuenta respuestas por campaña. Este cruce lo resuelve de forma retroactiva.
5. **Notion desfasado**: Dielca (fcabrera@dielca.com) y J2O Sistemas (jose.ortega@octimiza.com) constan como "Sin contactar", pero están en la lista REACT5, que se envió el 01/10. `[POR COMPROBAR]` si llegó o no el envío.
6. **Dos respuestas sin identificar** en Notion (Daniela, "Hola, Alex"), del 30/09: probablemente REACT3. `[POR COMPROBAR]`
7. Notion: unas 89 fichas sin `Origen`.
8. Brevo: borrador vacío REACT6_TANDA1 (id 13) y lista "Su primera lista" sin uso. Campañas ya enviadas con "BORRADOR" / "PROGRAMADA" en el nombre.
