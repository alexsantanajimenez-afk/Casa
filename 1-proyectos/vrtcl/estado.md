# Estado · VRTCL

Última actualización: 20/11/2026.

## Dónde estamos

- **Web publicada en https://vrtcl.tech** (Netlify, proyecto `vrtcl`), con HTTPS. `www` redirige a `vrtcl.tech`.
  Fuente de lo desplegado en `web/`.
- **Contenido**: portada "Crece con criterio. Escala con IA." · Por qué ahora · Cuatro piezas · Service as a
  Software · Diez agentes (panel animado) · **Con quién hemos trabajado** ("Lo que te proponemos, ya funciona.",
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
5. **Prospección**: primera lista hecha a mano el 20/11 (ver decisiones). Prioridad alta: Unobravo (busca
   "Fractional Growth Manager" 6 meses), Amenitiz, Nuitée, Wilco, Trialing `[POR COMPROBAR vigencia y decisor]`.
6. **Modelo fractional**: precio, duración mínima, dedicación y si convive con el proyecto de 16 semanas `[POR DECIDIR]`.
7. Foto real para sustituir la fachada generada; caso con cifras; quiénes somos (Alex y Carlos) en la web.
8. Firmar el acuerdo de corresponsables (borrador entregado a Alex el 20/11, no está en el repo porque lleva DNI).

## Herramientas

- **Apollo conectado aquí está en plan gratuito**: no deja buscar empresas, personas ni usar su asistente por API
  (probado 20/11, 0 créditos gastados). Búsquedas a mano en la web de Apollo o en Google.
- Netlify y Supabase por conector. La clave de Supabase está en Netlify como variable normal (el plan gratuito no
  deja marcarla como secreta).
