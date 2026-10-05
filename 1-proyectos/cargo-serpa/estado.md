# Estado · Cargo Serpa

Última actualización: 05/10/2026 (volcado del proyecto de Claude + verificación en el repo y Supabase).

## Hecho

- **CRM propio** migrado de Lovable a GitHub (`envio-wise`) + Supabase (`cargo-serpa-crm`) +
  Vercel, con login por email y contraseña. Datos reales en `cargo-serpa-crm` (verificado el
  05/10/2026): clientes_info 7.546, envíos 202.871 (03/01/2023 a 01/09/2026; el CRM muestra
  200.557 porque separa la línea BX) y tráfico 67.779. Las cifras del volcado antiguo (152.378
  envíos 2024-2026 y 95.516 de tráfico) no coinciden: tomar estas.
- **Limpieza de Lovable** en el repo (rama `claude/brave-ritchie-gp7y98`): sin dependencias ni
  restos, build propio para Vercel, `CLAUDE.md` real. Pendiente de llevar a `main` (ver abajo).
- Módulos del CRM: envíos y facturación, comercial (carteras, alertas, resúmenes semanales),
  growth (Pareto, ICP, activación, LTV, churn, cartera fría, funnel AARRR).
- Entregables cerrados: análisis de 18 páginas para dirección, hoja de cartera fría, sistema de
  alertas de fuga con resumen semanal por comercial y para gerencia.
- Otros activos: landing de alta conversión (wireframe vivo), tracker React del plan de 9 meses,
  pitch con modelo de ROI, workflow n8n para el PDF mensual.
- Primera campaña segmentada de inactivos lanzada vía Brevo.
- Email: subdominio `comunicaciones.cargoserpa.es` autenticado en Brevo. Remitente
  `hola@comunicaciones.cargoserpa.es`, Reply-To `alexsantana@cargoserpa.es`. DNS gestionado por
  la empresa externa Loading.
- Matriz de agentes renumerada (29/09). Formato del outbound 1:1 fijado (septiembre 2026).
  Cadencia de LinkedIn: lunes, miércoles y viernes.
- Dos tareas programadas de Claude, lunes a viernes, hora local: **8:30** parte de noticias
  (Agente 9) y **8:45** barrido de señales (Agentes 8 y 6). El aviso llega solo a la app.

## A medias

- Primera campaña de cartera fría (clientes con más de un año sin enviar, foco CO y CM): en lanzamiento.
- Dosier de entregables: añadir página de Equipo comercial (top 3 por comercial, distintivo
  Pareto 80 %) y comparativa 2025 vs 2026 página a página. Corregir mayo 2026 y la página 3
  (+15,8 % real frente al +13,8 % publicado). PDF a paleta clara por la impresión. Para final de mes.
- Auditoría de LinkedIn de Cargo Serpa y plan de publicaciones: abierta. Falta cambiar el estilo
  hacia DSV, Scan Global Logistics y GEODIS (inspirarse sin copiar) y decidir carruseles o fotos.
- Herramienta casera de captación (decidida el 27/09): búsqueda diaria de señales semiautomática;
  los pasos de IA se hacen con la suscripción, sin API de Claude por ahora.
- Lista de CNAE: sigue creciendo (ver `mi-metodo/icp.md`).
- Prospección por segmentos: EPC/ingenierías e instaladoras en Canarias; importación desde Asia
  (sondeo de forwarders de origen, como ASLG en Shenzhen); Baleares (ampliar a las cuatro plazas).
- Documentación en Notion: memoria de trabajo de Alex y material para un futuro caso de estudio,
  no para el cliente.

## Pendiente

- Apollo y LinkedIn a mano (extensión de Chrome, sin créditos). Objetivo: 20 correos 1:1 al día.
- Rehacer el dosier con los datos nuevos (final de mes).
- **Feedback de la gerente sobre el CRM**: no consta si está hecho. Pide que Envíos/Servicios
  describa el envío tipo por servicio (peso y bultos medios, envíos/día por cliente) y, en
  Insights, poder recorrer todos los clientes de cada tarjeta y ordenar "sin envíos" de menos a
  más días. `[POR COMPROBAR]`
- **Informe mensual**: Alex lo saca del CRM y lo pasa él mismo a los comerciales y a gerencia.
  La Edge Function `informe-mensual` no existe (ni en el repo ni en `cargo-serpa-crm`; verificado
  el 05/10) y, con este proceso manual, **no hace falta reconstruirla**. Solo existe la tabla
  `resumenes_mensuales`. Pendiente: confirmar si el workflow de n8n del PDF mensual sigue en uso.
- **Migraciones**: el repo tiene 69 archivos y Supabase tiene migraciones posteriores
  (p. ej. `alertas_cartera_repetida`, 05/10). Comprobar que el repo contiene todas las aplicadas.
- **Leads fuera de las cuatro plazas comerciales**: Alex pasa todos los leads a Lidia (y a
  Mercedes, en los de Baleares); ellas reparten. Con el ámbito "toda España" no cambia el
  proceso. `[POR COMPROBAR]` si Mercedes recibe también otros leads además de los de Baleares.
- **Aplicar el ámbito "toda España"** en las dos tareas programadas (siguen con el texto antiguo).
  Requiere OK de Alex.
- Pasar las dos tareas programadas a leer esta carpeta en vez de llevar el prompt completo.
  Hacerlo en paralelo varios días antes de apagar las actuales.

## Llevar la rama del CRM a `main` (verificado el 05/10/2026)

- Producción es `https://envio-wise.vercel.app` y **ya usa la base buena** `cargo-serpa-crm`
  (`jjrbtxvspxvvmnfohqbc`): lo confirman las peticiones del navegador (Network) y los datos del CRM
  (200.557 envíos = 202.871 en la base − 2.314 de la línea separada BX; último dato 01/09/2026).
- El `.env` del repo (`main` y todas las ramas) solo ha apuntado a `qduklechmrmkkurjnzko` (Lovable
  Cloud). La dirección buena no está en ningún archivo del repo, así que **llega desde Vercel**,
  aunque Alex no ve variables en la lista de *Settings → Environment Variables*.
  `[POR COMPROBAR]` dónde están exactamente (el conector de Vercel da 403 en esa cuenta).
- Por tanto, quitar el `.env` del repo no debería afectar a producción. Prueba segura antes de
  fusionar: abrir el *Preview Deployment* de la rama `claude/brave-ritchie-gp7y98` en Vercel e
  iniciar sesión. Si carga datos, se puede fusionar.
- Quitar cualquier `NITRO_PRESET` que apunte a Cloudflare, si existe.
