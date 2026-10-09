# Rutina diaria de leads (tercera tarea programada)

Descubierta el 05/10/2026 al listar las tareas de Claude: **no estaba en el volcado inicial** y es
distinta del barrido de señales (Agentes 8/6).

- **Nombre**: "Rutina diaria de leads Cargo Serpa" (id `trig_017Rpb6Faivnwr7xquL62zq3`).
- **Horario real**: lunes a viernes, **07:52 hora de Madrid** = 06:52 en Canarias (`CRON_TZ=Europe/Madrid 52 7 * * 1-5`).
- **Aviso**: solo notificación push.
- **Conectores**: Clay, Apollo, Notion, Supabase (solo SELECT).
- **Permiso**: crea filas nuevas en Notion "Prospectos" con el mensaje redactado. **No envía correos ni escribe en el CRM.**
- **Volumen**: hasta el 7 de octubre (modo prueba) 10 leads al día; **desde el 8 de octubre, 20 al día**.

## Actualizada el 06/10/2026 con OK de Alex: Apollo es la herramienta principal

**Por qué**: la ejecución del 06/10 creó 0 leads. No fue falta de créditos: Clay no permite filtrar por cargo ni por país y la rutina
pidió permiso para usar Apollo, que su prompt limitaba a 10 al día. Prompt anterior archivado en `3-archivo/rutina-diaria-leads-prompt-anterior-2026-10-05.md`.

Cambios (el texto íntegro vive en la propia tarea programada; esta es una copia **resumida**, si se edita uno hay que editar el otro):

- **Apollo principal**: búsqueda con `apollo_mixed_people_api_search` (gratis, sin emails) y email con `apollo_people_bulk_match` por id (1 crédito por persona), solo emails `verified`. Sin teléfonos ni waterfall.
- **Topes**: máximo 30 enriquecimientos al día; no gastar si quedan menos de 500 créditos de lead (ciclo 06/10 a 06/11/2026, 2.660 créditos). Anota gasto y saldo.
- **Clay**: solo para pedir el email de contactos de los que Apollo no devuelva email verificado, y solo si hay créditos (los gratis se activan el 16/10/2026). Esos contactos se dejan en Notion con "Sin email verificado en Apollo: PENDIENTE DE CLAY", `Acción siguiente = Verificar datos`, máx. 5 al día.
- **Notion**: `Contacto = email (Apollo verificado dd/mm)`; nuevo `Campaña = Outlook 1:1`.
- **Mensaje**: plantilla oficial del 06/10/2026 (`mi-metodo/outbound.md`): frase de sector, IATA y WCA, envíos semanales a Latam, línea de baja, ofrece el dossier del equipo comercial. Asunto único "Presentación · Cargo Serpa".
- **Exclusiones**: añadido Stryker. Cruce con el CRM por palabra completa (evita falsos positivos tipo "Naraindas").
- También se excluyen buzones `compras@` como genéricos.

## Cosas a revisar (pendientes de decidir con Alex)

- **Formato de mensaje**: el prompt usa desde el 06/10 una plantilla oficial de Alex (asunto único, con dossier y
  envíos semanales a Latinoamérica). `mi-metodo/outbound.md` fija otro formato (solo presentarse, sin cifras, cierre literal).
  Hay que decidir cuál manda.
- **Exclusiones**: unificadas el 05/10/2026 en el punto 4c con `mi-metodo/exclusiones.md` (esta rutina conserva además a Mint Company y a los grandes EPC como ya clientes; el prompt añade a Stryker). Si se cambia una lista, cambiar la otra.
- El orden fijo de prospección decidido (señales → LinkedIn → cruce → Agente 6 → Apollo) no se parece a esta rutina.
  Es un flujo paralelo; aclarar cómo conviven.
- El prompt dice "Tipo = Cliente" (confirmado como correcto) y "Origen = F · Rutina diaria".

