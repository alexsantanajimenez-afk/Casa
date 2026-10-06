# Estado · Cargo Serpa

Última actualización: 06/10/2026 (CRM y gerencia cerrados). Anterior: 05/10/2026 (volcado del proyecto de Claude + verificación en el repo y Supabase).

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
- **Tres tareas programadas de Claude**, lunes a viernes (horas reales verificadas el 05/10/2026):
  06:52 Canarias (07:52 Madrid) **rutina diaria de leads**; 07:00 UTC (08:00 Canarias) **parte de noticias**
  (Agente 9); 08:45 Canarias **barrido de señales** (Agentes 8 y 6). Detalle en `agentes-rutinarios/`.
- Barrido de señales y rutina diaria de leads actualizados el 05/10/2026 con OK de Alex: toda España y exclusiones completas.

## A medias

- Campañas de reactivación en Brevo **ya enviadas** (11 campañas, 249 envíos, 28/09 al 02/10).
  Primer cruce con Notion hecho el 06/10: 12 respuestas identificadas y 28 rebotes duros (11 %).
  Detalle y hallazgos en `trabajo-en-curso/auditoria-brevo-2026-10-06.md`.
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

- **Apollo de pago** (2.660 créditos, ciclo 06/10 a 06/11). Objetivo: hasta 50 correos 1:1 al día
  con contactos verificados de Apollo. Estándar en `mi-metodo/estandar-operativo.md`.
  **06/10/2026**: 40 contactos ICP (uno por empresa, email verificado) y 2 de señales, cargados en Notion con
  `Campaña = Outlook 1:1` y `Origen = B`, sin señal de Canarias verificada (Veredicto "Falta información").
  Créditos Apollo gastados ese día: ver saldo en Apollo (2.660 por ciclo, ciclo 06/10 a 06/11).
  Stryker pasa a cliente (ver `mi-metodo/exclusiones.md`); su representante es Sergio Jiménez.
  **Primera respuesta del lote (06/10)**: Enerland (Estefanía Oyarzabal). Su necesidad actual es Latam, con proyectos
  puntuales en Canarias; añade a Julián Vila de Luis. Alex contestó el mismo día ofreciendo un dossier. Julián tiene ficha propia
  (julian.vila@enerlandgroup.com). Pendiente: pasar el lead a Lidia (aviso al equipo internacional) y preparar el dossier si lo piden.
- **Brevo**: bajar los rebotes (11 % frente al 2 % recomendable), cambiar el remitente a
  `hola@comunicaciones...`, excluir particulares y renombrar campañas (ver estándar). Aprobado el 06/10; falta aplicarlo en las próximas campañas.
- **Notion**: campo "Campaña" creado el 06/10; falta rellenarlo en las respuestas ya registradas y rellenar `Origen` en las ~89 fichas que no lo tienen.
  Dielca y J2O constan "Sin contactar" pero estaban en el envío del 01/10.
- **Segunda respuesta del lote (06/10)**: HIMESA (Marçal Vidal). No tiene necesidades recurrentes, pero pide cotizar mover un
  semirremolque vacío con tractora y chófer de Geel (Bélgica) a Schemmerhofen (Alemania). Pregunta si hay corresponsales.
  Pendiente: confirmar con el equipo internacional si se puede hacer y contestarle; aviso a Lidia con la plantilla.
- **Tercera respuesta del lote (06/10)**: Laboratorios Indas (Federico Pérez). Pone en copia a Cipriano Martín Martín (Jefe de
  Logística) para que valore la propuesta. Pendiente: copiar el email de Cipriano del hilo, contestar, aviso a Lidia y dossier.
- **Dossier de servicios y frecuencias** (06/10/2026): ya lo tiene hecho el equipo comercial (dato de Alex). No hay que prepararlo;
  el correo 1:1 lo ofrece y el comercial lo presenta cuando el prospecto responde. Enerland e Indas ya lo han recibido como oferta.
- **Avisos y respuestas (06/10, tarde)**: Alex ya envió los avisos a Lidia y contestó a HIMESA. Falta contestar a Indas (Federico
  Pérez, con Cipriano en copia); Alex lo hace el mismo día.
- **Envío del lote 1:1 (06/10/2026)**: Alex confirma que están enviados todos los correos de la lista (los 45 que se redactaron,
  más los de Enerland, Arkal, HIMESA e Indas ya registrados). Notion marcado como `Contactado` con fecha 06/10.
  Cruce de respuestas Brevo/1:1 a los 3 días (09/10) y a los 7 (13/10).
- **Rutina diaria de leads**: hoy prioriza Clay y usa Apollo solo de respaldo (máx. 10 al día).
  Con Apollo de pago hay que invertir el orden. Pendiente de OK; no se ha cambiado la tarea programada.
- Rehacer el dosier con los datos nuevos (final de mes).
- **Informe mensual**: Alex lo saca del CRM y lo pasa él mismo a los comerciales y a gerencia.
  La Edge Function `informe-mensual` no existe (ni en el repo ni en `cargo-serpa-crm`; verificado
  el 05/10) y, con este proceso manual, **no hace falta reconstruirla**. Solo existe la tabla
  `resumenes_mensuales`. Pendiente: confirmar si el workflow de n8n del PDF mensual sigue en uso.
- **Migraciones**: el repo tiene 69 archivos y Supabase tiene migraciones posteriores
  (p. ej. `alertas_cartera_repetida`, 05/10). Comprobar que el repo contiene todas las aplicadas.
- **Leads fuera de las cuatro plazas comerciales**: Alex pasa todos los leads a Lidia (y a
  Mercedes, en los de Baleares); ellas reparten. Con el ámbito "toda España" no cambia el
  proceso. `[POR COMPROBAR]` si Mercedes recibe también otros leads además de los de Baleares.
- Unificar exclusiones y formato de mensaje entre la rutina diaria de leads y el outbound (ver `agentes-rutinarios/rutina-diaria-leads.md`).
- **Clay**: los créditos que caducaban el 17/10 ya están gastados. Los gratis se activan el 16/10/2026
  y solo se usan para lo que Apollo no encuentre. La rutina de leads pasa de 10 a 20 leads/día el 08/10:
  decidir si se mantiene con Apollo.
- Pendiente menor: borrar la rama antigua `claude/serene-mayer-uvhfm4` de `envio-wise` (verificado el
  06/10: 0 commits por delante de `main`, no tiene nada único). Alex puede hacerlo en GitHub o dar permiso de escritura.
- Living Las Canteras: aplazado (solo es una propuesta; Alex lo retoma cuando quiera).
- CRM y feedback de gerencia: **cerrado**. Alex confirma (06/10/2026) que el CRM y gerencia están OK; el feedback anterior de la gerente ya no está pendiente.
- Pasar las dos tareas programadas a leer esta carpeta en vez de llevar el prompt completo.
  Hacerlo en paralelo varios días antes de apagar las actuales.

## Infraestructura del CRM: resuelta el 05/10/2026

- La rama de limpieza de Lovable se fusionó a `main` y producción funciona según Alex ("ahora sí", 05/10/2026; antes se comprobó login, 200.557 envíos y
  gestión de usuarios). Detalle y tabla en `sobre-el-proyecto/infraestructura.md`.
- Proyecto de Vercel `envio-wise` (duplicado) borrado por Alex el 05/10/2026.
- Rama antigua `claude/serene-mayer-uvhfm4`: ver Pendiente (borrar; Alex lo autorizó el 06/10).
