# Estado · VRTCL

Última actualización: 21/11/2026.

## Hoy, 21/11/2026

- **Manual de instalación v2** en `manual/` (PDF de 18 páginas + fuente HTML): qué instalamos en un cliente y cómo,
  paso a paso (pasos 1 a 22, semanas 1 a 16), para alguien nuevo en el equipo. Sin nombres de socios ni de clientes.
  Stack y cuentas en un solo capítulo, Notion obligatorio, base de conocimiento (12 documentos), CRM con su dashboard,
  los 10 agentes con los nombres de la web, legal, métricas y anexos de plantillas y pendientes.
- **Web actualizada**: las cuatro piezas son Estrategia de growth · CRM con su dashboard · Base de conocimiento ·
  Diez agentes de IA. "Panel" pasa a "dashboard" en toda la web. Descripción para buscadores y redes actualizada.
- **No se hizo** la migración a la cuenta de Supabase de VRTCL prevista para hoy: sigue pendiente.

## Dónde estamos

- **Web publicada en https://vrtcl.tech** (Netlify, proyecto `vrtcl`), con HTTPS. `www` redirige a `vrtcl.tech`.
  Fuente de lo desplegado en `web/`.
- **Contenido**: portada "Crece con criterio. Escala con IA." · Por qué ahora · Cuatro piezas (estrategia, CRM con su
  dashboard, base de conocimiento, diez agentes) · Service as a Software · Diez agentes (dashboard animado) ·
  **Con quién hemos trabajado** ("Lo que te proponemos, ya funciona.",
  12 logos en negro con el nombre debajo y vuelta en cascada al entrar) · 16 semanas · Dos semanas, un plan ·
  Contacto · pie con enlaces legales y botón "Desactivar movimiento".
- **Logos** (orden): Chekin, Brandtrack, RAIGHT.ai, Softonic, Huming, Symvaro GmbH, nodd3r, Hiberus, Shakers,
  ezpays, Blash Design, Waterloo. Softonic = piezas verde/azul; Symvaro = "S" en círculo.
- **Formulario**: guarda en Supabase (proyecto **Casa**, tabla `vrtcl_contactos`, solo inserción pública) a través
  de la función `/api/contacto`, y avisa por email a **hello@vrtcl.tech** (probado el 20/11). Netlify Forms
  desactivado; el mensaje del 19/11 12:51 sigue en Netlify → Forms.
- **Legal publicado**: `/aviso-legal/`, `/privacidad/`, `/cookies/`, `/seguridad/` (titulares: Alexandre Santana y
  Carlos Cedres, autónomos corresponsables; domicilio en Telde). Conservación de contactos: 12 meses sin relación.
  Pendiente de revisión por abogado.
- **Cookies/analítica**: banner Aceptar/Rechazar/Configurar con modo de consentimiento de Google ya programado;
  **no se muestra hasta poner el ID de GA4**.
- **Rendimiento**: página 110 KB, foto 82 KB, fuentes servidas desde vrtcl.tech, sin saltos de carga.

## Pendiente (por orden)

1. **Cuenta de Supabase propia de VRTCL** (alta con hello@vrtcl.tech, proyecto `vrtcl-web` en Frankfurt) y migrar
   el formulario; cambiar en la privacidad "Irlanda" por "Alemania (Fráncfort)"; borrar `vrtcl_contactos` de Casa.
2. **Seguridad del proyecto Supabase Casa**: la tabla `casa` y 18 funciones `ob_*` (login, registro, reservas…)
   están abiertas a cualquiera con la clave pública. Alex tiene que decir qué son antes de cerrarlas.
3. **ID de GA4** (`G-...`) para activar analítica y banner.
4. **Reenvío de hello@vrtcl.tech a Gmail** y "Enviar como" (Alex con la extensión de Chrome; prompts dados en el chat).
5. **Prospección** en los dos segmentos (pymes B2B de 10–250 personas sin manos para crecer, y startups con ronda).
   Primera lista del 20/11 en decisiones `[POR COMPROBAR vigencia y decisor]`. Prompts de búsqueda dados en el chat.
6. **Pendientes del manual**: precio de auditoría y proyecto; si se ofrece la variante sobre HubSpot o Pipedrive;
   repositorio plantilla de VRTCL (CRM, dashboard y 10 agentes); plan de Apollo; modelo de contrato de encargado
   revisado por abogado.
7. Foto real para sustituir la fachada generada; caso con cifras; quiénes somos en la web.
8. Firmar el acuerdo de corresponsables (borrador entregado a Alex el 20/11, no está en el repo porque lleva DNI).

## Herramientas

- **Apollo conectado aquí está en plan gratuito**: no deja buscar empresas, personas ni usar su asistente por API
  (probado 20/11, 0 créditos gastados). Búsquedas a mano en la web de Apollo o en Google.
- Netlify y Supabase por conector. La clave de Supabase está en Netlify como variable normal (el plan gratuito no
  deja marcarla como secreta).
