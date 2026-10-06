# Estándar operativo de captación y reactivación (06/10/2026)

Una sola forma de hacer cada cosa. Si algo no cuadra con esto, se corrige aquí primero.
Lo marcado **(propuesto)** lo propuso Claude el 06/10/2026 y falta el OK de Alex; el resto lo decidió Alex.

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

## Brevo (solo reactivación de cartera)

- Remitente siempre `hola@comunicaciones.cargoserpa.es`, nunca `alexsantana@` ni el dominio raíz. **(propuesto)**
- Nombre de campaña y de lista: `REACT{n}_{SEGMENTO}_{AAAA-MM}`. El estado (borrador, programada) no va en el nombre. **(propuesto)**
- Solo contactos de empresa (B2B); fuera los marcados como `particular`. **(propuesto)**
- Rebote duro objetivo por debajo del 2 %. Si una campaña pasa del 5 %, se para y se limpia la lista antes de seguir. **(propuesto)**
- Brevo bloquea solo los rebotes duros; los contactos bloqueados no se vuelven a enviar.

## Notion "Prospectos"

- `Origen` obligatorio en toda ficha. Hoy unas 89 fichas no lo tienen.
- Campo nuevo **"Campaña"** (código REACT… o "Outlook 1:1") para poder medir respuestas por campaña. **(propuesto, hay que crearlo en Notion)**
- Toda respuesta a una campaña se registra el mismo día con `Estado = Respondió`.

## Tarea fija: cruce Brevo ↔ Notion

Brevo no ve las respuestas (llegan al Outlook de Alex). Por eso, **siempre**:

1. A los 3 días de cada campaña y a los 7, Claude lee las listas de Brevo (solo lectura) y cruza los emails con las fichas "Respondió" de Notion.
2. Cada viernes, en el cierre semanal, se repite con todas las campañas abiertas.
3. Resultado: enviados, rebotes, respuestas, respuestas útiles (Encaja) y tasa por campaña, en `trabajo-en-curso/`.
4. Respuestas sin campaña asignada se resuelven por email contra las listas de Brevo; si no aparece, se marca `[POR COMPROBAR]`.
