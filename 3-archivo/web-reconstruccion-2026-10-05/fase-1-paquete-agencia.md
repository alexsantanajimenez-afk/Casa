# Fase 1: paquete de correcciones para la agencia (25/09/2026)

> Borrador generado en la sesión "Mejora de diseño web". Son cambios de contenido y archivos nuevos, sin tocar
> plantilla ni CSS, pensados para pasarlos a la agencia (ayainformatica.es, según la meta author de la web).
> **No se ha enviado a la agencia** (no consta). Los puntos marcados **[NECESITA DATO REAL]** siguen sin resolver.
> Claude no pudo acceder a cargoserpa.es desde su entorno; se apoyó en la auditoría.

---


### 1. Archivos nuevos (crear y subir a la raíz del sitio)

**`/robots.txt`**
```
User-agent: *
Allow: /
Sitemap: https://cargoserpa.es/sitemap.xml
```

**`/sitemap.xml`** (ajustar `<lastmod>` a la fecha real de publicación; añadir/quitar URLs según el inventario final del punto 4 del audit — "qué otras páginas existen")
```xml
<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url><loc>https://cargoserpa.es/</loc><lastmod>2026-09-25</lastmod><priority>1.0</priority></url>
  <url><loc>https://cargoserpa.es/contacto.aspx</loc><lastmod>2026-09-25</lastmod><priority>0.8</priority></url>
  <url><loc>https://cargoserpa.es/transporte.aspx</loc><lastmod>2026-09-25</lastmod><priority>0.8</priority></url>
  <url><loc>https://cargoserpa.es/servicios-especiales.aspx</loc><lastmod>2026-09-25</lastmod><priority>0.8</priority></url>
</urlset>
```
Enviarlo después a Search Console.

---

### 2. Cabecera `<head>` — aplicar en cada página (title/description únicos por página)

```html
<html lang="es">
...
<title>[TÍTULO ÚNICO POR PÁGINA — ver tabla abajo]</title>
<meta name="description" content="[DESCRIPCIÓN ÚNICA POR PÁGINA — ver tabla abajo]" />
<link rel="canonical" href="https://cargoserpa.es/[URL-CANÓNICA-SIN-DUPLICAR]" />
```
Quitar `<meta name="keywords">` (obsoleto, no aporta y puede quedarse desactualizado).

| Página | Title | Meta description |
|---|---|---|
| Home | Cargo Serpa · Transporte Península–Canarias para empresas | Transporte de mercancías entre Península y Canarias: marítimo, aéreo, courier y aduanas. Cotización rápida para empresas. |
| Contacto | Contacto · Cargo Serpa | Delegaciones en Madrid, Barcelona, Las Palmas, Lanzarote y Fuerteventura. Pide tu cotización de transporte Península–Canarias. |
| Transporte | Servicios de transporte · Cargo Serpa | Transporte marítimo, aéreo y grupaje entre Península y Canarias. Plazos, tarifas y seguimiento para empresas. |
| Servicios especiales | Servicios especiales · Cargo Serpa | Agente de aduanas, DUA y logística especial para envíos entre Península y Canarias. |

*(Textos de ejemplo — el copy final lo debería revisar/aprobar Cargo Serpa, yo he priorizado que cada uno sea único y describa la página real.)*

---

### 3. Retirar restos de plantilla (home)

- Slider: sustituir los textos "HTML5" / "CSS3" y las imágenes demo (`rs-slider1-html5-*`, `rs-slider3-pig*`) por contenido real de Cargo Serpa (foto propia + mensaje de servicio). **[NECESITA CONTENIDO REAL: qué frase/imagen usar]**
- Barras de progreso "Península e islas 90% / Internacional 40% / Península 58%": si no representan una métrica real, eliminarlas. Si quieren mantener el bloque, sustituir por algo verificable (ej. años de experiencia, nº de envíos/año) o quitarlo.
- Tarjetas de servicio con título duplicado y enlace `#`: cada tarjeta debe enlazar a su página real (`/transporte.aspx`, `/servicios-especiales.aspx`, etc.) y tener título distinto.
- Eliminar/despublicar `/index.html` (resto de plantilla sin contenido) y comprobar que no quede enlazado desde la miga de pan.
- Copyright del pie: cambiar "2021" por el año actual dinámico (`<%= DateTime.Now.Year %>` en ASP.NET) para que no vuelva a quedar desfasado.

### 4. Corregir texto e H1 duplicados

- Dejar **un solo `<h1>`** por página (home y servicios-especiales tienen 4 cada una); el resto pasan a `<h2>`/`<h3>`.
- Plazos de carga aérea — unificar el dato correcto en home y `/transporte.aspx` (ahora dice 48-72h en una y "24 a 48 horas" / "48 ó 72 horas" en la otra). **[NECESITA DATO REAL: cuál es el plazo correcto]**
- Erratas — buscar y reemplazar literal:

| Buscar | Reemplazar |
|---|---|
| intrnacional | internacional |
| Leer mas | Leer más |
| Tambien | También |
| Logistica | Logística |
| Mercancias | Mercancías |
| 20'' / 40'' | 20' / 40' (pies, no pulgadas) |

### 5. Mapas y datos de contacto

Los iframes actuales apuntan a fichas de la competencia (Redur, DHL) o a sitios erróneos (aeropuertos). Esto **no lo puedo corregir sin el dato real**: necesito, por cada delegación, el enlace de "Compartir → Insertar un mapa" de su propia ficha de Google Business.

**[NECESITA DATO REAL — pedir a Cargo Serpa antes de enviar a la agencia]**: una tabla única con, por delegación (Madrid, Barcelona, Las Palmas, Lanzarote, Fuerteventura, Baleares): dirección exacta, teléfono, email, y el link de embed de Google Business. Ahora mismo home y contacto se contradicen entre sí (teléfonos y direcciones distintos), así que hace falta fijar un único valor por delegación antes de tocar el código — si no, corregimos un archivo y el otro sigue mal.

En cuanto tengas esa tabla te preparo el bloque HTML de los 6 iframes + el texto de contacto, listo para pegar en home y en contacto.

---

### Cómo se lo mandas a la agencia
Este bloque (puntos 1-4) ya se puede enviar tal cual como ticket/encargo a ayainformatica.es — son cambios de texto y archivos nuevos, sin tocar plantilla ni estilos, así que deberían poder aplicarlo rápido. El punto 5 (mapas/contacto) lo completamos en cuanto tengas la tabla validada.

¿Quieres que te prepare esto como un documento para enviar directamente, o te vale tal cual está aquí para copiar?