# Checklist de publicación

## Antes
- [ ] Tabla de delegaciones validada (`delegaciones-a-validar.md`).
- [ ] Textos "por confirmar" resueltos o retirados.
- [ ] Respuestas a `preguntas-para-AyA.md`, sobre todo el GES.
- [ ] Páginas legales listas (aviso legal, privacidad, cookies) con texto actualizado (ya no existe el "fichero inscrito ante la AEPD").
- [ ] Endpoint `/api/solicitud` implementado y probado con el OK de Cargo Serpa.
- [ ] GTM instalado, Consent Mode v2 probado, eventos verificados con Tag Assistant.
- [ ] Redirecciones probadas (`mapa-redirecciones.md`), sin tocar `/login` ni el GES.
- [ ] Dominio canónico decidido (www o sin www) y HTTPS en todo.

## El día
- [ ] Subir `web/` a la raíz y activar las redirecciones.
- [ ] Comprobar `sitemap.xml` y `robots.txt` en la raíz.
- [ ] Enviar el sitemap a Search Console y a Bing Webmaster Tools.
- [ ] Probar en móvil y ordenador, español e inglés.
- [ ] Comprobar que el GES y la oficina virtual funcionan.

## Después (primeras 2 semanas)
- [ ] Search Console → Páginas: las URLs nuevas se indexan; las viejas desaparecen.
- [ ] GA4: `generate_lead` y `click_phone` llegan como eventos clave.
- [ ] Core Web Vitals en móvil (Lighthouse / PageSpeed).
- [ ] Corregir fichas de Google Business y directorios con la tabla de delegaciones.
- [ ] Repetir la prueba de visibilidad en IAs (15 preguntas) y compararla con la base del 06/10/2026 (9 de 46).
