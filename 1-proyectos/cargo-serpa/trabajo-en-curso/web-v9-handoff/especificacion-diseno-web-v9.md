# Cargo Serpa · Web nueva · Especificación de diseño (maqueta V9)

Documento para A&A Informática. Recoge colores, tipografía, medidas, imágenes, movimiento y comportamientos de la maqueta `Maqueta_Cargo_Serpa_V9.html`, para reproducirla con la mayor fidelidad posible. Todos los valores se han medido en el propio archivo (estilos calculados del navegador), no son estimaciones.

**Cómo usar la maqueta.** Ábrela en el navegador y úsala como referencia visual. La barra negra de arriba (pestañas, «Escritorio / Móvil», «Notas del análisis») **no forma parte de la web**: es el marco de la maqueta. Tampoco los avisos «Imagen provisional» ni el aviso emergente (`toast`) que dice «Maqueta: …». Las páginas de la maqueta conviven en un solo archivo; en la web real cada una es su propia URL (ver `paquete-web-cargo-serpa/docs/`).

**Textos.** Todo lo que lleva una marca ámbar «por confirmar» / «por autorizar» **no se publica** hasta que Cargo Serpa lo valide.

## 1. Colores

La web es casi toda neutra. El único color vivo es el rojo, y solo para la acción (botones, enlaces, rutas de los mapas, pequeños detalles).

### Neutros y texto

| Nombre | Valor | Uso |
|---|---|---|
| Pizarra | `#2e3542` | Texto principal sobre claro. Fondo del hero, de las bandas oscuras, de la barra superior, del pie y del bloque de cifras. Botones oscuros |
| Texto secundario | `#4a4d57` | Párrafos y subtítulos (`lede`) sobre fondo claro |
| Texto tenue | `#666a76` | Etiquetas de cifras sobre claro y datos secundarios |
| Fondo base | `#fafaf8` | Fondo de página y de las secciones claras |
| Fondo alterno | `#f1f1ee` | Secciones claras alternas (p. ej. preguntas frecuentes), botón de cerrar del modal |
| Blanco | `#ffffff` | Cabecera, franja de confianza, tarjetas, campos, delegaciones |
| Línea fina (sobre claro) | `rgba(14,15,18,.12)` | Separadores y bordes de tarjetas |
| Línea fina (sobre oscuro) | `rgba(255,255,255,.16)` a `.18` | Separadores en bandas oscuras |
| Gris sobre oscuro 1 | `#e6e7ea` | Párrafo del hero |
| Gris sobre oscuro 2 | `#d4d6dc` | Párrafo en bandas oscuras |
| Gris sobre oscuro 3 | `#c9ccd4` | Barra superior |
| Gris sobre oscuro 4 | `#c3ccd4` | Etiqueta (`eyebrow`) del hero |
| Gris sobre oscuro 5 | `#b4b7c0` | Pie y etiquetas de cifras sobre oscuro |

### Rojo (acción)

| Nombre | Valor | Uso |
|---|---|---|
| Rojo acción | `#d62b43` | Botones principales, subrayado de enlaces, rutas y puntos de los mapas, bloque de llamada final (CTA) |
| Rojo hover | `#b51e35` | Botón principal al pasar el ratón |
| Rojo texto | `#c4172f` | Etiquetas pequeñas y viñetas sobre fondo claro (con mejor contraste que el de acción) |
| Rojo suave | `#ff6b7d` | Etiquetas y títulos pequeños sobre fondo oscuro |
| Texto sobre rojo | `#ffffff` | Texto de los botones y del bloque CTA rojo |
| Sombra del botón | `0 10px 24px rgba(214,43,67,.32)` | Botón principal |

### Estados y marcas

| Nombre | Valor | Uso |
|---|---|---|
| Marca «por confirmar» | fondo `#fff3cf`, borde `#d9a400`, texto `#6b4a00` | Píldora ámbar de pendientes (solo en la maqueta; no se publica) |
| Error de formulario | `#b3202f` | Borde del campo y mensaje |
| «Servicio diario» | `#1b7a46` sobre claro; `#7ee2a8` sobre oscuro; punto `#2fbf6a` | Estado de las líneas internacionales |
| WhatsApp «en línea» | `#2fbf6a` | Punto de estado; burbuja del usuario `#d7f1df` con borde `#bfe5cb` |

### Superposiciones y sombras

| Elemento | Valor |
|---|---|
| Velo de la foto del hero (escritorio) | `linear-gradient(90deg, rgba(46,53,66,.88) 0%, rgba(46,53,66,.66) 55%, rgba(46,53,66,.34) 100%)` |
| Velo de la foto del hero (≤ 900 px) | `linear-gradient(180deg, rgba(46,53,66,.88) 0%, rgba(46,53,66,.80) 100%)` |
| Capa blanca sobre el mapa de las tarjetas | `linear-gradient(90deg, rgba(255,255,255,.94) 0%, rgba(255,255,255,.60) 52%, rgba(255,255,255,0) 82%)` |
| Fondo del modal «Hablar con un asesor» | `rgba(46,53,66,.62)` con desenfoque de 3 px |
| Sombra de las tarjetas del hero | `0 30px 70px rgba(0,0,0,.40)` |
| Sombra del modal | `0 40px 90px rgba(0,0,0,.40)` |
| Sombra del desplegable del menú | `0 24px 50px rgba(46,53,66,.18)` |
| Sombra de cookies y WhatsApp | `0 18px 50px rgba(20,26,32,.22), 0 2px 6px rgba(20,26,32,.08)` |

### Colores del logo (solo para el logo, no para la interfaz)

Rojo `#f53142` y azul `#00007f`.

### Contraste medido (WCAG; AA = 4,5 para texto normal)

| Combinación | Ratio |
|---|---|
| `#2e3542` sobre `#fafaf8` | 11,8 |
| `#4a4d57` sobre `#fafaf8` | 8,1 |
| `#666a76` sobre `#fafaf8` | 5,2 |
| Blanco sobre `#d62b43` | 4,9 |
| `#c4172f` sobre `#fafaf8` / sobre blanco | 5,7 / 6,0 |
| `#ff6b7d` sobre `#2e3542` | 4,5 |
| Blanco sobre `#2e3542` | 12,3 |
| `#b4b7c0` sobre `#2e3542` | 6,1 |
| `#d4d6dc` sobre `#2e3542` | 8,5 |

### Orden de los fondos en la portada

Hero (foto con velo) → franja de confianza (blanco) → internacional (pizarra) → nacional (`#fafaf8`) → cifras (pizarra) → agentes de aduana (`#fafaf8`) → clientes (pizarra) → preguntas frecuentes (`#f1f1ee`) → llamada final (rojo `#d62b43`) → delegaciones (blanco) → pie (pizarra). Las páginas interiores empiezan con un bloque pizarra y siguen alternando claro, gris y pizarra.

## 2. Tipografía

**Una sola familia: Libre Franklin** (Google Fonts), con pila `'Libre Franklin', 'Helvetica Neue', Arial, sans-serif`.

- **Pesos que se usan:** 400, 500, 600 y 700. El 300 aparece en muy pocos textos heredados y puede omitirse sin que se note.
- **Carga recomendada:** `https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@400;500;600;700&display=swap`
- **No cargar IBM Plex Mono.** La maqueta la enlaza por herencia, pero ya no se usa en ningún texto.
- **Sin cursiva.** No hay itálicas en la web.

### Escala

Las medidas con `clamp()` se calculan sobre el ancho del contenedor; en la web real usa el ancho del viewport (`vw`) con los mismos mínimos y máximos. Entre paréntesis, el valor medido a 1440 px y a 390 px.

| Elemento | Tamaño | Peso | Interlínea | Espaciado de letra |
|---|---|---|---|---|
| H1 del hero | `clamp(2.4rem, 3.4cqw + 1rem, 4.3rem)` (65 px / 38 px) | 700 | 1,03 | −0,04 em |
| H1 de páginas interiores | `clamp(2.3rem, 3.8cqw + 1rem, 4.3rem)` (69 px / 37 px) | 700 | 1,05 | −0,04 em |
| H2 de sección | `clamp(2rem, 3cqw + 1rem, 3.4rem)` (54 px / 32 px) | 700 | 1,05 | −0,035 em |
| Título de tarjeta (Nacional / Internacional) | 28 px | 700 | 1,05 | −0,02 em |
| H3 (tarjetas de servicio) | 20,8 px | 600 | 1,25 | −0,005 em |
| Subtítulo (`lede`) | 20 px | 400 | 1,55 | normal |
| Subtítulo del hero | 20,8 px | 400 | 1,55 | normal |
| Texto base | 17 px | 400 | 1,65 | normal |
| Etiqueta de sección (`eyebrow`) | 13 px, mayúsculas | 600 | 1,65 | +0,08 em |
| Etiquetas pequeñas (tarjetas, pie) | 12,5 px, mayúsculas | 600 (pie: 400) | 1,65 | +0,08 em (pie +0,16 em) |
| Botones | 16 px (cabecera 15 px) | 600 | 1,2 | normal |
| Menú | 15,5 px | 500 | 1,65 | normal |
| Cifras grandes | `clamp(2rem, 2.5cqw + .9rem, 3.3rem)` (50 px / 32 px) | 700 | 1 | −0,04 em |
| Etiqueta de cifra | 14 px | 400 | 1,35 | normal |
| Plazos «18 h → 10 días» | `clamp(2.6rem, 3cqw + 1.2rem, 4rem)` (62 px / 42 px) | 700 | 1,1 | −0,04 em |
| Pregunta frecuente | 19,2 px | 600 | 1,35 | normal |
| Etiqueta de formulario | 14,5 px | 600 | 1,65 | normal |
| Texto del campo | 16 px | 400 | 1,65 | normal |
| Texto del pie | 14,9 px | 400 | 1,65 | normal |
| Marca «por confirmar» | 12 px, mayúsculas | 400 | 1,55 | +0,04 em |

Nada baja de 12 px.

## 3. Medidas y maquetación

| Concepto | Valor |
|---|---|
| Ancho de contenido | máx. 1180 px (1092 px útiles + gutter de 44 px por lado). La cabecera llega a 1320 px |
| Gutter lateral | `clamp(20px, 4vw, 44px)` |
| Sección | padding vertical `clamp(72px, 9.5vw, 132px)`; compacta `clamp(56px, 7vw, 96px)` |
| Hero | padding `clamp(72px, 9vw, 130px)` arriba y `clamp(80px, 9vw, 128px)` abajo |
| Cabecera | barra superior 43 px + barra principal 79 px = 122 px. En móvil 74 px y sin barra superior |
| Logo | 143 × 46 px en escritorio; 118 × 38 px en móvil |
| Tarjetas Nacional / Internacional | 422 × 241 px, separación de 16 px, rejilla de 2 columnas (máx. 860 px); 1 columna en ≤ 700 px (350 × 226 px) |
| Tarjetas de servicio | padding 34 / 32 / 36 px, separación de 20 px |

### Radios

Tarjetas y bloques **22 px**; botones, chips, marcas y campo de seguimiento **999 px** (píldora); campos de formulario **14 px**; desplegable del menú **16 px**; modal **26 px** (en móvil, solo las esquinas superiores).

### Puntos de corte

Se miden sobre el ancho de la página (en la maqueta con *container queries*; en la web real, `@media (max-width: …)` con los mismos valores):

| Ancho | Qué cambia |
|---|---|
| ≤ 1060 px | Menú hamburguesa; se ocultan el menú y el botón de la cabecera |
| ≤ 1000 px | Las cifras pasan de 5 columnas a 3 |
| ≤ 900 px | Velo vertical sobre la foto del hero |
| ≤ 820 px | WhatsApp se oculta mientras el aviso de cookies está abierto |
| ≤ 700 px | Tarjetas del hero a 1 columna; cifras a 2 columnas; plazos en vertical |
| ≤ 640 px | Barra fija inferior «Llamar / Solicitar presupuesto»; cookies a todo el ancho; WhatsApp sube |
| ≤ 540 px | El modal «Hablar con un asesor» sale como hoja desde abajo |
| 520 a 860 px | Ajustes menores de rejillas, tablas y pie (ver el CSS de la maqueta) |

Las tablas anchas (p. ej. en Península–Canarias) van dentro de un contenedor con scroll horizontal.

## 4. Componentes

### Botones

| Variante | Estilo |
|---|---|
| Principal | Fondo `#d62b43`, texto blanco, 16 px / 600, padding 14 × 28 px, alto mínimo 52 px, píldora, sombra roja. Hover `#b51e35`. En cabecera: padding 12 × 22 px, alto mínimo 46 px, 15 px |
| Secundario sobre oscuro | Transparente, borde 2 px `rgba(255,255,255,.8)`, texto blanco. Hover fondo `rgba(255,255,255,.14)` y borde blanco |
| Secundario sobre claro | Transparente, borde 2 px `#2e3542`, texto `#2e3542`. Hover fondo `#2e3542` y texto blanco |
| Blanco (bandas pizarra) | Fondo blanco, texto `#2e3542`. Hover `#f1f1ee` |
| En el bloque rojo (CTA) | Fondo `#2e3542`, texto blanco, sombra `0 10px 24px rgba(0,0,0,.2)`. Hover negro |
| Enlace con flecha | 600, subrayado de 2 px `#d62b43`; zona táctil ampliada ±9 px |

### Tarjetas

- **Nacional / Internacional (hero):** fondo blanco, radio 22 px, padding 28 / 30 / 26 px, sombra `0 30px 70px rgba(0,0,0,.4)`. Etiqueta en `#c4172f`, título 28 px / 700 en `#2e3542`, párrafo 15,4 px en `#4a4d57`, enlace 15,2 px / 600 con subrayado rojo. Al pasar el ratón sube 6 px. Llevan un mapa vectorial de fondo (ver apartado 5).
- **Servicio:** fondo blanco, borde 1 px `rgba(14,15,18,.12)`, radio 22 px, sin sombra. Hover: borde `#2e3542`.
- **Franja de confianza:** fondo blanco, cuatro columnas separadas por líneas finas; título 18,4 px / 700, texto 15,2 px en `#4a4d57`.

### Formularios

- **Campo:** fondo blanco, borde 1 px `#c4c7cf`, radio 14 px, padding 14 px, 16 px de texto.
- **Foco:** borde `#2e3542` y halo `0 0 0 3px rgba(214,43,67,.25)`.
- **Error:** borde `#b3202f` y mensaje de 13,5 px debajo del campo.
- **Etiqueta:** encima del campo, 14,5 px / 600. Los obligatorios llevan asterisco rojo.
- **Foco visible general:** `outline: 3px solid #2e3542; outline-offset: 3px`.

### Otros

- **Preguntas frecuentes:** acordeón con `<details>`; línea superior de 2 px `#2e3542`, separadores finos, icono «+» rojo que gira 45° al abrir.
- **Cookies:** tarjeta flotante abajo a la izquierda, ancho máx. 396 px, radio 22 px; botones Rechazar / Aceptar y enlace Configurar (Necesarias, siempre activas; Analítica).
- **WhatsApp:** botón circular de 62 px abajo a la derecha, con burbuja «¿Hablamos por WhatsApp?» y tarjeta de cinco opciones (presupuesto, aduanas, carga especial, seguimiento, otra consulta) que prepara un mensaje.
- **Barra fija móvil:** `Llamar` + `Solicitar presupuesto` (rojo), 16 px / 600, padding 16 px.

## 5. Fotos y gráficos

| Archivo (en `assets/`) | Detalle |
|---|---|
| `hero-inicio.jpg` | Foto del hero de la portada: ala de avión y nubes. **1439 × 893 px, JPEG, 107 KB. Provisional** (es la portada de la presentación corporativa 2025). **Es idéntica a la que ya incluye vuestro paquete** (`web/assets/img/hero-inicio.jpg`) |
| `logo-cargo-serpa.png` | Logo, PNG con transparencia, 374 × 120 px. Idéntico al del paquete |
| `favicon.png` | PNG de 120 × 114 px. Conviene generar un conjunto completo (ICO, 32/180/192/512) |
| `mapa-mundo.svg` | Mapa del mundo de la tarjeta Internacional (36 KB) |
| `mapa-espana.svg` | Mapa de España con Canarias en recuadro, de la tarjeta Nacional (10 KB) |

**Tratamiento de la foto del hero:** `object-fit: cover`, filtro `grayscale(.2) contrast(1.03) brightness(1)` y el velo del apartado 1. Es decorativa (`alt=""`, `aria-hidden`).

**Recomendaciones:** la foto está en baja resolución para pantallas grandes y Retina. Cuando haya foto definitiva, entregar mínimo 2560 px de ancho, y servir WebP o AVIF además del JPEG. El logo conviene en SVG.

**Mapas:** son SVG en línea. Estilo de las líneas: trazo `#2e3542` con distintos niveles de transparencia para el contorno de países; rutas en `rgba(214,43,67,.5)` de 1 px; puntos y rayos en `#d62b43`. El mapa del mundo lleva 12 puntos unidos por una red de arcos (Madrid, Alemania, Canarias, EE. UU., México, Sudamérica, África occidental y del sur, Emiratos, India, China, Australia). El de España parte de Madrid hacia Barcelona, Valencia, Sevilla, Málaga, Bilbao, A Coruña, Mallorca, Andorra, Lisboa y tres puntos de Canarias.

**Iconos:** solo dos, ambos símbolos SVG dentro del HTML (`cookieIco` y `waIco`).

## 6. Movimiento

| Efecto | Detalle |
|---|---|
| Entrada de las tarjetas del hero | Aparecen subiendo 14 px, 0,6 s, `cubic-bezier(.2,.7,.2,1)`; la segunda con 0,12 s de retraso |
| Hover de las tarjetas del hero | Suben 6 px y el mapa se amplía a 1,5× en 0,8 s |
| Rayos de los mapas | Un trazo corto recorre cada línea en 3,4 s, en bucle y con retrasos escalonados |
| Pulso del punto central | 2,8 s, en bucle |
| Cifras de la portada | Cuentan de 0 al valor en 1,4 s con desaceleración, al entrar en pantalla (umbral 40 %). Formato con punto de millar |
| Aviso de cookies | Entrada de 0,45 s |
| Modal «Hablar con un asesor» | Entrada de 0,28 s |
| Transiciones de color y sombra | De 0,18 s a 0,25 s |
| Scroll | Suave (`scroll-behavior: smooth`) |

**Movimiento reducido:** con `prefers-reduced-motion: reduce` se quitan las animaciones; las cifras aparecen ya con su valor final.

## 7. Comportamientos

- **Idioma:** conmutador ES / EN en la barra superior. En la maqueta los textos en inglés están en los atributos `data-en`. En la web real, páginas separadas `/es/` y `/en/` con `hreflang`.
- **Menú:** «Nacional» es un desplegable (Envíos nacionales, Marítimo a Canarias, Logística en las islas). Se cierra con Escape y al pulsar fuera.
- **Portada:** dos botones, «Solicitar presupuesto» y «Hablar con un asesor».
- **Hablar con un asesor:** ventana modal con dos opciones. (1) **Llamar ahora**: número de la central **+34 91 329 03 18**, botón «Llamar» (`tel:`) y «Copiar número». (2) **Te llamamos nosotros**: nombre (obligatorio), teléfono (obligatorio, mínimo 9 dígitos), empresa, mejor momento (cuando sea / mañana / tarde) y casilla de privacidad (obligatoria). Se cierra con Escape, con la × o pulsando fuera; el foco queda atrapado dentro mientras está abierta. Al enviar muestra «Recibido».
- **Formulario de presupuesto:** obligatorios nombre, correo, tipo de servicio y la casilla de privacidad; opcionales empresa, teléfono, origen, destino, mercancía, bultos y observaciones. Valida en el navegador y muestra el error bajo cada campo.
- **Seguimiento de envíos:** campo y botón «Buscar». Falta la URL real del seguimiento.
- **Cookies:** Consent Mode v2 con todo denegado por defecto (ver el paquete). Necesarias siempre activas; analítica opcional.
- **Accesibilidad:** `lang` en `<html>`, un solo H1 por página, atributos `aria` en menús y diálogos, foco visible, objetivos táctiles de 44 px o más, y soporte de `prefers-reduced-motion`.

## 8. Qué no hay que copiar

- La barra negra de maqueta y sus controles.
- Las «Notas del análisis» (ocultas por defecto) y el `toast` de avisos.
- La etiqueta «Imagen provisional».
- La navegación por `data-go` (simula varias páginas en un solo archivo).
- Los envíos de los formularios: en la maqueta **no envían nada**.

## 9. Pendiente de conectar o confirmar

- **Formulario de presupuesto y «Te llamamos nosotros»:** endpoint y destino de los datos (decide Cargo Serpa).
- **Número real de WhatsApp** y **URL del seguimiento de envíos.**
- **Horario de la central** y **plazo de respuesta a las llamadas.**
- **Foto del hero definitiva** y logos de clientes (cada empresa debe autorizarlos).
- **Textos marcados en ámbar:** unos 55 en español, repartidos por todas las páginas (y los mismos en inglés), entre ellos Ceuta y Melilla, Andorra, plazos por servicio, ubicaciones y condiciones. Se identifican por la clase `.tbc` en el HTML.
- **Cifras:** «+60.000 envíos» procede del CRM (12 meses hasta el 30/09/2026) y está **por comprobar** antes de publicar.
- **Datos de contacto y delegaciones:** están en el HTML (siete delegaciones, con teléfonos y correos confirmados).

Lo demás del paquete (`docs/seo-por-pagina.md`, `mapa-redirecciones.md`, `medicion-ga4-gtm.md`, `checklist-publicacion.md`) sigue vigente: la V9 solo cambia el diseño.
