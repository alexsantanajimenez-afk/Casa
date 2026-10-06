# Auditoría técnica de cargoserpa.es (25/09/2026, Alex Santana) · resumen y cruce con la V5

Texto completo en poder de Alex. Sin acceso a GA4, Search Console ni servidor. Etiquetas originales: [VERIFICADO], [PROBABLE], [POR COMPROBAR].
Cifras de contexto de la auditoría: facturación media de cliente ~15.000 € (vigente) y vida media de 10,2 meses (**ya descartada: la cifra vigente es 12,1 meses**, ver `decisiones.md`).

## Hallazgos
| # | Gravedad | Hallazgo | ¿Lo cubre la V5? |
|---|---|---|---|
| 1 | Crítico | Servidor IIS 8.5 (Windows Server 2012 R2 sin soporte desde 10/10/2023) y cabeceras con versiones | No: es hosting. Si se publica la V5 en otro sitio, desaparece |
| 2 | Crítico | Cookies de analítica antes del consentimiento; banner sin rechazar; aviso de privacidad obsoleto | Parcial: la V5 tiene banner con Aceptar/Rechazar/Configurar. Falta CMP real, Consent Mode v2 y texto legal |
| 3 | Crítico | Mapas que apuntan a la competencia (Redur, DHL) y datos de contacto distintos entre home y contacto | No: falta la tabla validada de delegaciones |
| 4 | Alto | Analítica rota: solo UA (muerta desde 01/07/2023); GA4 `G-C2TWFJZ8Q1` colgado de UA; sin GTM ni eventos de lead | No: se hace al publicar |
| 5 | Alto | Home de 8,4 MB y 128 peticiones, +50 scripts, dos sliders, vídeo de 3,8 MB | Sí en la V5 (una sola página ligera, aunque con imágenes en base64) `[POR COMPROBAR]` |
| 6 | Alto | Sin robots.txt ni sitemap; title y description iguales; sin canonical, lang ni schema; 4 H1; URLs duplicadas | Parcial: la V5 trae description y JSON-LD, pero faltan title por página, canonical, robots, sitemap y URLs limpias |
| 7 | Medio | Restos de plantilla ("HTML5", "CSS3"), barras de progreso sin sentido, plazos contradictorios, erratas | Sí: textos nuevos y plazos unificados (24-48 h aéreo, desde 72 h marítimo) |
| 8 | Medio | Sin formulario de cotización, CTA ni WhatsApp; sin tracking; sin LinkedIn | Sí: formulario con tipo de servicio, CTA fijo y WhatsApp. Faltan caja de tracking y enlace a LinkedIn |
| 9 | Medio | Accesibilidad: 35 de 36 imágenes sin alt, sin lang | Parcial: `lang` ya cambia con el botón; faltan los `alt` |

## Cosas a corregir en lo ya hecho a raíz de la auditoría
- **Teléfonos en la FAQ 15 y en la maqueta:** la auditoría muestra que home y contacto no coinciden (Las Palmas 928 700 984 frente a 928 688 074; Fuerteventura 928 543 377 en home frente a un número imposible en contacto). La V5 pone el mismo 928 700 984 en Las Palmas y Fuerteventura. **No publicar** hasta tener la tabla validada.
- **GA4:** el ID ya existe (`G-C2TWFJZ8Q1`). Falta saber quién tiene acceso y si recibe datos.
- **Decisión 9 (parchear o rehacer):** la V5 apunta a rehacer. Mantener el login y la oficina virtual de clientes.
