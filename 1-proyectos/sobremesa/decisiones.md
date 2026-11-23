# Decisiones · SOBREMESA

Este archivo no se borra: solo crece.

## 21/11/2026 · Auditoría de oportunidades (antes de SOBREMESA)

Alex y su compañero buscaban algo que crear en 1–2 meses, sin SaaS, con muchas descargas. Ideas estudiadas y
descartadas, con el motivo:

- **Gestoría de la dependencia**: descartada, hace falta ser abogado o similar para la parte fuerte.
- **App para dueños de perros** (curso y seguro obligatorios de la Ley 7/2023): descartada. El curso será
  gratis por ley y su reglamento seguía sin publicarse (octubre 2026); el mercado de apps de perros está
  lleno de apps pequeñas (Huella, 4Pets, Doguify…) y Barkibu domina el seguro.
- **Parking con precio dinámico**: descartada. Los operadores grandes ya lo hacen por dentro, es un mercado
  de dos lados y en el fondo es un SaaS.
- **Run clubs**: descartada. Strava lanzó en julio de 2026 su pestaña de eventos y grupos, y CorrerJuntos
  ya cubre España.
- **Oposiciones** (OpositaTest, GoKoan…) y **comparador del súper** (FindItApp, OkLista…): saturados.
- **FIV en español**: hueco real pero nicho pequeño; aparcada.
- **Elegido: juego de fiesta en grupo**, inspirado en el éxito del Impostor y en juegos de mesa como
  Guatafac, pero **original**, no una copia.

## 21/11/2026 · Concepto y marca

- Familiar, en grupo, competitivo, con ranking, para todas las edades.
- Nombre **SOBREMESA** (no se encontró app de juegos con ese nombre; "Jaleo" descartado porque ya existe un
  desarrollador con ese nombre en Google Play). Registro de marca y dominio `[POR COMPROBAR]`.
- Mascota: **cafetera italiana** con cara, que presenta y habla.
- Marca viva inspirada en la caja del Impostor que enseñó Alex: degradado rojo a naranja, SOBREMESA en
  mayúsculas, etiqueta blanca girada, firma a mano y cinta de colores.
- Equipos por generaciones descartados: se adapta la dificultad por edad (interruptor "es peque").

## 21/11/2026 · Experiencia

- **Una sola mecánica** (v2): "Os digo una cara, la ponéis todos a la vez, señaláis la mejor". Lo sencillo
  triunfa más.
- Sin selfies, sin edades ni cámara al empezar: solo nombre y "es peque".
- Se vota señalando con el dedo; el móvil solo apunta el ganador.
- Liga de Navidad (4 jornadas) y tarjeta del ganador para WhatsApp como motor de crecimiento.
- Packs de pago único y pase de temporada, sin anuncios (precios de muestra, sin validar).

## 22/11/2026 · Revisión de diseño (v3) y app

- Alex pidió revisar pantallas porque los textos se montaban: la v2 dejaba fuera de pantalla el botón
  "Jugar" en móviles pequeños. La v3 se rehízo con botón fijo abajo y contenido con scroll, revisada en
  360, 390 y 430 px de ancho.
- Letra grande para todos, confeti, sonidos, vibración, frases de la cafetera, podio de 3.º a 1.º.
- **Flutter directo**, construido por Claude (no FlutterFlow, no Expo), y **sin fase web de prueba ni tests**.
- Supabase no hace falta de momento: todo se guarda en el móvil. Tendría sentido más adelante para rankings
  entre familias, liga compartida entre móviles o compras.
- Icono: cafetera grande e inclinada sobre el degradado. **Alex pidió quitar la cinta del icono.**
- APK solo para móviles de 64 bits para compilar más rápido.

## 23/11/2026 · Próximos pasos

- Alex quiere **dos juegos: Caras y Mímica**, que se eligen al empezar.
- Foto de grupo: mejor **una sola foto al final** con marco de la marca (menos desarrollo, sirve para
  medir si la gente la comparte). Foto por ronda, más adelante si funciona.
- Para ahorrar créditos, seguir en una **sesión nueva** que lea este `estado.md`.
- **Logo elegido: opción 1, "El vapor"**: SOBREMESA en Bricolage condensada y mayúsculas, con dos volutas
  de vapor saliendo de la O. Descartadas: "La O es una cara" y "El sello". Propuestas en
  `referencias/propuestas-logo.png`.
- Maqueta de la foto final con marco en `referencias/maqueta-foto-final.png` (enseñada, falta OK final).
