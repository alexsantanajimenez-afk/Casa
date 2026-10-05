# Infraestructura del CRM (verificada el 05/10/2026)

Mismo sistema, varios nombres según la herramienta. **No cambiar nombres ni direcciones** (Alex lo
pidió expresamente): cambiar el proyecto de Vercel cambiaría la dirección que usan los comerciales.

| Pieza | Valor |
|---|---|
| Nombre visible de la app | Cargo Serpa CRM |
| **Dirección de producción** | `https://cargo-serpa-crm.vercel.app` |
| Proyecto de Vercel de producción | `cargo-serpa-crm` (cuenta `alexsantanajimenez-afks-projects`, plan Hobby) |
| Repo | `alexsantanajimenez-afk/envio-wise` (GitHub) |
| Rama de producción | `main` (se configura en Vercel: Settings → Environments → Production → Branch Tracking) |
| Base de datos | Supabase `cargo-serpa-crm`, ref `jjrbtxvspxvvmnfohqbc`, `https://jjrbtxvspxvvmnfohqbc.supabase.co` |
| Gestor de paquetes | npm (`package-lock.json`) |
| Usuarios del CRM | `alexsantana@cargoserpa.es` (admin) y `lidiamarin@cargoserpa.es` (admin). Los comerciales no tienen cuenta |

## Variables de entorno en Vercel (proyecto `cargo-serpa-crm`)

| Variable | Para qué | Tipo |
|---|---|---|
| `VITE_SUPABASE_URL`, `VITE_SUPABASE_PUBLISHABLE_KEY`, `VITE_SUPABASE_PROJECT_ID` | Navegador (se incrustan al compilar) | Secret |
| `SUPABASE_URL`, `SUPABASE_PUBLISHABLE_KEY` | Servidor (login y permisos) | Config |
| `SUPABASE_SERVICE_ROLE_KEY` | Servidor (administración de usuarios) | Sensitive. **Nunca** compartirla en chats ni archivos |

Las variables de servidor se aplican solo a despliegues nuevos. Si se cambian, hay que redesplegar.
El repo ya no lleva `.env`; plantilla en `.env.example`.

## Cosas que NO son producción (no tocar sin decidirlo)

- Proyecto de Vercel **`envio-wise`** (`envio-wise.vercel.app`): apunta al mismo repo, está duplicado y
  no lo usa nadie. Tiene 4 variables de Supabase creadas el 05/10 por error.
- Supabase `qduklechmrmkkurjnzko`: base antigua de Lovable Cloud. No está en la cuenta de Supabase de
  Alex. El código ya no apunta a ella.
- Supabase `Casa` y `Ayni`: otros proyectos de la cuenta, sin relación con el CRM.
- Rama `claude/serene-mayer-uvhfm4`: antigua, de otra sesión.

## Cómo desplegar y deshacer

- Cada push a `main` despliega producción solo. Las ramas crean despliegues de prueba (Preview).
- Deshacer: Vercel → `cargo-serpa-crm` → Deployments → el despliegue anterior → `⋯` → Promote to Production.
- La conexión de Claude con Vercel da 403 en esta cuenta (sin permiso de scope). Para leer o cambiar
  Vercel, Alex lo hace en la web o con la extensión de Claude en Vercel.

## Qué se hizo y por qué (05/10/2026)

El repo venía de Lovable: dependencia `@lovable.dev/vite-tanstack-config` (forzaba Cloudflare como
destino), `bun.lock` apuntando al caché privado de Lovable (403) y `.env` con la base antigua. Se eliminó
todo, se escribió un `vite.config.ts` propio (Nitro detecta Vercel con `VERCEL=1`) y se dejó un solo
lockfile.
