# Auditoría técnica de cargoserpa.es (25/09/2026)

> Copia íntegra del texto que Alex pegó en la sesión "Mejora de diseño web" el 25/09/2026. Es su auditoría
> (autor: Alex Santana), no se ha modificado. Nota: dice "vida media de ~10,2 meses"; la cifra vigente del
> proyecto es **12,1 meses** (ver `../../sobre-el-proyecto/cifras.md`).

---

eso no era. es esto: # Auditoría técnica — cargoserpa.es

**Fecha:** 25/09/2026 · **Auditor:** Alex Santana (Fractional Head of Growth, Cargo Serpa)
**Alcance:** cómo está construida y montada la web. Sin acceso a GA4, Search Console ni servidor.
**Páginas revisadas:** /index.aspx, /contacto.aspx, /transporte.aspx, /servicios-especiales, /index.html, /robots.txt, /sitemap.xml

**Etiquetas:**
- [VERIFICADO]: comprobado, con la fuente indicada.
- [PROBABLE]: inferencia razonada.
- [POR COMPROBAR]: falta acceso o prueba.

---

## 0. Contexto del negocio (para priorizar)
- Logística B2B, especializada en el corredor Península–Canarias (aprox. 2/3 de la facturación).
- La web no vende: su trabajo es generar solicitudes de cotización y llamadas.
- Cliente activado: facturación media de ~15.000 € y vida media de ~10,2 meses.
- Vara de medir: 1 cliente activado más al mes que llegue por la web ≈ 180.000 €/año de facturación potencial. Es un techo teórico, sin descontar margen.

## 1. Stack detectado [VERIFICADO: cabeceras HTTP + DOM]
- Servidor: `Microsoft-IIS/8.5`, `X-AspNet-Version: 4.0.30319`, `X-Powered-By: ASP.NET`, `X-Powered-By-Plesk: PleskWin`
- ASP.NET Web Forms: existe el campo `__VIEWSTATE` y el formulario es `form2` con action `./index.aspx`.
- Front: jQuery 3.0.0 (2016) y Bootstrap 3.2.0 (2014).
- Más de 50 scripts: Revolution Slider y LayerSlider a la vez, fancybox, isotope, masonry, morris, raphael, jplayer, livicons, pixastic…
- Agencia que montó la web: ayainformatica.es (según la meta author).
- Copyright en el pie: 2021.

---

## 2. Hallazgos

### CRÍTICO 1 — El servidor no tiene soporte de seguridad
- [VERIFICADO] Las cabeceras declaran IIS 8.5.
- [PROBABLE] Corre sobre Windows Server 2012 R2, porque IIS 8.5 solo existe en ese sistema. Microsoft dejó de dar soporte a 2012 R2 el 10/10/2023.
- [VERIFICADO] Las cabeceras exponen versiones exactas: `Server`, `X-AspNet-Version`, `X-Powered-By`, `X-Powered-By-Plesk`.
- **Cómo comprobarlo:**
```bash
  curl -sI https://cargoserpa.es/index.aspx
  # Buscar cabeceras de seguridad: Strict-Transport-Security, Content-Security-Policy,
  # X-Frame-Options, X-Content-Type-Options, Referrer-Policy
```
  Complementar con https://securityheaders.com y el test SSL de https://www.ssllabs.com/ssltest/
- **Qué hacer:**
  - Preguntar a la agencia o al hosting qué sistema operativo corre y si tiene ESU (parches de pago).
  - Planificar la migración.
  - Quitar las cabeceras de versión en web.config: `<httpRuntime enableVersionHeader="false"/>`, `removeServerHeader` y eliminar `X-Powered-By`.

### CRÍTICO 2 — Cookies de analítica antes del consentimiento (RGPD / AEPD)
- [VERIFICADO] Al cargar la página sin tocar el banner ya existen `_ga`, `_gid`, `_ga_C2TWFJZ8Q1` y `_gat_gtag_UA_205790040_1`.
- [VERIFICADO] No hay Consent Mode.
- [VERIFICADO] El texto del banner dice "si continúa navegando, supone la aceptación". Es consentimiento implícito, que la AEPD no admite, y el banner no tiene botón de rechazar.
- [VERIFICADO] El aviso de privacidad del formulario menciona un "fichero inscrito ante la AEPD" (algo que desapareció en 2018) y no informa de la base legal ni del plazo de conservación.
- **Cómo comprobarlo:** abrir en incógnito, sin tocar el banner, y en la consola ejecutar `document.cookie`. O revisar DevTools → Application → Cookies.
- **Qué hacer:**
  - Instalar un CMP (Cookiebot, CookieYes, Iubenda) con Aceptar / Rechazar / Configurar al mismo nivel.
  - Activar Consent Mode v2, con todo en `denied` por defecto.
  - Actualizar el texto legal.

### CRÍTICO 3 — Dos mapas envían a la competencia y los datos de contacto no cuadran
- [VERIFICADO] En /contacto.aspx, el iframe de Lanzarote apunta a la ficha "Redur" y el de Fuerteventura a "DHL Fuerteventura".
- [VERIFICADO] El resto de mapas apuntan mal:
  - Madrid: al aeropuerto de Barajas.
  - Barcelona: al aeropuerto de El Prat.
  - Las Palmas: a "Calle Josefina Mayor, 22", que no es la dirección publicada.
- [VERIFICADO] Los datos cambian entre la home y la página de contacto:

  | Delegación | Home | Contacto |
  |---|---|---|
  | Las Palmas, centralita | 928 700 984 | 928 688 074 |
  | Lanzarote, dirección | C/ Malpaís de San José, nave 8 | Hnos. Aguilar Sánchez, nave 8 |
  | Fuerteventura, dirección | C/ Belillo, 9 | El Belillo, Pol. Ind. El Matorral |
  | Fuerteventura, teléfono | 928 543 377 | "+34 92 88 54 30 93" (10 dígitos, número imposible) |
  | Baleares | Aparece | No aparece |

- **Cómo comprobarlo:**
```bash
  curl -s https://cargoserpa.es/contacto.aspx | grep -o 'maps/embed?pb=[^"]*'
  curl -s https://cargoserpa.es/index.aspx | grep -o 'maps.google.com/maps?[^"]*'
```
  Cruzar cada dirección y teléfono con la ficha de Google Business de la delegación.
- **Qué hacer:**
  - Pedir a Cargo Serpa una tabla única y validada de delegaciones (dirección, teléfonos, emails, enlace de la ficha de Google Business).
  - Sustituir los iframes por el embed de cada ficha propia.
  - Centralizar los datos en un solo sitio para que la home y contacto no puedan volver a divergir.

### ALTO 4 — La analítica está rota: los leads no se miden
- [VERIFICADO] El único `gtag('config')` del código es `UA-205790040-1` (Universal Analytics, que no procesa datos desde el 01/07/2023).
- [VERIFICADO] También se carga `G-C2TWFJZ8Q1` (GA4). [PROBABLE] que llegue a través de la etiqueta vinculada de UA y no con una instalación propia. Es frágil.
- [VERIFICADO] No hay GTM ni píxel de Meta.
- [VERIFICADO] En /contacto.aspx no hay ningún `gtag('event')`: el envío del formulario no se mide.
- [VERIFICADO] Teléfonos y emails en texto plano: no se miden los clics en `tel:` ni en `mailto:`.
- **Cómo comprobarlo:**
  - Google Tag Assistant sobre la home y contacto.
  - En la consola: `dataLayer`.
  - En GA4 (G-C2TWFJZ8Q1), pedir acceso y revisar Admin → Flujos de datos → Etiquetado → "Etiquetas vinculadas".
- **Qué hacer:**
  - Instalar GTM.
  - GA4 nativo, con Consent Mode v2.
  - Quitar UA.
  - Eventos `generate_lead` (envío del formulario, disparado en la página o estado de "gracias"), `click_phone` y `click_email`.
  - Marcar esos eventos como conversiones.
  - Añadir UTMs en los enlaces de LinkedIn y Brevo.
  - Registrar "origen = web" en el CRM.

### ALTO 5 — Rendimiento: 8,4 MB y 128 peticiones en la home
- [VERIFICADO] (Resource Timing, escritorio, conexión del auditor):
  - 8.452 KB transferidos en 128 peticiones.
  - DOMContentLoaded en 2,0 s y load en 3,1 s.
- [VERIFICADO] Archivos más pesados:

  | Archivo | Peso |
  |---|---|
  | `content/video/video.mp4` | 3.816 KB |
  | `livicons-1.4.min.js` | 595 KB |
  | `style.css` | 516 KB |
  | `bootstrap.css` | 217 KB |
  | `rs-slider1-phone.png` | 194 KB |
  | `rs-slider1-bg.jpg` | 178 KB |

- [VERIFICADO] Más de 50 scripts JS, bloqueantes y sin agrupar; dos librerías de slider cargadas a la vez.
- [POR COMPROBAR] Core Web Vitals en móvil (LCP, INP, CLS).
- **Cómo comprobarlo:**
```bash
  npx lighthouse https://cargoserpa.es/index.aspx --form-factor=mobile --output=json --output-path=./lh-mobile.json
```
  Y https://pagespeed.web.dev para ver los datos CrUX reales.
- **Qué hacer (si se mantiene la web):**
  - Quitar el vídeo de fondo o servirlo desde YouTube o Vimeo con un póster.
  - Eliminar los plugins que no se usan.
  - Dejar un solo slider, o ninguno.
  - Pasar las imágenes a WebP o AVIF con `loading="lazy"`.
  - Poner `defer` en los scripts.
  - Activar compresión y caché en IIS.

### ALTO 6 — SEO técnico inexistente
- [VERIFICADO] `/robots.txt` y `/sitemap.xml` devuelven 404.
- [VERIFICADO] Las cuatro páginas revisadas tienen el mismo `<title>` y la misma meta description ("Cargo Serpa, líder transporte entre Península y Canarias").
- [VERIFICADO] Faltan elementos básicos:
  - No hay `<link rel="canonical">`.
  - El `<html>` no tiene atributo `lang`.
  - No hay datos estructurados JSON-LD.
- [VERIFICADO] Hay 4 H1 en la home y 4 en servicios especiales.
- [VERIFICADO] Todavía usa `meta keywords`.
- [VERIFICADO] URLs duplicadas o incoherentes:
  - `/servicios-especiales` (menú) frente a `/servicios-especiales.aspx` (tarjetas).
  - `/login` frente a `/login.aspx`.
  - La miga de pan apunta a `/index.html`, un resto de la plantilla sin contenido.
  - La política de privacidad se enlaza como `http://www.cargoserpa.es/...`.
- **Cómo comprobarlo:**
```bash
  for u in http://cargoserpa.es https://www.cargoserpa.es https://cargoserpa.es/ https://cargoserpa.es/index.aspx https://cargoserpa.es/index.html https://cargoserpa.es/servicios-especiales https://cargoserpa.es/servicios-especiales.aspx; do
    echo "$u -> $(curl -s -o /dev/null -w '%{http_code} %{redirect_url}' "$u")"; done
```
  Complementar con:
  - Rastreo con Screaming Frog (gratis hasta 500 URLs).
  - `site:cargoserpa.es` en Google.
  - Search Console → Páginas.
- **Qué hacer:**
  - Crear robots.txt y sitemap.xml y enviar el sitemap a Search Console.
  - Title y meta description únicos por página, orientados a búsquedas como "transporte Península Canarias empresas", "agente de aduanas Canarias DUA" o "transporte marítimo Canarias grupaje".
  - Un solo H1 por página.
  - `lang="es"` en el `<html>`.
  - Canonical en todas las páginas.
  - Redirecciones 301 a una sola versión de cada URL.
  - Schema `Organization` más `LocalBusiness` por delegación.
  - Borrar `index.html`.

### MEDIO 7 — Restos de la plantilla y errores de contenido
- [VERIFICADO] El slider de la home muestra los textos "HTML5" y "CSS3" y usa imágenes de demo (`rs-slider1-html5-*`, `rs-slider3-pig*`).
- [VERIFICADO] Barras de progreso sin sentido: "Península e islas 90%", "Internacional 40%", "Península 58%".
- [VERIFICADO] Tarjetas de servicio con el título duplicado y enlaces a `#`.
- [VERIFICADO] Plazos contradictorios en carga aérea: la home dice 48-72h y /transporte dice "24 a 48 horas" y, en el mismo párrafo, "48 ó 72 horas".
- [VERIFICADO] Erratas: "intrnacional", "Leer mas", "Tambien", "Logistica", "Mercancias", "plantas u animales". Contenedores de 20''/40'' (pulgadas, cuando son pies).
- [VERIFICADO] Copyright de 2021.
- **Qué hacer:** limpieza de contenido. La corrección de texto no necesita a la agencia; subir los cambios a la web sí.

### MEDIO 8 — Conversión: no hay forma de pedir cotización
- [VERIFICADO] El único formulario es genérico (nombre, email, teléfono opcional, observaciones) y tiene captcha.
- [VERIFICADO] No hay ningún CTA de "Pide cotización".
- [VERIFICADO] El email comercial (pricing@) solo aparece en contacto.
- [VERIFICADO] El teléfono destacado es el de Madrid y no hay WhatsApp.
- [VERIFICADO] No hay caja de seguimiento de envíos, aunque la web promete el seguimiento "en tiempo real".
- [VERIFICADO] Las redes enlazadas son Facebook e Instagram; LinkedIn no aparece.
- [POR COMPROBAR] Que el formulario llegue de verdad a su destino (envío de prueba, con el OK de Cargo Serpa).
- **Qué hacer:**
  - Formulario de cotización con origen, destino, servicio (courier, marítimo, aéreo, aduanas), peso y bultos, frecuencia y empresa/CIF.
  - CTA fijo en todas las páginas.
  - WhatsApp y teléfonos de Canarias visibles.
  - Caja de tracking en la home.
  - Añadir LinkedIn.

### MEDIO 9 — Accesibilidad (EAA, obligatoria desde el 28/06/2025)
- [VERIFICADO] 35 de 36 imágenes de la home sin `alt`.
- [VERIFICADO] Falta el atributo `lang` y la jerarquía de encabezados está rota.
- [POR COMPROBAR] Contraste, navegación con teclado y etiquetas del formulario.
- **Cómo comprobarlo:**
```bash
  npx @axe-core/cli https://cargoserpa.es/index.aspx https://cargoserpa.es/contacto.aspx
```
  Y WAVE (wave.webaim.org).
- **Nota:** [POR COMPROBAR] si Cargo Serpa entra en el ámbito de la EAA. La ley exime a las microempresas que prestan servicios; lo lógico es tratarlo como riesgo más que como obligación segura.

---

## 3. Plan priorizado

| # | Acción | Quién | Plazo |
|---|---|---|---|
| 1 | Ocultar cabeceras de versión y confirmar el SO y los parches del servidor | Agencia / hosting | Ahora |
| 2 | Corregir mapas, direcciones y teléfonos con la tabla validada | Cargo Serpa + agencia | Ahora |
| 3 | CMP + Consent Mode v2 + texto legal actualizado | Agencia + consultor | Ahora |
| 4 | GTM + GA4 nativo + eventos de lead como conversión; quitar UA | Consultor | Ahora |
| 5 | Limpieza de restos de plantilla y erratas | Agencia | Ahora |
| 6 | robots.txt, sitemap, title/description únicos, canonical, 301, lang, schema | Agencia | 1-3 meses |
| 7 | Formulario de cotización, CTA fijo, WhatsApp, caja de tracking | Agencia | 1-3 meses |
| 8 | Rendimiento: vídeo, scripts, imágenes | Agencia | 1-3 meses |
| 9 | **Decisión: parchear o rehacer** (servidor sin soporte + deuda técnica). Si se rehace, mantener el login y la oficina virtual de clientes | Dirección | Estructural |

## 4. Pendiente de verificar

| Qué | Herramienta |
|---|---|
| Core Web Vitals en móvil | PageSpeed Insights / Lighthouse |
| Redirecciones http/https, www y duplicados | curl (script de arriba) / Screaming Frog |
| Páginas indexadas y consultas por las que aparece | Search Console (pedir acceso) |
| Configuración real de GA4 y si recibe datos | Acceso a GA4 |
| Sistema operativo y parches del servidor | Preguntar a la agencia o al hosting |
| Que el formulario entregue los mensajes | Envío de prueba con OK del cliente |
| Coherencia con las fichas de Google Business | Revisión manual por delegación |
| Contraste y navegación por teclado | axe / WAVE |
| Qué otras páginas existen (historia, aduanas, logística, descargas, login) | Rastreo completo |

## 5. Reglas para seguir investigando
- No enviar formularios ni tocar el login sin OK.
- Mantener las etiquetas [VERIFICADO], [PROBABLE] y [POR COMPROBAR] en cada hallazgo nuevo.
- Cada hallazgo técnico tiene que conectarse con el negocio: leads, confianza, riesgo legal o de seguridad.