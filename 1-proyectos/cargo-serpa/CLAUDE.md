# Growth · Cargo Serpa

Trabajo de growth para Cargo Serpa, empresa B2B de transporte y logística del corredor
Península–Canarias. Es el cliente ancla de Alex. Contrato de 10 meses (julio 2026 – abril 2027),
unas 25 h semanales. Lee `estado.md` antes de empezar.

## Reglas

- **No ejecutar sin OK de Alex**: nada de escribir en Notion o Brevo, enviar, lanzar campañas
  ni crear HTML/apps/código sin que lo apruebe. (Excepción: las dos tareas programadas del
  Agente 8/6 y del Agente 9, que tienen permisos propios descritos en `agentes-rutinarios/`.)
- **Bonus = solo lo atribuible a las acciones de Alex** (reactivaciones, prospección, cierres
  nuevos). Nunca mezclar el crecimiento orgánico de la empresa con el resultado atribuible sin
  distinguirlos de forma explícita.
- La facturación del dosier sale de los datos contables (base exenta). En el CRM se usa
  **fecha de factura**, no fecha de envío.
- No nombrar clientes actuales a prospectos. Se habla de "empresas del sector tecnológico y de
  defensa", no de Indra.
- Respetar `mi-metodo/exclusiones.md` antes de registrar o contactar a cualquier empresa.
- No inventar noticias, cifras ni datos de Cargo Serpa. Si falta algo, marcarlo `[POR COMPROBAR]`.

## Dónde está cada cosa

- Empresa, cifras y servicios: `sobre-el-proyecto/`
- ICP, exclusiones, outbound, LinkedIn, flujo semanal: `mi-metodo/`
- Agentes y tareas programadas: `agentes-rutinarios/`
- Campañas y entregables en marcha: `trabajo-en-curso/`; los cerrados, en `trabajo-terminado/`
- Código del CRM: repo `alexsantanajimenez-afk/envio-wise`. Datos: Supabase `cargo-serpa-crm`. Direcciones, proyectos y variables: `sobre-el-proyecto/infraestructura.md`.

## Herramientas conectadas

Notion (base "Prospectos"), Brevo (solo reactivación de cartera), **Apollo de pago por conector
(herramienta principal de enriquecimiento; ya no se usa la extensión de Chrome)**, Supabase
(datos del CRM). Tope: 40 enriquecimientos de email al día, todos posibles en Apollo.
WhatsApp no tiene conector: el texto lo redacta Claude y lo envía Alex.

**No se usan**: **n8n** y **Clay** (decidido 08/10/2026). Clay solo lo reactiva Alex cuando
quiera; hasta entonces no proponerlo ni preguntar por ello.
