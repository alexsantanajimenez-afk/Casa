# La casa de Claude

Carpeta única con el contexto, las decisiones y las rutinas de los proyectos de Alex Santana.
Claude lee este archivo primero y después entra en la habitación (proyecto) que toque.

## Reglas que valen en toda la casa

- **No ejecutar nada sin el OK explícito de Alex.** Eso incluye escribir en Notion o Brevo,
  enviar mensajes, lanzar campañas y crear HTML, apps o código.
- Responder en español, directo y breve. "Sin humo. Con números."
- No inventar datos ni cifras. Si algo no consta, decirlo y marcarlo `[POR COMPROBAR]`.
- Lo que no esté anotado aquí no significa que no se haya decidido: preguntar.

## Regla de oro: al terminar, subir a `main`

Cada sesión de Claude Code trabaja en su propia rama (`claude/...`). Si el trabajo no se pasa a `main`, la sesión de mañana
**no lo verá** y la casa pierde su sentido. El 09/10/2026 hubo que fusionar 5 ramas de una semana con conflictos.

- **Al empezar**: sesión nueva, base `main`. Leer `CLAUDE.md` y `estado.md` del proyecto.
- **Al terminar**: actualizar `estado.md` y `decisiones.md` y **subir todo a `main`** (avance directo; si hay conflicto, resolverlo
  conservando todas las decisiones). Alex lo pide con: "actualiza el estado y las decisiones y súbelo a `main`".
- Antes de dar por cerrada una sesión, comprobar con `git log origin/main` que el último commit está en `main`.
- Los borradores que Alex copia y pega van en el chat o en Notion; GitHub es para lo estable.

## Mapa

| Carpeta | Qué hay |
|---|---|
| `0-adn/` | Quién es Alex, cómo trabaja, preferencias |
| `1-proyectos/cargo-serpa/` | Growth de Cargo Serpa (cliente ancla, el que se usa a diario) |
| `2-herramientas/` | Skills y métodos reutilizables en varios proyectos |
| `3-archivo/` | Copias de seguridad y cosas que ya no se usan |

Más adelante: `1-proyectos/living-las-canteras/` y `2-herramientas/auditoria-web/`.

## Cómo se trabaja una habitación

Cada proyecto tiene en la puerta tres archivos: `CLAUDE.md` (normas), `estado.md` (dónde voy)
y `decisiones.md` (qué decidí y por qué). `decisiones.md` no se borra: solo crece.

Al abrir una sesión: leer `CLAUDE.md` y `estado.md` del proyecto, y proponer qué toca hoy.
Al cerrar: actualizar `estado.md` y apuntar en `decisiones.md` lo que se haya decidido.

## Código y datos que viven fuera de esta carpeta

- CRM de Cargo Serpa: repo `alexsantanajimenez-afk/envio-wise` (GitHub). Tiene su propio `CLAUDE.md`.
- Datos del CRM: Supabase, proyecto `cargo-serpa-crm`. Se consultan en directo, no se copian aquí.
- Prospectos y leads: Notion (base "Prospectos"). Envíos de email: Brevo. Enriquecimiento: Apollo.
