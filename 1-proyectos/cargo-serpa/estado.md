# Estado · Cargo Serpa

Última actualización: 06/10/2026 (CRM y gerencia cerrados). Anterior: 05/10/2026 (volcado del proyecto de Claude + verificación en el repo y Supabase).
Última actualización: 07/10/2026 (cierre del miércoles: outbound, búsquedas nuevas y noticia de LinkedIn).

## Hoy, 07/10/2026

- **Enviados por Alex hoy: 59 correos 1:1 en formato B**: 8 de la rutina diaria, 20 de la tanda 1
  (exportadores e internacional), 10 de la tanda 2, 8 de la tanda 3 (importación desde Alemania), 10 de la
  tanda 4, Rafael Parque (Neum) y los dos sustitutos de rebotes (Juan Humanes, EM&E; Clara Collada, Frutos
  Secos Medina). Alex confirma que no queda ninguno de hoy por enviar.
- **Pendiente de Notion (el conector falló dos veces, 07/10):** crear las fichas de Juan Humanes
  ("Contactado", juan.humanes@eme-es.com, dominio catch-all) y de Clara Collada.
- **Tercer rebote, Clara Collada (Frutos Secos Medina):** `ccollada@eguiafoodfactory.com` no se entregó
  ("No se pudo entregar a estos destinatarios"). El dominio eguiafoodfactory.com queda refutado y Apollo
  volvió a dar por verificado un email inválido. María De Alonso (Supply Chain Manager) sigue sin email.
  Dominio real de Frutos Secos Medina `[POR COMPROBAR]`. Ficha prevista: "Cerrado sin éxito", acción "Verificar datos".
- **Respuestas (5) y rebotes (3)**:
  - **Vincent Brauns (Emica Bombas):** ya trabajan con muchos transitarios y están muy cubiertos. Pone en
    copia a Inma González (logística, inma.gonzalez@emicabombas.com), que contactará si hay interés.
    Notion: "Respondió", "Nurturing", acción A4. Alex contestó agradeciendo, sin insistir.
  - **Astrid Monforte (Neumastock):** no es la persona indicada y deriva a **Lidia Gómez**
    (Lgomez@neumastock.es). Ficha nueva: correo enviado por Alex el 07/10 en el hilo de Astrid (con ella en copia), "Contactado". No es Lidia Marín, la comercial de Cargo Serpa.
  - **William Van Vianen (RC Microelectrónica):** respuesta automática, de baja por paternidad, sin
    reenvío; da compras@rcmicro.es (buzón genérico, no usado). Notion: acción "Identificar contacto". En
    Apollo solo constan otro "Manager" (Alfonso) y dos Product Manager; nadie de logística o compras.
  - **Néstor Llansol (Laboratorios Neum, se fue el 08/05/26) y Dilan Gómez (Distrivet):** ya no están.
    "Descartado" en Notion.
  - **Rebotes:** Julian Nuñez (Frutos Secos Medina, el dominio rechaza la dirección) y, el 05/10,
    Luis Lorenzo (EM&E). "Descartado" en Notion.
- **Regla sobre Lidia Marín (decisión de Alex, 07/10):** no se le pasa ningún lead hasta que conteste un
  lead de verdad (interés real). Los nurturing, derivaciones y bajas se quedan en Notion.
- **Calidad de los datos de Apollo**: da por "verificado" el email aunque la persona se haya ido, la
  dirección no exista o sea un buzón de departamento (`logistica@`, `compras@`, `export@`). La fecha de
  refresco no sirve de filtro (Dilan figuraba refrescado el 23/09). Antes de enviar: comprobar el cargo en
  LinkedIn (enlace en la ficha) y que el dominio del email coincida con el de la empresa. La tanda de
  importación desde Alemania salió peor que la de exportadores: el origen de las compras no consta en
  ninguna base y los concesionarios de marcas alemanas compran el recambio al almacén de la marca en España.
- **Descartes por CRM o Notion**: Tecnove, Fresenius Kabi, Würth MODYF, Cultek, Helios Electromedicina,
  Mateco España (ya con 3 contactos en "Respondió") y Cohimar Hidráulica Neumática.
- **Distrivet:** resuelto por Alex el 07/10 (cómo, no consta). La empresa remitía al buzón genérico
  `departamento_transporte@distrivet.es`; Dilan Gómez sigue "Descartado" en Notion.
- **Créditos de Apollo hoy**: 55 gastados en estas búsquedas (22 + 10 + 10 + 10 + 3) más 8 de la rutina de la
  mañana = 63 enriquecimientos, por encima del tope de 40 que nos habíamos puesto (Alex pidió seguir).
  Saldo estimado: unos 2.515 (calculado, no releído de Apollo). Clay sin usar (caducan el 17/10/2026).
- **LinkedIn, miércoles 07/10: post PUBLICADO** (termosellado y embalaje de maquinaria, material de Lidia).
  La máquina de la foto es una carretilla elevadora eléctrica que Alex describe como "a ser exportada"
  (antes dijo que iba a Canarias: destino exacto `[POR COMPROBAR]`); se termosella en plástico y se asegura
  con correas de amarre (confirmado por Alex), y se mueve a todos los destinos. Gancho "No, no es un
  fantasma", con corte "…antes de salir…". La versión exacta publicada no consta aquí. Imagen: sin la
  banda de los tres bloques y sin el rótulo ajeno "WC Móvil". Pendiente para próximas piezas: el logo de
  Cargo Serpa, el subtítulo de la imagen ("con los más altos estándares de seguridad y calidad"), el pilar
  "maquinaria" (qué equipos y vehículos tienen) y si se publica desde la página o el perfil. Siguiente post:
  viernes 09/10 (cierre de semana).
- Decisiones del día en `decisiones.md` (formato B para internacional, aduana operativa, descartes por regla).

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
  pitch con modelo de ROI.
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
- **Rutina diaria de leads**: pasada a Apollo como herramienta principal el 06/10/2026 (con OK de Alex). Clay solo para los contactos sin email
  y cuando haya créditos (gratis desde el 16/10). Primera ejecución con Apollo: 07/10 a las 07:52 (Madrid); revisar el resultado.
- **Lote de internacionales (06/10/2026, tarde)**: Alex pidió 15+ contactos de perfil exportador ("los internacionales dan mucho dinero").
  23 contactos (20 + 3 de reserva: KEYA, FFaiges, DRV Phytolab), emails verificados en Apollo, 23 créditos. Saldo Apollo: 2.582 de 2.660
  (78 gastados en el ciclo). Fichas en Notion (`Campaña = Outlook 1:1`, `Origen = B`, `Sin contactar`). Correos redactados en
  `trabajo-en-curso/correos-internacionales-2026-10-06.md`. Pendiente: Alex los envía y se marcan `Contactado`.
- Rehacer el dosier con los datos nuevos (final de mes).
- **Informe mensual**: se genera directamente desde el CRM y funciona (05/10/2026). Alex lo pasa
  él mismo a los comerciales y a gerencia. El workflow de n8n se retira y la Edge Function
  `informe-mensual` no existe ni hace falta reconstruirla. Solo existe la tabla
  `resumenes_mensuales`.
- **Migraciones**: el repo tiene 69 archivos y Supabase tiene migraciones posteriores
  (p. ej. `alertas_cartera_repetida`, 05/10). Comprobar que el repo contiene todas las aplicadas.
- **Leads fuera de las cuatro plazas comerciales**: Alex pasa todos los leads a Lidia (y a
  Mercedes, en los de Baleares); ellas reparten. Con el ámbito "toda España" no cambia el
  proceso. `[POR COMPROBAR]` si Mercedes recibe también otros leads además de los de Baleares.
- Unificar exclusiones y formato de mensaje entre la rutina diaria de leads y el outbound (ver `agentes-rutinarios/rutina-diaria-leads.md`).
- **Clay: créditos ya gastados (08/10/2026). No hay más hasta el 17/10.** No volver a plantearlo ni a proponer cómo gastarlos. La rutina de leads pasa de 10 a 20 leads/día el 08/10, con Apollo primero (tope 30/día) y Clay solo de respaldo desde el 17/10.
- Living Las Canteras: aplazado (solo es una propuesta; Alex lo retoma cuando quiera).
- CRM y feedback de gerencia: **cerrado**. Alex confirma (06/10/2026) que el CRM y gerencia están OK; el feedback anterior de la gerente ya no está pendiente.
- Pasar las dos tareas programadas a leer esta carpeta en vez de llevar el prompt completo.
  Hacerlo en paralelo varios días antes de apagar las actuales.

## Infraestructura del CRM: resuelta el 05/10/2026

- La rama de limpieza de Lovable se fusionó a `main` y producción funciona según Alex ("ahora sí", 05/10/2026; antes se comprobó login, 200.557 envíos y
  gestión de usuarios). Detalle y tabla en `sobre-el-proyecto/infraestructura.md`.
- Proyecto de Vercel `envio-wise` (duplicado) borrado por Alex el 05/10/2026.
- Rama antigua `claude/serene-mayer-uvhfm4`: borrada por Alex el 06/10/2026 (verificado: quedan solo `main` y `claude/brave-ritchie-gp7y98`).
