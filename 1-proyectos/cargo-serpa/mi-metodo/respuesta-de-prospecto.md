# Cuando un prospecto responde (protocolo fijo, 06/10/2026)

Cada vez que Alex pasa una respuesta (a un correo 1:1 o a una campaña de Brevo), Claude entrega **siempre las dos cosas juntas**, con el máximo de datos posibles: el aviso a Lidia y la ficha de Notion.

## Qué hace Claude, en orden

1. **Identificar** la empresa y la persona (por email) en Notion y, si es de una campaña, en las listas de Brevo.
2. **Comprobar el CRM** (Supabase, solo lectura): si es o fue cliente, envíos, último envío e ingresos. Si es cliente actual: no se prospecta; se avisa a Alex y se aplica `exclusiones.md`.
3. **Reunir datos** de la empresa y de la persona con lo que Apollo ya devolvió (sin gastar créditos): sector, qué hace, dirección, empleados, facturación estimada, web, teléfono central, LinkedIn. Los teléfonos directos cuestan créditos de teléfono y hoy no se usan: solo con OK de Alex.
4. **Clasificar**: tipo de lead (caliente, activación de Brevo, 1:1 a nutrir) y veredicto. Pesa el servicio que piden: lo internacional (por ejemplo Latam) es de alto ticket.
5. **Actualizar Notion**: `Estado`, `Veredicto`, `Acción siguiente`, `Fecha último toque`, `Campaña`, y Notas con la respuesta, lo que contestó Alex, los datos de empresa y el resultado del CRM. Si añaden a otra persona, ficha propia (`Rol en la cuenta = Escalada`).
6. **Redactar el aviso a Lidia** con `aviso-a-lidia.md` (siempre los mismos campos, en el mismo orden).
7. **Apuntar lo pendiente** en `estado.md` (dossier, llamada, siguiente paso).

## Reglas

- No se inventan datos: lo que no conste va como `[POR COMPROBAR]`.
- Lo que Alex ya respondió en el hilo se refleja en el aviso, para que Lidia no repita la presentación.
- Nunca se nombran clientes actuales.
