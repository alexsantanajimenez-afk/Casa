# Estado · SOBREMESA

Última actualización: 23/11/2026.

## Dónde estamos

- **App Flutter v0.1 hecha** en `app/`, en la rama `ccr-d3dab3a1-j9wjx5` (todavía no en `main`).
  Compila sin errores (`flutter analyze` limpio). Sin pruebas automáticas, por decisión de Alex.
- **APK de Android generado** (19 MB, solo móviles de 64 bits, firmado con clave de pruebas) y enviado a
  Alex el 22/11 para probarlo en su móvil. **Pendiente su opinión**: no se ha probado aún en un teléfono real
  (voz, sonidos, vibración, WhatsApp, que nada se monte).
- **Icono y pantalla de arranque** propios: cafetera inclinada sobre el degradado, sin cinta. Arranque con
  degradado, cafetera y SOBREMESA abajo (Android 12+: fondo `#FF4A22` liso).

## Qué tiene la app

- Portada → ¿Quién juega? (hasta 12, se recuerda el grupo, interruptor "es peque") → "Cómo se juega" solo
  la primera vez → 6 rondas de Caras (frase que se ajusta sola, versión para peques, "Otra frase", última
  ronda vale doble) → cuenta atrás 3-2-1 y "aguantad la cara" 3 s → votar tocando al ganador o empate →
  celebración con confeti (pasa sola) → marcador → podio de 3.º a 1.º → tarjeta del ganador por WhatsApp →
  liga de Navidad (Nochebuena, Navidad, Nochevieja, Reyes).
- Pausa (voz y sonidos on/off, terminar, salir). El botón atrás del móvil abre la pausa.
- Voz en español (flutter_tts), 5 sonidos propios generados (`app/assets/sonidos/`), vibración.
- 40 frases con versión para peques. Packs (Navidad 3,99 €, Cumpleaños y Cena de empresa 2,99 €, pase de
  temporada 6,99 €) **solo de muestra**: al tocarlos dice "llegan muy pronto".

## Siguiente: lo que Alex quiere hacer

1. **Modo Mímica** junto a Caras: se elige al empezar "¿A qué jugamos?". Propuesta: 2 equipos automáticos
   equilibrados, el que actúa ve la palabra a solas, 45 s con palabras seguidas (✔ acierto / ✖ pasar),
   tic-tac al final, cada jugador actúa una vez, podio de equipos + mejor actor/actriz, ~150 palabras en
   categorías con versión para peques. **Por confirmar**: 45 s seguidas o una palabra por turno.
2. **Foto final con marco** (maqueta aprobada para enseñar, falta su OK final): antes del podio, "¡Foto de
   campeones!" con cámara frontal o trasera y 3-2-1. Tarjeta vertical 1080×1350: marco degradado,
   SOBREMESA arriba con etiqueta "Liga de Navidad", foto en el centro, cafetera como sello en la esquina,
   cinta debajo de la foto, franja blanca con el animal del ganador, "🏆 Gana la Nochebuena", nombre y puntos.
   Botón "Saltar" si no quieren foto. Las fotos no salen del móvil.
3. **Nombre de familia o grupo** opcional para la tarjeta ("Familia Santana"). **Por confirmar.**

Estimación dada a Alex: todo junto 2,5–3 h; solo Mímica ~2 h. Recomendado hacerlo en una sesión nueva
(esta se alargó mucho).

## Pendiente de decidir

- ¿La app va en su propio repositorio "sobremesa" (recomendado) o se queda en la casa?
- Más frases: 40 bastan para probar; para publicar, unas 120.
- Compras de packs: RevenueCat + cuentas de tienda (Apple Developer 99 $/año, Google Play 25 $ una vez).
- Para iPhone hace falta un Mac con Xcode o un servicio en la nube (Codemagic u otro).
- Clave de firma propia para Google Play (la actual es de pruebas).

## Cómo compilar (si la máquina es nueva)

- Flutter 3.50.1 estable (Dart 3.14). En esta versión Material se importa como
  `package:material_ui/material_ui.dart`.
- Android: command-line tools + `sdkmanager --licenses`; Gradle descarga el resto (NDK, CMake, plataformas).
  La primera compilación tardó ~40 min; Maven Central dio error 429 (demasiadas peticiones) y hubo que
  reintentar con `org.gradle.parallel=false`. Después, ~5 min.
- APK: `flutter build apk --release --target-platform android-arm64`.

## Idea de producto (por qué este juego)

Salió de una auditoría de oportunidades del 21–22/11/2026 (ver `decisiones.md`). Referentes que funcionan
con este modelo: el Impostor de Splash (más de 1 millón de descargas en Google Play, de lo más descargado
en España en diciembre de 2025) y Picolo (8 millones de instalaciones en Android). Modelo de ambos: gratis +
suscripción semanal + packs. Las cifras de ingresos de herramientas externas no son fiables `[POR COMPROBAR]`.
