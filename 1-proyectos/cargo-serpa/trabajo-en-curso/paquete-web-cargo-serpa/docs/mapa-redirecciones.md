# Mapa de redirecciones 301

Todas son permanentes (301) y no distinguen mayúsculas (`/Delegaciones.aspx` = `/delegaciones.aspx`). Origen: páginas de destino de GA4 y de Search Console. Los enlaces externos que ya existen (55, todos a la home) se conservan con `/index.aspx` → `/es/`.

| Origen | Destino |
|---|---|
| `/index.aspx` | `/es/` |
| `/index` | `/es/` |
| `/index.html` | `/es/` |
| `/contacto.aspx` | `/es/solicitar-presupuesto/` |
| `/contacto` | `/es/solicitar-presupuesto/` |
| `/transporte.aspx` | `/es/transporte-peninsula-canarias/` |
| `/transporte` | `/es/transporte-peninsula-canarias/` |
| `/delegaciones.aspx` | `/es/#delegaciones` |
| `/delegaciones` | `/es/#delegaciones` |
| `/delegaciones/index.aspx` | `/es/#delegaciones` |
| `/servicios-especiales` | `/es/servicios/` |
| `/servicios-especiales.aspx` | `/es/servicios/` |
| `/historia.aspx` | `/es/empresa/` |
| `/descargas.aspx` | `/es/servicios/` |
| `/aduanas.aspx` | `/es/aduanas-dua-canarias/` |
| `/logistica.aspx` | `/es/servicios/` |

## Qué NO se redirige
- `/login.aspx`, `/login` y **todas las rutas del GES**: no tocar hasta tener la respuesta de A&A.
- `/aviso_legal.aspx`, `/cookies.aspx`, `/politica_privacidad.aspx`: mantener hasta que existan las páginas nuevas.
- Cualquier otra URL de la web actual que A&A detecte en un rastreo completo (Screaming Frog): añadirla aquí.

## IIS
`web.config.redirecciones.xml` contiene las reglas para el módulo URL Rewrite. Probar en un entorno de pruebas antes de producción.
