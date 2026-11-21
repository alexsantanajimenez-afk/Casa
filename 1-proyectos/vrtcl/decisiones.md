# Decisiones · VRTCL

Este archivo no se borra: solo crece.

## Antes del 19/11/2026 (sesión larga de diseño)

- Nombre y marca: **VRTCL**, con el logo SVG de Alex (tras descartar Metódica, CrecIA, Growrun y otros).
- Eslogan "Human judgment. AI execution." ("criteria" en inglés es incorrecto; "Criterio humano" solo en español).
- Titular de portada: "Crece con criterio. Escala con IA."
- Web v2 inspirada en Cloud District (sin copiarla): blanco y negro puro, amarillo `#FFC700` solo en subrayados y punto.

## 19/11/2026

- Se publica la v2 (versión 4 del artifact) en Netlify, proyecto nuevo `vrtcl`, dominio `vrtcl.tech` desde DonDominio
  (ANAME → `apex-loadbalancer.netlify.com`, CNAME `www` → `vrtcl.netlify.app`). MX y correo se quedan en DonDominio.
- Hero: "Somos tu Growth Manager y tu equipo de Go To Market durante todo el proceso."
- Fuera "Imagen provisional", "Growth" bajo los logos, LinkedIn roto y casillas "Logo pendiente".
- Animaciones recortadas: portada se descifra en ~0,5 s; sin letras que ruedan en desplegables; sin glitch en logos;
  sin la cinta de "Por qué ahora"; sello a 60 s por vuelta. Tipografía: fuera League Spartan.
- Foto y fuentes fuera del HTML; imagen para redes (`og.png`) e icono.
- Formulario a **Supabase en la UE** (no Brevo, no Netlify Forms). Como la cuenta gratuita ya tenía 2 proyectos, se usa
  de momento el proyecto **Casa** con tabla propia y una **función intermedia en Netlify** para no publicar su clave
  (la tabla `casa` está abierta al público).
- Legal: titulares **Alexandre Santana y Carlos Cedres, autónomos y corresponsables**; dirección de Telde;
  email hello@vrtcl.tech; **12 meses** de conservación; página de seguridad aprobada tal cual; sin canal de denuncias
  (no aplica por tamaño).
- Analítica: **Google Analytics 4** con banner de consentimiento (no Plausible).
- Etiquetas pequeñas en español; solo eslogan y "Service as a Software" en inglés.
- Sección de clientes: "/ Con quién hemos trabajado" + "Lo que te proponemos, ya funciona."; logo + nombre, sin decir
  quién trabajó; 12 logos; vuelta en cascada al entrar, una sola vez (opción A).
- Nombres de imágenes con huella de contenido para que los navegadores no se queden con versiones viejas.

## 20/11/2026

- Mañana (21/11): cuenta nueva de Supabase con hello@vrtcl.tech y migración; hoy no.
- Aviso de cada contacto por email a **hello@vrtcl.tech** (SMTP de DonDominio), con "Responder a" al contacto.
  Atención 1 a 1, sin Brevo.
- Prospección: la mejor señal es la empresa que **publica una oferta de growth/GTM** (alternativa a contratar);
  RevOps atrae empresas grandes y queda en segunda prioridad. Ventaja de sector: software para turismo y alojamientos
  (Chekin). INFINNI: encaje medio (ya tienen HubSpot y quieren puesto fijo). Smartness: prioridad alta por sector
  con ángulo "que cada euro de anuncios acabe en ARR".
- Modelo **fractional de 6 meses** como segunda forma de trabajar, sin ataduras; cuidado con el falso autónomo
  (contrato de servicios con entregables). Unobravo publica justo una oferta "Fractional Growth Manager" de 6 meses.
- Idea de Carlos: escribir también a **Heads of Growth de startups**, que necesitan manos y tiempo
  ("a mí me hubiese llegado esto en Chekin y lo hubiese contratado").
- Contacto en frío: primero LinkedIn 1 a 1, sin herramientas que automaticen LinkedIn; email en frío con cuidado
  (LSSI art. 21) `[POR COMPROBAR con abogado]`.
- Aviso de cada contacto del formulario a hello@vrtcl.tech por el SMTP de DonDominio (funcionando desde el 20/11).
- **Cliente objetivo (corrige lo anterior del día)**: dos segmentos con la misma oferta (auditoría de 2 semanas +
  proyecto de 16 semanas): **pymes B2B de 10 a 250 personas** que quieren crecer y no tienen manos ni sistema, y
  **startups con ronda levantada** (últimos 12 meses). **Fuera**: grandes empresas, el formato fractional de 6 meses
  y el cobro por resultado / cuota tipo "Service-as-Software". Pendiente fijar un mínimo de facturación para la
  pequeña empresa `[POR DECIDIR]`.

## 21/11/2026

- **Manual de instalación** (v2) como documento de uso interno para quien entre al equipo: tono de manual de
  operaciones, sin nombres de socios, sin clientes concretos y sin explicaciones para convencer. Fuente y PDF en `manual/`.
- **Notion es obligatorio** en cada cliente: historial diario de lo hecho, base de conocimiento, actas y manual.
  Nunca Google Docs.
- **CRM y dashboard son una sola pieza**: una web privada con login (cuentas, cola de aprobación, embudo e informe
  semanal). Se dice **"dashboard"**, no "panel".
- **Base de conocimiento** como pieza propia: 12 documentos en Notion que leen los agentes (solo versiones aprobadas).
- Las cuatro piezas de la web y del manual: Estrategia de growth · CRM con su dashboard · Base de conocimiento ·
  Diez agentes de IA.
- **Stack de cliente**: Notion, Claude (API), Supabase (UE), GitHub (repositorio del cliente), Vercel (aloja el CRM y
  los agentes), Apollo, email conectado, dominio y DNS, calendario, LinkedIn, Google Analytics 4 + Search Console y
  gestor de contraseñas como obligatorios; Slack, transcripción de reuniones, verificador de emails, monitorización y
  firma digital como recomendables; BORME, portales de empleo, noticias y licitaciones como fuentes de señales.
  Todo a nombre del cliente. La web de VRTCL sigue en Netlify.
- **Auditoría (semanas 1–2)**: una reunión de arranque, ejecutamos nosotros y una reunión de decisión. Sin entrevistas
  a comerciales. Durante el proyecto, **una reunión semanal** con el dueño del sistema y acta en Notion.
- **Los 10 agentes** (nombres de la web): Vigía, Buscador, Limpiador, Investigador, Puntuador, Redactor, Lector
  (también crea la reunión si hay interés), Cuidador (seguimientos), Analista (competencia y mejoras) y Portavoz
  (informe semanal, resumen diario en Notion y avisos). Se descarta "Agendador".
- **Método de búsqueda por señales que VRTCL instala en cada cliente** (no es para la prospección propia de VRTCL).
  Idea tomada de un post de Nico Manzaneque ("Lead signals") porque enriquece el sistema. Va en el manual:
  - Toda señal del cliente se escribe con la frase «Cuando una empresa publica ___, puede necesitar lo que vendemos
    porque ___». Si no se completa la segunda parte, no es señal. Va en el documento 5 de su base de conocimiento.
  - El Investigador lee la oferta de empleo por dentro y saca qué trabajo necesita sacar adelante esa empresa.
  - Prueba del nombre: si quitas el nombre de la empresa y el mensaje vale para otra, se descarta. El primer mensaje
    parte del problema concreto y suele abrir con una pregunta.
