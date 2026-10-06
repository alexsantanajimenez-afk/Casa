# Analítica GA4 de cargoserpa.es · lectura del 06/10/2026

Extracción en solo lectura de Alex (propiedad `G-C2TWFJZ8Q1`). Rango principal: 04/07 a 01/10/2026; tendencia: últimos 12 meses.
Límites: no se capturó la tasa de interacción por página de destino; fuente/medio de 12 meses incompleto (22 de 33 filas); hora y día son visualizaciones de la home, no sesiones; zona horaria de la propiedad sin verificar; 35 sesiones sin cuadrar en la tendencia mensual.

## Cifras base (04/07 a 01/10)
- 5.014 sesiones, 1.299 usuarios activos, tasa de interacción 31,31 %.
- 89 % de las sesiones entran por `/index.aspx` (4.462). Contacto 142, transporte 101 (4 s), delegaciones 41.
- Dirección: 4.412 sesiones directas (88 %), estables en ~1.500 al mes durante 12 meses.

## Tráfico que sí es captación (búsqueda, IA, referidos): ~577 sesiones en 90 días (~190 al mes)
| Fuente | Sesiones | Interacción |
|---|---|---|
| google / organic | 253 | 43,5 % |
| bing / organic | 238 | 24,8 % |
| chatgpt.com / ai-assistant | 41 (más 17 + 9 en 12 meses) | 48,8 % |
| elitegln.com / referral | 27 | 74,1 % |
| Resto de buscadores y referidos | ~18 | variable |

## Hallazgos
1. **Directo ≈ clientes y equipo entrando al login** `[PROBABLE]`: patrón laboral (picos de 9 a 13 h, fines de semana menos del 6 %), plano mes a mes. No es tráfico de prospectos. La web nueva debe mantener el acceso de clientes bien visible.
2. **Bots**: Dublín (74 usuarios, 3,9 % interacción, 3 s), centros de datos de EE. UU. (~120 usuarios, 0-4 s), navegador y SO "(not set)" (71 usuarios, 5 s), `ntp.msn.com` (70 sesiones, 1 s, 14 % interacción), Linux (101 usuarios, 7 s). Inflan el inglés (368 usuarios, 28 %, 15 s) y contaminan cualquier media.
3. **IA como canal**: ChatGPT envía tráfico con la mejor intención: casi la mitad entra directo a `/contacto` y `/servicios-especiales` (51 s en servicios). También hay `gemini`. Es la señal de que el GEO funciona un poco, en servicios especiales y contacto.
4. **Bing pesa casi como Google** en búsqueda orgánica (238 frente a 253; 12 meses: 1.286 frente a 1.077). Bing alimenta a ChatGPT y a Copilot: darse de alta en Bing Webmaster Tools y enviar el sitemap tiene valor directo para GEO.
5. **elitegln.com** (red Elite GLN) es referencia real: 27 sesiones, 74 % de interacción, y 11 vienen de China. Es el único tráfico internacional con pinta de humano. Coincide con las credenciales WCA / Elite GLN de la maqueta.
6. **Búsqueda orgánica a la baja**: de 321 sesiones en oct-2025 a 150-230 después.
7. **URLs duplicadas** por mayúsculas y extensión (`/index` y `/index.aspx`, `/delegaciones` y `/Delegaciones.aspx`, `/servicios-especiales` con y sin `.aspx`) fragmentan los datos. La web nueva necesita 301 a una sola versión.
8. **Idioma**: español 803 usuarios con 58 s; inglés casi todo bot. Alemán (25, 65 %), italiano (23), chino (32, 52 %) tienen tráfico pequeño pero con interacción.

## Qué cambia en el plan
- Medir con filtro: excluir países y ciudades de centros de datos, y `ntp.msn.com`, antes de hablar de visitas. Base honesta: ~190 sesiones al mes de captación.
- Medir leads: hoy no hay evento de formulario ni de clic en teléfono; sin ellos no hay conversión.
- Priorizar `/contacto` y `/servicios-especiales` (lo que la IA ya recomienda).
- No invertir en anuncios en inglés por ahora.
- Dar de alta Bing Webmaster Tools y Search Console al publicar.
