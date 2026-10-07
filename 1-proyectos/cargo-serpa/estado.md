# Estado · Cargo Serpa

Última actualización: 07/10/2026 (cierre del miércoles: outbound, búsquedas nuevas y noticia de LinkedIn).

## Hoy, 07/10/2026

- **Enviados por Alex (38 correos 1:1 en formato B)**, todos en Notion como "Contactado" con fecha 07/10:
  8 leads de la rutina diaria, 20 de la tanda 1 de exportadores y envíos internacionales y los 10 de la
  tanda 2.
- **Pendientes de enviar (18 fichas "Sin contactar" con el mensaje B en el cuerpo, más 1 de Neum)**:
  - Tanda 3, importación desde Alemania (8): Linde Material Handling, REYCA, Recambios Auto Diesel y
    Diselectric (encajan); IPG Dental, VCG Decoletaje, BENIGAR y Grupo Avisa (con "Verificar datos").
  - Tanda 4 (10): RC Microelectrónica, AUSA, Domusa Teknik, Comercial Eléctrica del Llobregat,
    Diagnóstica Longwood, Fluitecnik y Cadielsa (encajan); Hisense Iberia, Herco e Inoxtruck (con
    "Verificar datos").
  - Rafael Parque (Laboratorios Neum, sustituto de Néstor): rparque@laboratoriosneum.com.
- **Respuestas**:
  - **Vincent Brauns (Emica Bombas)** responde que ya trabajan con muchos transitarios y están muy
    cubiertos. Pone en copia a Inma González (logística, inma.gonzalez@emicabombas.com), que contactará si
    hay interés. Notion: "Respondió", "Nurturing", acción A4. Alex le contestó agradeciendo y dejando la
    puerta abierta. **Decisión de Alex: no se pasa a Lidia** (no es un lead caliente).
  - **Respuestas automáticas, personas que ya no están**: Néstor Llansol (Laboratorios Neum, se fue el
    08/05/26) y Dilan Gómez (Distrivet). Ambos "Descartado" en Notion.
  - **Rebotes**: Julian Nuñez (Frutos Secos Medina, el dominio rechaza la dirección) y, el 05/10,
    Luis Lorenzo (EM&E). "Descartado" en Notion.
- **Calidad de los datos de Apollo**: da por "verificado" el email aunque la persona se haya ido, la
  dirección no exista o sea un buzón de departamento (`logistica@`, `compras@`, `export@`). La fecha de
  refresco no sirve de filtro (Dilan figuraba refrescado el 23/09). Antes de enviar: comprobar el cargo en
  LinkedIn (enlace en la ficha) y que el dominio del email coincida con el de la empresa. La tanda de
  importación desde Alemania salió peor que la de exportadores: el origen de las compras no consta en
  ninguna base y los concesionarios de marcas alemanas compran el recambio al almacén de la marca en España.
- **Descartes por CRM o Notion**: Tecnove, Fresenius Kabi, Würth MODYF, Cultek, Helios Electromedicina,
  Mateco España (ya con 3 contactos en "Respondió") y Cohimar Hidráulica Neumática.
- **Distrivet**: la empresa remite a `departamento_transporte@distrivet.es`, buzón genérico que la regla
  descarta. Decisión de Alex pendiente: enviar como excepción o buscar a una persona con nombre.
- **Créditos de Apollo hoy**: 52 gastados en estas búsquedas (22 + 10 + 10 + 10) más 8 de la rutina de la
  mañana = 60 enriquecimientos, por encima del tope de 40 que nos habíamos puesto (Alex pidió seguir).
  Saldo estimado: unos 2.518 (calculado, no releído de Apollo). Clay sin usar (caducan el 17/10/2026).
- **Noticia de LinkedIn (termosellado y embalaje de maquinaria, material de Lidia)**: la máquina de la
  foto va a Canarias; se termosella en plástico y se asegura con correas de amarre (confirmado por Alex),
  y se mueve a todos los destinos. Imagen: se quitó la banda de los tres bloques y el rótulo ajeno
  "WC Móvil". Post redactado con gancho "no es un fantasma" (versión sobria alternativa). Pendiente: el
  logo de Cargo Serpa (Alex lo pasa), cambiar el subtítulo "con los más altos estándares de seguridad y
  calidad" (afirmación sin base), fecha (hoy o viernes), autor (página o perfil) y hashtags.
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
- Unificar exclusiones y formato de mensaje entre la rutina diaria de leads y el outbound (ver `agentes-rutinarios/rutina-diaria-leads.md`).
- Los **créditos de Clay caducan el 17/10/2026**; la rutina de leads pasa de 10 a 20 leads/día el 08/10.
- Living Las Canteras: aplazado (solo es una propuesta; Alex lo retoma cuando quiera).
- CRM: Alex dice que está terminado y que a la gerente le gusta (05/10/2026).
- Pasar las dos tareas programadas a leer esta carpeta en vez de llevar el prompt completo.
  Hacerlo en paralelo varios días antes de apagar las actuales.

## Infraestructura del CRM: resuelta el 05/10/2026

- La rama de limpieza de Lovable se fusionó a `main` y producción funciona según Alex ("ahora sí", 05/10/2026; antes se comprobó login, 200.557 envíos y
  gestión de usuarios). Detalle y tabla en `sobre-el-proyecto/infraestructura.md`.
- Proyecto de Vercel `envio-wise` (duplicado) borrado por Alex el 05/10/2026.
- Pendiente menor: decidir qué hacer con la rama antigua `claude/serene-mayer-uvhfm4` del repo. No tocar hasta decidirlo.
