# Estado · Mejora de la web cargoserpa.es

Última actualización: 09/10/2026. Reconstruido desde la sesión de Claude "Mejora de diseño web" (25/09 al 04/10/2026).

## Qué es

Mejorar la web actual de Cargo Serpa (ASP.NET Web Forms en Plesk/IIS, montada por **ayainformatica.es**) **sin rehacerla de cero**.
La web no vende: su trabajo es generar solicitudes de cotización y llamadas. Vara de medir de la auditoría: un cliente
activado más al mes desde la web ≈ 180.000 €/año de facturación potencial (techo teórico, sin descontar margen).

## Documentos (todos en esta carpeta)

| Archivo | Qué es | Estado |
|---|---|---|
| `auditoria-tecnica-2026-09-25.md` | Auditoría técnica de Alex (9 hallazgos y plan priorizado) | Hecha |
| `fase-1-paquete-agencia.md` | Correcciones de contenido y archivos nuevos para la agencia | Borrador; **no enviado**; faltan datos reales |
| `faq-visibilidad-ia.md` | Estudio de visibilidad en IA y 7 FAQ propuestas | Pendiente de visto bueno de Alex |

## Lo más importante de la auditoría

Críticos: servidor sin soporte (IIS 8.5 / Windows Server 2012 R2, cabeceras que exponen versiones); cookies de analítica antes
del consentimiento (RGPD/AEPD); mapas que apuntan a la competencia (Redur, DHL) y datos de contacto contradictorios.
Altos: analítica rota (Universal Analytics muerta, el formulario no se mide); 8,4 MB y 128 peticiones en la home; SEO básico
ausente (sin robots.txt ni sitemap). Medios: restos de plantilla, ninguna forma de pedir cotización, accesibilidad (EAA).
Decisión estructural abierta: **parchear o rehacer** (si se rehace, mantener el login y la oficina virtual de clientes).

## Qué falta (en orden)

1. **Tabla única validada de delegaciones** (dirección, teléfonos, email, enlace de Google Business). Desbloquea mapas y contacto.
2. **Plazo real de tránsito** Madrid/Barcelona–Canarias.
3. Visto bueno de Alex a las **7 FAQ**.
4. Enviar el paquete Fase 1 a la agencia (puntos 1 a 4 se pueden mandar ya; el 5 espera la tabla).
5. Corregir las fichas de **Google Business** (categorías).
6. Decidir con dirección: parchear o rehacer.

## La maqueta nueva (NO está guardada)

El 04/10/2026 Alex mostró una **"Maqueta web Cargo Serpa · Fase 1"**: un único HTML autocontenido, con inicio, nacional,
Península–Canarias, internacional y servicios, en español e inglés, con formularios de consulta. **No está en ningún repo**:
solo vive como archivo subido a esa conversación. El repo `alexsantanagrowth` solo contiene un README de una línea.
Pendiente: que Alex vuelva a subir el archivo para guardarlo en esta carpeta. No se ha creado ningún HTML nuevo.

## Reglas

- No ejecutar ni crear HTML/código sin OK de Alex. Mantener etiquetas [VERIFICADO], [PROBABLE], [POR COMPROBAR].
- No enviar formularios ni tocar el login de la web sin OK. Cada hallazgo se conecta con negocio (leads, confianza, riesgo).
- No inventar datos de delegaciones, plazos ni cifras.
