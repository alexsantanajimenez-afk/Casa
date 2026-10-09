# Medición con GTM y GA4

Propiedad GA4 `G-C2TWFJZ8Q1` (ID de propiedad 366267754). Hoy solo registra 4 eventos automáticos y ninguno clave. El sitio ya empuja eventos a `dataLayer`; en GTM hay que crear una etiqueta de evento de GA4 por cada uno.

## Consent Mode v2
`<head>` define el consentimiento por defecto en "denied" (analítica, publicidad, datos de usuario y personalización) y `site.js` lo actualiza cuando la persona acepta. En GTM, activar "Consent Mode" y no disparar GA4 sin `analytics_storage` concedido (o usar el modo avanzado con los pings sin cookies, según decida Cargo Serpa).

## Eventos que emite la web
| Evento (dataLayer) | Cuándo | Parámetros | Marcar como evento clave |
|---|---|---|---|
| `generate_lead` | Envío correcto de un formulario | `form_id` (presupuesto, internacional, internacional_en), `service_type`, `language` | **Sí** |
| `click_phone` | Clic en un enlace `tel:` | `phone`, `page` | **Sí** |
| `click_email` | Clic en un enlace `mailto:` | `email`, `page` | No |
| `click_whatsapp` | Botón de abrir WhatsApp | `page` | No |
| `file_download` | Descarga de un formulario (enlaces con `data-download`) | `file_name` | No |
| `tracking_search` | Búsqueda en la caja de seguimiento | `page` | No |
| `language_switch` | Cambio ES/EN | `from`, `to` | No |
| `faq_open` | Abrir una pregunta frecuente | `question` | No |

## Configuración en GA4
- Quitar el evento clave `purchase` (sin datos).
- Activar el filtro "Internal Traffic" (hoy en modo prueba) con las IP de las oficinas.
- Registrar `service_type`, `language`, `form_id` como dimensiones personalizadas.
- Quitar Universal Analytics (`UA-205790040-1`) del código.
- El GES y la oficina virtual **no** deben llevar esta etiqueta.

## UTM (anuncios y correos)
`utm_source` (linkedin, brevo, meta), `utm_medium` (paid, email), `utm_campaign` (nombre de la campaña, p. ej. `REACT6_2026-10`).

## Datos de partida (06/10/2026)
~190 sesiones al mes de captación real (búsqueda, IA, referidos); el 88 % del tráfico es directo y se atribuye a trabajadores y clientes entrando al GES. Detalle en `analitica-ga4-2026-10-06.md` y `search-console-2026-10-06.md` de la Casa.
