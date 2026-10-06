# Paquete web Cargo Serpa · versión para A&A Informática

Web pública nueva, estática (HTML, CSS y JavaScript sin dependencias), en español e inglés. Sustituye a la web actual (ASP.NET en IIS). **No incluye el GES**: ver `preguntas-para-AyA.md`.

## Qué contiene
- `web/` el sitio listo para subir: 11 páginas en `/es/` y 11 en `/en/`, con URLs limpias (`/es/transporte-peninsula-canarias/`), `sitemap.xml` con hreflang, `robots.txt`, canonical, title y description únicos por página, un solo H1 por página, datos estructurados (Organization en todas; FAQPage en preguntas frecuentes) y Consent Mode v2 con todo denegado por defecto.
- `docs/` instrucciones y decisiones pendientes:
  - `preguntas-para-AyA.md`: lo que hay que contestar antes de publicar (GES, formulario, hosting, DNS).
  - `mapa-redirecciones.md` y `web.config.redirecciones.xml`: 301 de las URLs viejas a las nuevas.
  - `medicion-ga4-gtm.md`: eventos, parámetros y conversiones.
  - `seo-por-pagina.md`: title y description de cada página.
  - `pendientes-por-confirmar.md`: todos los textos marcados "por confirmar" que no se pueden publicar sin validar.
  - `delegaciones-a-validar.md`: tabla única de delegaciones (hay discrepancias entre home y contacto).
  - `checklist-publicacion.md`.

## Cómo se prueba en local
Cualquier servidor estático vale (por ejemplo `python -m http.server` dentro de `web/`). Las rutas son absolutas (`/es/...`, `/assets/...`): el sitio debe servirse desde la raíz del dominio.

## Lo que NO está hecho (TODO A&A)
1. **Formulario:** envía un POST JSON a `/api/solicitud`. Hay que implementar ese endpoint (correo a pricing@ y comercial@, antispam; campo trampa `website` ya incluido).
2. **GTM:** pegar el snippet del contenedor en el `<head>` (hay un comentario TODO). GA4 (`G-C2TWFJZ8Q1`) se configura dentro de GTM.
3. **Gestor de cookies:** hay un banner básico con Consent Mode v2. Sustituir por un CMP (Cookiebot, CookieYes, Iubenda) si se prefiere, y actualizar el texto legal.
4. **Páginas legales:** aviso legal, política de privacidad y de cookies. Los enlaces del pie apuntan a `#`: mantener las páginas actuales o crear las nuevas, con el texto legal revisado.
5. **WhatsApp:** poner el número real en `assets/js/site.js` (`WA_NUMBER`).
6. **Seguimiento de envíos:** poner la URL real en el atributo `data-tracking-url` del formulario de la portada.
7. **Dominio canónico:** el paquete usa `https://www.cargoserpa.es`. Si se elige sin www, cambiar `BASE` en el generador o buscar y reemplazar en `web/`.
8. **Imagen de portada:** es provisional (la de la presentación 2025).
9. **Textos "por confirmar":** se ven en la web marcados en color. No publicar hasta resolverlos, o quitar la marca y el dato.
10. **Accesibilidad:** revisar con axe/WAVE; el paquete ya trae `lang`, un H1 por página y enlaces reales, pero faltan textos alternativos si se añaden imágenes.

## Importante: el GES
Si el GES comparte código o direcciones con la web actual, **no sustituir la raíz sin acordarlo antes**. No redirigir `/login.aspx` ni las rutas del GES.
