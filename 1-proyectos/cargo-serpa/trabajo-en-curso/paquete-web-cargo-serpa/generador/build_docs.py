import json,os,re,sys
sys.path.insert(0,'.')
os.makedirs('docs',exist_ok=True)
exec(open('build_pkg.py',encoding='utf-8').read().split('# ---------- imágenes ----------')[0].split("# ---------- páginas ----------")[1].replace("KEYS=","KEYS=") ) if False else None
import importlib.util
# reutiliza la lista de páginas del generador
src=open('build_pkg.py',encoding='utf-8').read()
a=src.index('P=['); b=src.index('KEYS=')
ns={}; exec(src[a:b],ns); P=ns['P']
BASE='https://www.cargoserpa.es'
def u(slug,lang): return f'/{lang}/'+(slug+'/' if slug else '')

readme='''# Paquete web Cargo Serpa · versión para A&A Informática

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
'''
open('docs/README.md','w',encoding='utf-8').write(readme)

q='''# Preguntas para A&A Informática (contestar antes de publicar)

## El GES y el acceso de trabajadores y clientes
1. ¿El GES comparte código con la web actual o es una aplicación independiente que simplemente cuelga de ella?
2. ¿Qué direcciones usa? (`/login.aspx` y cuáles más: listar todas).
3. ¿Entran también clientes? **Sí** (dato de Cargo Serpa). ¿Hay una "oficina virtual" distinta del acceso de trabajadores?
4. ¿Puede el GES quedarse donde está mientras la web nueva se publica en la raíz, o conviene moverlo a un subdominio (por ejemplo `gestion.cargoserpa.es`)?
5. ¿Cómo se hace la migración sin que nadie se quede sin acceso un solo día?
6. ¿Se puede excluir el GES del código de analítica de la web comercial? (así las visitas de trabajadores y clientes no ensucian los datos de captación).

## Servidor y despliegue
7. ¿Pueden publicar archivos estáticos en el servidor actual (IIS), o hace falta otro hosting? ¿Qué sistema operativo y qué parches tiene el servidor? (IIS 8.5 / Windows Server 2012 R2 sin soporte desde 10/10/2023).
8. ¿Se puede activar HTTPS en todo, redirección a una sola versión (con o sin www) y quitar las cabeceras de versión (`Server`, `X-AspNet-Version`, `X-Powered-By`)?
9. ¿Cómo llega hoy el formulario de contacto al correo y puede el endpoint nuevo hacer lo mismo?
10. ¿Qué dominio canónico prefieren, con www o sin?

## Medición y búsqueda
11. ¿Quién es el propietario de la cuenta de GA4 (propiedad 366267754)? Cargo Serpa necesita rol de editor o administrador.
12. ¿Tienen acceso a Search Console? La propiedad `https://www.cargoserpa.es/` tiene datos; la de dominio no está verificada.
13. ¿Pueden instalar Google Tag Manager y activar Consent Mode v2?

## Dominio y DNS (Loading)
14. Verificar la propiedad de dominio `cargoserpa.es` en Search Console con un registro TXT. Lo gestiona Loading.
15. Alta del dominio en Bing Webmaster Tools y envío del `sitemap.xml`.
'''
open('docs/preguntas-para-AyA.md','w',encoding='utf-8').write(q)

# redirecciones
R=[('/index.aspx','/es/'),('/index','/es/'),('/index.html','/es/'),('/contacto.aspx','/es/solicitar-presupuesto/'),('/contacto','/es/solicitar-presupuesto/'),
('/transporte.aspx','/es/transporte-peninsula-canarias/'),('/transporte','/es/transporte-peninsula-canarias/'),
('/delegaciones.aspx','/es/#delegaciones'),('/delegaciones','/es/#delegaciones'),('/delegaciones/index.aspx','/es/#delegaciones'),
('/servicios-especiales','/es/servicios/'),('/servicios-especiales.aspx','/es/servicios/'),
('/historia.aspx','/es/empresa/'),('/descargas.aspx','/es/servicios/'),('/aduanas.aspx','/es/aduanas-dua-canarias/'),('/logistica.aspx','/es/servicios/')]
md='''# Mapa de redirecciones 301

Todas son permanentes (301) y no distinguen mayúsculas (`/Delegaciones.aspx` = `/delegaciones.aspx`). Origen: páginas de destino de GA4 y de Search Console. Los enlaces externos que ya existen (55, todos a la home) se conservan con `/index.aspx` → `/es/`.

| Origen | Destino |
|---|---|
'''+''.join(f'| `{a}` | `{b}` |\n' for a,b in R)+'''
## Qué NO se redirige
- `/login.aspx`, `/login` y **todas las rutas del GES**: no tocar hasta tener la respuesta de A&A.
- `/aviso_legal.aspx`, `/cookies.aspx`, `/politica_privacidad.aspx`: mantener hasta que existan las páginas nuevas.
- Cualquier otra URL de la web actual que A&A detecte en un rastreo completo (Screaming Frog): añadirla aquí.

## IIS
`web.config.redirecciones.xml` contiene las reglas para el módulo URL Rewrite. Probar en un entorno de pruebas antes de producción.
'''
open('docs/mapa-redirecciones.md','w',encoding='utf-8').write(md)
rules=''.join(f'    <rule name="r{i}" stopProcessing="true"><match url="^{re.escape(a.lstrip("/"))}$" ignoreCase="true" /><action type="Redirect" url="{b}" redirectType="Permanent" appendQueryString="false" /></rule>\n' for i,(a,b) in enumerate(R,1))
open('docs/web.config.redirecciones.xml','w',encoding='utf-8').write('<?xml version="1.0" encoding="UTF-8"?>\n<!-- Probar antes de producción. Requiere el módulo URL Rewrite de IIS. No redirigir /login ni las rutas del GES. -->\n<configuration>\n  <system.webServer>\n    <rewrite>\n      <rules>\n'+rules+'      </rules>\n    </rewrite>\n  </system.webServer>\n</configuration>\n')

gtm='''# Medición con GTM y GA4

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
'''
open('docs/medicion-ga4-gtm.md','w',encoding='utf-8').write(gtm)

seo='# SEO por página (title ≤ 60 caracteres, description ≤ 155)\n\n'
for p in P:
    seo+=f'## {p[0]}\n- **ES** `{u(p[1],"es")}`\n  - Title: {p[4]}\n  - Description: {p[6]}\n- **EN** `{u(p[2],"en")}`\n  - Title: {p[5]}\n  - Description: {p[7]}\n\n'
seo+='## Búsquedas reales que cada página debe cubrir (Search Console, 15/07 a 06/10/2026)\n- Península–Canarias: "transporte a canarias" (264 impr.), "transporte peninsula canarias" (240), "transportes peninsula canarias" (225), "transporte canarias peninsula" (210), "transporte de peninsula a canarias" (208).\n- Marítimo: "transporte maritimo peninsula canarias" (204, pos. 10,2).\n- Islas: "empresas de transporte en canarias" (451), "empresas logistica tenerife" (312), "logistica tenerife" (283), "transportista tenerife" (269), "transporte mercancias el hierro" (221).\n- Aduanas: consultas sobre DUA y agente de aduanas (y tráfico de ChatGPT a servicios especiales).\n'
open('docs/seo-por-pagina.md','w',encoding='utf-8').write(seo)

tbc=json.load(open('tbc.json',encoding='utf-8'))
t='# Textos marcados "por confirmar" (versión en español)\n\nNo se publican sin validar. Cada fila: página, dato a confirmar.\n\n| Página | Dato por confirmar |\n|---|---|\n'
seen=set()
for k,v in tbc.items():
    if not k.startswith('es/'): continue
    for x in v:
        if (k,x) in seen: continue
        seen.add((k,x)); t+=f'| `/es/…` {k.split("/")[1]} | {x} |\n'
open('docs/pendientes-por-confirmar.md','w',encoding='utf-8').write(t)

d='''# Delegaciones a validar (tabla única)

Fuente: maqueta V5 (datos de la presentación 2025 y de la web actual). **Sin validar**: la auditoría del 25/09 detectó que home y contacto no coinciden y que los mapas apuntan a sitios equivocados. Cargo Serpa debe rellenar y validar esta tabla antes de publicar; después se usa en la web, en Google Business y en los directorios.

| Delegación | Dirección (maqueta) | Teléfono (maqueta) | Email | Enlace ficha Google Business | Validado |
|---|---|---|---|---|---|
| Madrid (sede central) | Calle Echo, Centro de Carga Aérea, Parcela 2-4, Nave 4, 28042 Madrid | +34 913 290 318 | info@ · traficomad@ · pricing@ · comercial@ · facturacionmad@ | | |
| Barcelona | Centro de Carga Aérea, C/ Estel Polar, 1, Nave C, 08820 El Prat de Llobregat | +34 934 795 249 | barcelona@ | | |
| Mallorca | C/ Gerrers, vial 2, Nave 36G, 07141 Marratxí | +34 687 504 313 | por confirmar | | |
| Las Palmas | C/ Santiago Betancor Brito, 6, Pol. Ind. El Goro, 35219 Telde | +34 928 700 984 (la web de contacto decía 928 688 074) | traficolpa@ | | |
| Tenerife | Subida Principal al Mayorazgo, 5, Pol. Ind. El Mayorazgo, 38110 Santa Cruz de Tenerife (confirmado por Alex) | +34 922 663 218 | por confirmar | | |
| Lanzarote | C/ Malpaís de San José, nave 8, 35500 Arrecife (la web de contacto decía "Hnos. Aguilar Sánchez, nave 8") | +34 600 987 910 | por confirmar | | |
| Fuerteventura | C/ Belillo, 9, 35600 Puerto del Rosario (la web de contacto decía "El Belillo, Pol. Ind. El Matorral") | +34 928 700 984 (igual que Las Palmas: sospechoso; la home decía 928 543 377) | por confirmar | | |

Mapas: sustituir los iframes por el embed de la ficha propia de cada delegación (hoy Lanzarote apunta a "Redur" y Fuerteventura a "DHL").
'''
open('docs/delegaciones-a-validar.md','w',encoding='utf-8').write(d)

ck='''# Checklist de publicación

## Antes
- [ ] Tabla de delegaciones validada (`delegaciones-a-validar.md`).
- [ ] Textos "por confirmar" resueltos o retirados.
- [ ] Respuestas a `preguntas-para-AyA.md`, sobre todo el GES.
- [ ] Páginas legales listas (aviso legal, privacidad, cookies) con texto actualizado (ya no existe el "fichero inscrito ante la AEPD").
- [ ] Endpoint `/api/solicitud` implementado y probado con el OK de Cargo Serpa.
- [ ] GTM instalado, Consent Mode v2 probado, eventos verificados con Tag Assistant.
- [ ] Redirecciones probadas (`mapa-redirecciones.md`), sin tocar `/login` ni el GES.
- [ ] Dominio canónico decidido (www o sin www) y HTTPS en todo.

## El día
- [ ] Subir `web/` a la raíz y activar las redirecciones.
- [ ] Comprobar `sitemap.xml` y `robots.txt` en la raíz.
- [ ] Enviar el sitemap a Search Console y a Bing Webmaster Tools.
- [ ] Probar en móvil y ordenador, español e inglés.
- [ ] Comprobar que el GES y la oficina virtual funcionan.

## Después (primeras 2 semanas)
- [ ] Search Console → Páginas: las URLs nuevas se indexan; las viejas desaparecen.
- [ ] GA4: `generate_lead` y `click_phone` llegan como eventos clave.
- [ ] Core Web Vitals en móvil (Lighthouse / PageSpeed).
- [ ] Corregir fichas de Google Business y directorios con la tabla de delegaciones.
- [ ] Repetir la prueba de visibilidad en IAs (15 preguntas) y compararla con la base del 06/10/2026 (9 de 46).
'''
open('docs/checklist-publicacion.md','w',encoding='utf-8').write(ck)
print(os.listdir('docs'))
