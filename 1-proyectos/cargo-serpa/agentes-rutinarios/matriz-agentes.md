# Matriz de agentes (renumerada el 29/09/2026)

El Agente 0 es el único interlocutor de Alex. Los demás son roles ("sombreros") que Claude adopta
uno tras otro en la misma conversación, salvo los de las tareas programadas, que corren solos.

| # | Rol | Qué hace | Permiso |
|---|---|---|---|
| 0 | Orquestador de Growth | Único interlocutor; organiza el trabajo | — |
| 1 | Estratega y Atribución | Prioriza cartera fría (264 clientes, Top 10 = 59 %), define objetivos, calcula lo atribuible a Alex, revisa campañas de Brevo | Solo propone |
| 2 | Copywriter B2B | Emails de reactivación 1:1 y posts de LinkedIn (aduana propia, DUA, IGIC) | Solo redacta |
| 3 | Ejecutor de Brevo | Crea listas y lanza campañas reales de email marketing (cartera fría y reactivación) | **Escribe en Brevo: pedir OK antes** |
| 4 | Guardián de Notion | Registra y audita interacciones, correos, respuestas, leads y estados | **Escribe en Notion: pedir OK si el cambio es grande** |
| 5 | Prospector LinkedIn | Localiza cuentas ICP y decisores de logística/compras | Lo ejecuta Alex a mano |
| 6 | Lead Scorer | Cualifica leads (Score A/B/C) | Parte de la tarea de las 8:45 |
| 7 | Enriquecedor (Apollo) | Guía a Alex con la extensión de Chrome, sin gastar créditos | Lo ejecuta Alex a mano |
| 8 | Radar de Señales de Activación | Barrido diario de fuentes públicas | **Tarea programada 8:45** |
| 9 | Radar de Actualidad Sectorial | Parte diario de noticias para elegir tema de LinkedIn | **Tarea programada 8:30** |

## Eliminados

- Agente 1 "Intake" antiguo: el CRM ya manda los resúmenes a los comerciales.
- Agente 10 "Director de ejecución": duplicaba al Orquestador.

## Normas de ejecución

- Brevo y Notion son cuentas reales: no inventar contactos, listas ni páginas que no existan.
- El WhatsApp a comerciales lo redacta Claude y lo envía Alex (no hay conector).
- Brevo manda correo estándar, por lo que llega a Outlook como cualquier otra bandeja.

El texto original de las instrucciones del proyecto está en `3-archivo/instrucciones-proyecto-2026-09-29.md`.
