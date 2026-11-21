# VRTCL

Marca propia de Alex Santana y Carlos Cedres (dos autónomos, corresponsables). Servicio de
**Growth + Go To Market**: proyecto cerrado de 16 semanas que empieza con una auditoría de 2 semanas.
Cuatro piezas: estrategia de growth, CRM con su dashboard, base de conocimiento en Notion y 10 agentes de IA,
todo a nombre del cliente. Clientes: pymes B2B de 10–250 personas y startups con ronda. Sin fractional ni cobro
por resultado. Eslogan: "Human judgment. AI execution."
Cómo se instala en un cliente: `manual/VRTCL-manual-instalacion.pdf` (fuente en `manual/manual-fuente.html`).
Lee `estado.md` antes de empezar.

## Reglas

- **No ejecutar sin OK de Alex**: nada de publicar, desplegar, enviar, gastar créditos ni crear
  HTML/apps/código sin su "ejecuta". Alex suele ir dando cambios y decir "ejecuta" al final.
- Web en blanco y negro puro, con amarillo `#FFC700` solo en subrayados y el punto del titular.
  Logo: el SVG de Alex (no redibujarlo).
- Textos en español; solo el eslogan y "Service as a Software" van en inglés.
- No inventar cifras ni clientes. Los logos de la web son **empresas donde ha trabajado el equipo**
  (Carlos en todas), no clientes de VRTCL: no presentarlos como clientes.
- DNI y contraseñas no se apuntan en estas notas. Los DNI solo aparecen en las páginas legales
  publicadas (lo exige la LSSI).

## Dónde está cada cosa

- **Web publicada**: https://vrtcl.tech (Netlify, proyecto `vrtcl`). Copia de lo desplegado en
  `web/` (`public/` es la web; `netlify/functions/contacto.mts` es el formulario).
  Para publicar: herramienta de despliegue de Netlify sobre la carpeta `web/`.
- **Dominio y correo**: DonDominio (plan Mini). Correo `hello@vrtcl.tech`; SMTP
  `smtp.dondominio.com:587` (TLS).
- **Formulario**: web → función `/api/contacto` → Supabase, tabla `vrtcl_contactos`
  (de momento en el proyecto **Casa**, Irlanda) + aviso por email a hello@vrtcl.tech.
  Variables en Netlify: `SUPABASE_URL`, `SUPABASE_KEY`, `SMTP_PASS`.
- **Vista previa** (artifact): https://claude.ai/artifact/FGoGpyQCAsb1wQHn3h24aW
