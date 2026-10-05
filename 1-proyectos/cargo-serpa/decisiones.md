# Decisiones · Cargo Serpa

Este archivo no se borra: solo crece. Añade fecha cuando se decida algo nuevo.
Lo que no consta aquí no significa que no se decidiera: preguntar.

## Estrategia y atribución

- **Bonus**: solo cuenta lo atribuible a las acciones de Alex, nunca el crecimiento orgánico de la
  empresa. Ningún análisis puede mezclarlos sin distinguirlos.
- **Facturación del dosier**: sale de los datos contables (base exenta), no del CRM. En el CRM se
  usa fecha de factura, no fecha de envío.
- **Cartera fría**: llamada personal a las cuentas del Top 10, no campaña masiva indiscriminada.
- **Geografía en el CRM**: la provincia es la dimensión principal; las islas, desglose secundario.
- **Baleares**: se capta por volumen, pero no es eje de contenido de autoridad salvo que haya
  material operativo real.
- **Ámbito de la prospección (05/10/2026)**: toda España, todas las comunidades. Antes se
  limitaba a Madrid, Canarias, Baleares y Barcelona (más País Vasco en el BORME). Las tareas
  programadas todavía tienen el texto antiguo.
- **Cifras vigentes (05/10/2026)**: ICP de 62 clientes, base de 19.408.119,71 € en 32 meses,
  vida media de cliente de 12,1 meses. Las anteriores (58 y 65 clientes; 12 M€ en 19 meses;
  10,2 meses) quedan descartadas.

## Canales

- **Brevo, fuera de la prospección en frío.** La captación va por mensajes 1:1 desde Outlook
  (alexsantana@cargoserpa.es). Brevo se queda para reactivación de cartera.
- **Subdominio de envío**: `comunicaciones.` en vez de `marketing.`, para que el cliente no lo
  perciba como publicidad. No se autentica el dominio raíz para no tocar el correo operativo
  (`mail.cargoserpa.es`).
- **Fuentes de señal**: todas, salvo lo ilegal.
- **Orden fijo del flujo de prospección**: señales (Google, licitaciones, BORME…) → LinkedIn →
  cruce de datos → Agente 6 (Lead Scorer) → Apollo.
- **Comerciales**: reciben por email el contenido real, cada uno solo su cartera. El WhatsApp es
  solo un aviso, redactado por Claude y enviado por Alex (no hay conector).
- **Leads a Lidia Marín** (lidiamarin@cargoserpa.es) y Mercedes (Baleares): Alex les pasa **todos**
  los leads (corrección del 05/10/2026; antes constaba "solo los ya contactados"). Un lead se
  pasa en tres casos: (1) **lead caliente**: llega alguien nuevo; (2) **activación de Brevo**
  (respuesta o interacción a una campaña); (3) **mensaje 1:1**: nos escribe alguien que no usa
  un servicio pero sí otro y hay que nutrirlo. Los fríos sin contactar se quedan en la base
  "Prospectos" de Notion. Alex no comparte su Notion con ellas.
- **Informe mensual (05/10/2026)**: lo saca Alex del CRM y lo pasa él mismo a comerciales y a
  gerencia. No se automatiza con una Edge Function por ahora.
- **Redes sociales**: descartadas Instagram, TikTok y Facebook; el ICP de compras e industria
  está en LinkedIn.
- **API de Claude**: descartada por ahora; se usa la suscripción.

## Alertas de fuga (criterio real, verificado en el código el 05/10/2026)

Lo que hace `src/lib/cadencia.ts` del CRM (no coincide con la nota antigua de "mes actual vs
media de 3 meses, alarma a más de 30 días"):

- **Alarma A, silencio anormal**: el cliente supera su intervalo habitual entre envíos. Mínimo
  21 días parado, con ajuste estacional (si toda la empresa baja, el intervalo se alarga hasta x2).
- **Alarma B, bajada de ritmo**: últimos 30 días frente a la media por 30 días de los 90 días
  anteriores. Caída propia ≥ 30 %, al menos 20 pp peor que la empresa, mínimo 2 envíos al mes y
  al menos 7 días sin enviar.
- Se necesitan al menos 6 envíos históricos para que haya patrón. Tope de 10 alertas de riesgo
  (A + B) por comercial y semana. La fecha "presente" es siempre la fecha de corte, no hoy.

## Agentes

- **Eliminados**: Agente 1 Intake viejo (el CRM ya manda los resúmenes a los comerciales) y
  Agente 10 Director de ejecución (duplicaba al Orquestador).
- **Roles**: los agentes son sombreros dentro de la misma conversación, no procesos
  independientes. Las dos tareas programadas son la excepción: corren solas.
- **Notion, Tipo = "Cliente"** para los prospectos del barrido de señales: confirmado como correcto
  (05/10/2026).

## Mensajes de outbound

Ver `mi-metodo/outbound.md` (contenido, tuteo, cierre literal, firma, respuestas) y
`mi-metodo/linkedin.md` (tono y reglas del gancho).

## Infraestructura del CRM (05/10/2026)

- Se eliminó Lovable del repo y se dejó un solo lockfile (`package-lock.json`); el `bun.lock`
  apuntaba al caché privado de Lovable.
- Build propio de Vite; Nitro detecta Vercel solo (antes forzaba Cloudflare).
- `.env` fuera del repo; plantilla en `.env.example`. Las variables viven en Vercel.
