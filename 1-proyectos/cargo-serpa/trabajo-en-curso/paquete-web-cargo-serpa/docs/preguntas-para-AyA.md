# Preguntas para A&A Informática (contestar antes de publicar)

## El GES y el acceso de trabajadores y clientes
1. ¿El GES comparte código con la web actual o es una aplicación independiente que simplemente cuelga de ella?
2. ¿Qué direcciones usa? (`/login.aspx` y cuáles más: listar todas).
3. ¿Entran también clientes? **Sí** (dato de Cargo Serpa). ¿Hay una "oficina virtual" distinta del acceso de trabajadores?
4. ¿Puede el GES quedarse donde está mientras la web nueva se publica en la raíz, o conviene moverlo a un subdominio (por ejemplo `gestion.cargoserpa.es`)?
5. ¿Cómo se hace la migración sin que nadie se quede sin acceso un solo día?
6. ¿Se puede excluir el GES del código de analítica de la web comercial? (así las visitas de trabajadores y clientes no ensucian los datos de captación).

## Servidor y despliegue
7. ¿Pueden publicar archivos estáticos en el servidor actual (IIS), o hace falta otro hosting? ¿Qué sistema operativo y qué parches tiene el servidor? (IIS 8.5 / Windows Server 2012 R2 sin soporte desde 10/10/2023).
8. ¿Se puede activar HTTPS en todo, redirección a una sola versión (con o sin www) y quitar las cabeceras de versión (`Server`, `X-AspNet-Version`, `X-Powered-By`)?
9. ¿Cómo llega hoy el formulario de contacto al correo y puede el endpoint nuevo hacer lo mismo?
10. ¿Qué dominio canónico prefieren, con www o sin?

## Medición y búsqueda
11. ¿Quién es el propietario de la cuenta de GA4 (propiedad 366267754)? Cargo Serpa necesita rol de editor o administrador.
12. ¿Tienen acceso a Search Console? La propiedad `https://www.cargoserpa.es/` tiene datos; la de dominio no está verificada.
13. ¿Pueden instalar Google Tag Manager y activar Consent Mode v2?

## Dominio y DNS (Loading)
14. Verificar la propiedad de dominio `cargoserpa.es` en Search Console con un registro TXT. Lo gestiona Loading.
15. Alta del dominio en Bing Webmaster Tools y envío del `sitemap.xml`.
