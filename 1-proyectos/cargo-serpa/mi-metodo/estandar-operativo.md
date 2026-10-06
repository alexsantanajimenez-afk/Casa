# Estándar operativo de captación y reactivación (06/10/2026)

Una sola forma de hacer cada cosa. Si algo no cuadra con esto, se corrige aquí primero.
Todo lo de este archivo está aprobado por Alex el 06/10/2026 ("OK a todo"), incluido lo que propuso Claude.

## Dónde vive cada dato

| Qué | Dónde |
|---|---|
| Clientes, envíos y cartera | CRM / Supabase `cargo-serpa-crm` (fuente de verdad) |
| Reactivación de ex-clientes (envío masivo) | Brevo |
| Prospectos nuevos (fríos) | Outlook 1:1, `alexsantana@cargoserpa.es`, hasta **50 al día** (capacidad de Alex) |
| Registro de prospectos y respuestas | Notion, base "Prospectos" |
| Contactos y emails | **Apollo siempre** (plan de pago) |
| Clay | Solo para lo que Apollo no encuentre y solo con los créditos gratis que se activan el 16/10/2026, hasta gastarlos |

## Apollo (desde 06/10/2026)

- Plan de pago de 65 USD. **2.660 créditos de lead por ciclo** (06/10 a 06/11/2026). Teléfonos: no, de momento.
- Por criterio: priorizar empresas del tamaño y sector de las 62 que suman el 80 % de la facturación.
- Antes de gastar créditos, Claude da el coste estimado y espera el OK de Alex. Después apunta créditos gastados y saldo.
- Verificar el email en Apollo antes de enviar. Los emails de Clay sin verificar se marcan "(Clay, sin verificar Apollo)".
- **Regla de no repetición (Alex, 06/10/2026)**: nunca se vuelve a traer un contacto ya contactado. Antes de gastar un crédito se
  comprueba en Notion, en cualquier estado, por email, dominio, empresa y nombre de la persona; y en el CRM por palabra completa.
  Aplica a Apollo, a Clay, a la rutina diaria y a cada lote manual. Un contacto con respuesta automática (fuera de la oficina) sigue
  siendo "Contactado": no se vuelve a escribir sin que Alex lo decida.
- Los apellidos de Apollo pueden estar desactualizados (caso DRV: figuraba Sukajeva y firma Bistrova). Si la respuesta trae otro nombre, se corrige la ficha.

## Brevo (solo reactivación de cartera)

- Remitente siempre `hola@comunicaciones.cargoserpa.es`, nunca `alexsantana@` ni el dominio raíz.
- Nombre de campaña y de lista: `REACT{n}_{SEGMENTO}_{AAAA-MM}`. El estado (borrador, programada) no va en el nombre.
- Solo contactos de empresa (B2B); fuera los marcados como `particular`.
- Rebote duro objetivo por debajo del 2 %. Si una campaña pasa del 5 %, se para y se limpia la lista antes de seguir.
- Brevo bloquea solo los rebotes duros; los contactos bloqueados no se vuelven a enviar.

## Notion "Prospectos"

- `Origen` obligatorio en toda ficha. Desde el 06/10/2026 responde a "¿de dónde sale el contacto?": **Cartera CRM · Clay · Apollo ·
  LinkedIn · Señal · Referido · Inbound**. Las letras A-F quedan solo en las fichas viejas. Las fichas nuevas cargadas con Apollo llevan `Apollo`.
  Rellenadas 80 fichas el 06/10. Quedan 11 sin Origen (Verbund, Dormitorum, Digital Fone, Siscocan, Solmad, COARCO, Mint, Lacer, Gaestopas, Surdiesel, Improve): Alex dirá de dónde salieron.
  Las 63 fichas cargadas el 06/10 con `B · Emisor peninsular` pasan a `Apollo` cuando se decida.
- Campo nuevo **"Campaña"** (código REACT… o "Outlook 1:1") para poder medir respuestas por campaña. (creado en Notion el 06/10/2026, con las seis campañas actuales y "Outlook 1:1")
- Toda respuesta a una campaña se registra el mismo día con `Estado = Respondió`.

## Tarea fija: cruce Brevo ↔ Notion

Brevo no ve las respuestas (llegan al Outlook de Alex). Por eso, **siempre**:

1. A los 3 días de cada campaña y a los 7, Claude lee las listas de Brevo (solo lectura) y cruza los emails con las fichas "Respondió" de Notion.
2. Cada viernes, en el cierre semanal, se repite con todas las campañas abiertas.
3. Resultado: enviados, rebotes, respuestas, respuestas útiles (Encaja) y tasa por campaña, en `trabajo-en-curso/`.
4. Respuestas sin campaña asignada se resuelven por email contra las listas de Brevo; si no aparece, se marca `[POR COMPROBAR]`.
