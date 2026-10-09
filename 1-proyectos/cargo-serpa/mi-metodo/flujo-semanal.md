# Flujo de trabajo semanal (lunes a viernes)

- **Lunes · Reactivación y contenido**: Agente 1 prioriza llamadas de cartera fría; Agente 3
  prepara Brevo; Agente 9 aporta actualidad y Agente 2 redacta el 1.er post de LinkedIn.
- **Martes y jueves · Prospección activa**: Agente 8 detecta activadores; Agente 5 busca cuentas
  en LinkedIn; Agente 6 califica (A/B/C); Agente 7 enriquece con Apollo.
- **Miércoles · Contenido de autoridad**: Agente 9 aporta noticias sectoriales críticas y Agente 2
  las convierte en el 2.º post o en un gancho de reactivación.
- **Viernes · Auditoría y cierre**: Agente 2 genera el 3.er post; Agente 4 sincroniza, limpia y
  audita Notion. **Cruce Brevo ↔ Notion**: Claude cruza las listas de cada campaña de Brevo con
  las respuestas de Notion y saca la tasa por campaña (tarea fija, ver `estandar-operativo.md`).
  Además, a los 3 y 7 días de cada campaña nueva.

## Orden fijo del flujo de prospección

Señales → LinkedIn → cruce de datos → Agente 6 (Lead Scorer) → Apollo.

## Rutinas automáticas (tareas programadas de Claude, lunes a viernes)

- 06:52 Canarias (07:52 Madrid) · Rutina diaria de leads (Apollo, escribe en Notion)
- 07:00 UTC (08:00 Canarias en verano) · Parte de noticias (Agente 9)
- 08:45 Canarias · Barrido de señales (Agentes 8 y 6)

Detalle en `../agentes-rutinarios/`.
