# SOBREMESA

App de juego de fiesta para toda la familia, de Alex y su compañero. Se juega con un solo móvil que
se pasa de mano. Juego actual, **Caras**: la cafetera (la mascota) dice una cara, todos la ponen a la
vez y se señala la mejor. 6 rondas, puntos, podio, tarjeta para WhatsApp y liga de Navidad.
Lema: "el juego de después de comer". Lee `estado.md` antes de empezar.

## Reglas

- **No ejecutar sin OK de Alex**: nada de código, APK, publicar ni gastar créditos sin su "ejecuta" o "hazlo".
  Cuando pide "solo dime", se responde sin tocar nada.
- Antes de cambios grandes de diseño, enseñar primero una imagen o maqueta para validar.
- Simple gana: una mecánica que se entienda en 10 segundos. Nada de registro ni pasos extra.
- Para todas las edades: letra grande, la app habla (voz de la cafetera), versión fácil para peques.
- Privacidad: todo se guarda en el móvil. Las fotos (cuando las haya) no se suben a ningún sitio.
- No copiar juegos existentes (nombre, cartas, arte). Inspiración sí, clones no.

## Marca

- Degradado rojo a naranja: `#FF2E3A` → `#FF4A22` → `#FF7A00`. Texto y contornos berenjena `#2A1036`.
  Fondo crema `#FFF6E9`. Acentos: amarillo `#FFC21A`, menta `#1FC79B`, azul `#2F6BFF`.
- "Cinta de colores" (rojo, naranja, amarillo, menta, azul) como firma. **No va en el icono.**
- Tipografía: Bricolage Grotesque (variable; condensada y en mayúsculas para SOBREMESA y números grandes),
  Caveat para lo escrito a mano. Ambas con licencia OFL, incluidas en `app/assets/fonts/`.
- Mascota: cafetera italiana con cara, dibujada en código (`app/lib/tema.dart`, `Cafetera`).

## Dónde está cada cosa

- **Código**: `app/` (Flutter). Pantallas en `app/lib/pantallas/`, datos y frases en `app/lib/datos.dart`,
  estado de la partida en `app/lib/estado.dart`, marca y piezas visuales en `app/lib/tema.dart`.
- **Icono y arranque**: imágenes fuente en `app/assets/marca/`; se regeneran con
  `dart run flutter_launcher_icons` y `dart run flutter_native_splash:create` (configuración en `app/pubspec.yaml`).
- **Prototipos HTML** (v1, v2, v3) y maquetas: no se guardaron en la casa; la referencia válida es la app.
