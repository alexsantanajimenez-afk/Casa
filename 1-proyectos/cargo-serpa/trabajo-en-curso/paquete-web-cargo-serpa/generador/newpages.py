# Contenido de las 3 páginas nuevas (ES, EN). Solo datos de la maqueta y de las FAQ; lo dudoso lleva <span class="tbc">.
T='<span class="tbc">%s</span>'
def tb(es,en): return (T%es, T%en)
def checks(items):
    es='<ul class="checks">'+''.join('<li>'+a+'</li>' for a,b in items)+'</ul>'
    en='<ul class="checks">'+''.join('<li>'+b+'</li>' for a,b in items)+'</ul>'
    return es,en
def faq(items):
    es='<div class="faq">'+''.join(f'<details><summary>{q[0]}</summary><p>{q[2]}</p></details>' for q in items)+'</div>'
    en='<div class="faq">'+''.join(f'<details><summary>{q[1]}</summary><p>{q[3]}</p></details>' for q in items)+'</div>'
    return es,en
def page(hero, sections, cta):
    """hero=(eyebrow,pill,h1,lede) como tuplas (es,en); sections lista de (kind,...)"""
    out=[]
    for L in (0,1):
        h=hero
        html=f'<section class="page"><div class="page-hero"><div class="wrap"><p class="eyebrow" style="color:var(--fog)">{h[0][L]}</p><span class="pill">{h[1][L]}</span><h1>{h[2][L]}</h1><p class="lede">{h[3][L]}</p><div class="btn-row" style="margin-top:30px"><button class="btn btn-light" data-go="presupuesto">{["Solicitar presupuesto","Request a quote"][L]}</button><a class="btn btn-line" href="tel:+34913290318">{["Llamar","Call"][L]}</a></div></div></div>'
        alt=False
        for s in sections:
            if s[0]=='split':
                _,eb,h2,lede,chk=s
                html+=f'<section class="sec{" sec-alt" if alt else ""}"><div class="wrap split"><div><p class="eyebrow">{eb[L]}</p><h2>{h2[L]}</h2><p class="lede">{lede[L]}</p></div>{chk[L]}</div></section>'
            elif s[0]=='faq':
                _,eb,h2,lede,fq=s
                html+=f'<section class="sec{" sec-alt" if alt else ""}"><div class="wrap"><div class="sec-head"><div><p class="eyebrow">{eb[L]}</p><h2>{h2[L]}</h2></div><p class="lede">{lede[L]}</p></div>{fq[L]}</div></section>'
            elif s[0]=='cols':
                _,eb,h2,lede,cols=s
                cs=''.join(f'<div class="col"><p class="eyebrow">{c[0][L]}</p><h3>{c[1][L]}</h3><p>{c[2][L]}</p></div>' for c in cols)
                html+=f'<section class="sec{" sec-alt" if alt else ""}"><div class="wrap"><div class="sec-head"><div><p class="eyebrow">{eb[L]}</p><h2>{h2[L]}</h2></div><p class="lede">{lede[L]}</p></div><div class="cols">{cs}</div></div></section>'
            alt=not alt
        html+=f'<section class="cta"><div class="wrap"><div><h2 style="color:#fff">{cta[0][L]}</h2></div><div><p>{cta[1][L]}</p><div class="btn-row" style="margin-top:20px"><button class="btn btn-light" data-go="presupuesto">{["Solicitar presupuesto","Request a quote"][L]}</button></div><a class="tel" href="tel:+34913290318">{["o llama al +34 91 329 03 18","or call +34 91 329 03 18"][L]}</a></div></div></section></section>'
        out.append(html)
    return out

MAR=page(
 (("Península–Canarias · Marítimo","Mainland–Canary Islands · Sea freight"),("Desde 1992","Since 1992"),
  ("Transporte marítimo a Canarias: LCL y FCL.","Sea freight to the Canary Islands: LCL and FCL."),
  ("Carga consolidada o contenedor completo desde la Península, con la aduana resuelta por nuestros Agentes de Aduana y un único responsable de principio a fin.","Consolidated cargo or a full container from the Mainland, with customs handled by our customs agents and one single owner from start to finish.")),
 [('split',("Cómo funciona","How it works"),("Dos formas de enviar por mar.","Two ways to ship by sea."),
   ("Elige según volumen y plazo. En las dos coordinamos recogida, despacho y entrega.","Choose by volume and lead time. In both we coordinate pick-up, clearance and delivery."),
   checks([("<b>Marítimo LCL.</b> Salida los viernes desde el puerto de Cádiz/Huelva. Entrega lunes y martes, desde 72 h.","<b>Sea freight LCL.</b> Departs on Fridays from the port of Cádiz/Huelva. Delivery on Monday and Tuesday, from 72 h."),
           ("<b>Marítimo FCL.</b> Desde cualquier puerto de la península, con las principales navieras y el menor tránsito.","<b>Sea freight FCL.</b> From any mainland port, with the main shipping lines and the shortest transit."),
           ("<b>Carga.</b> Seca, IMO (peligrosa), refrigerada y perecedera, sobredimensionada. "+T%"clases y límites por confirmar","<b>Cargo.</b> Dry, IMO (dangerous), refrigerated and perishable, oversized. "+T%"classes and limits to be confirmed"),
           ("<b>Aduana.</b> Preparamos y presentamos el DUA, como Agentes de Aduana.","<b>Customs.</b> We prepare and file the DUA, as customs agents.")])),
  ('faq',("Preguntas frecuentes","Frequently asked questions"),("Transporte marítimo a Canarias.","Sea freight to the Canary Islands."),("Respuesta primero, detalle después.","Answer first, detail after."),
   faq([("¿Cuánto tarda el transporte marítimo a Canarias?","How long does sea freight to the Canary Islands take?","El marítimo LCL tarda desde 72 h: sale los viernes desde Cádiz/Huelva y se entrega lunes y martes. El plazo exacto se confirma con el presupuesto. "+T%"condiciones por confirmar","LCL sea freight takes from 72 h: it departs on Fridays from Cádiz/Huelva and is delivered on Monday and Tuesday. The exact lead time is confirmed with the quote. "+T%"conditions to be confirmed"),
        ("¿Qué diferencia hay entre LCL y FCL?","What is the difference between LCL and FCL?","LCL es para cargas consolidadas, que comparten contenedor. FCL es para cargas completas, con contenedor propio. Los dos incluyen recogida, despacho y entrega.","LCL is for consolidated loads that share a container. FCL is for full loads, with a dedicated container. Both include pick-up, clearance and delivery."),
        ("¿Podéis transportar mercancía peligrosa o refrigerada por mar?","Can you ship dangerous or refrigerated goods by sea?","Sí. Transportamos carga IMO y mercancía refrigerada y perecedera. Necesitamos el número ONU y la ficha de seguridad, o el tipo de producto, la temperatura y la fecha límite. "+T%"clases admitidas por confirmar","Yes. We carry IMO cargo and refrigerated and perishable goods. We need the UN number and safety data sheet, or the product type, temperature and deadline. "+T%"accepted classes to be confirmed"),
        ("¿Quién tramita la aduana en un envío marítimo a Canarias?","Who handles customs on a sea shipment to the Canary Islands?","Nosotros. Preparamos y presentamos el DUA como Agentes de Aduana, y para enviar a Canarias hace falta factura de la mercancía.","We do. We prepare and file the DUA as customs agents, and an invoice for the goods is needed to ship to the Canary Islands.")]))],
 (("¿Envías por mar a Canarias?","Shipping to the Canary Islands by sea?"),("Dinos origen, destino y mercancía. Te respondemos con precio y plazo.","Tell us origin, destination and goods. We reply with price and lead time.")))

ISL=page(
 (("Canarias · Logística","Canary Islands · Logistics"),("Desde 1992","Since 1992"),
  ("Logística y transporte en Tenerife y el resto de Canarias.","Logistics and transport in Tenerife and the rest of the Canary Islands."),
  ("Oficinas propias en las islas, líneas regulares desde la Península y aduana resuelta por nuestros Agentes de Aduana.","Our own offices on the islands, regular lines from the Mainland and customs handled by our customs agents.")),
 [('split',("Presencia en las islas","Presence on the islands"),("Delegaciones propias, no intermediarios.","Our own offices, no intermediaries."),
   ("Recogemos en la Península y entregamos en las islas con un solo responsable.","We pick up on the Mainland and deliver on the islands with one single owner."),
   checks([("<b>Las Palmas</b> (Telde, Gran Canaria).","<b>Las Palmas</b> (Telde, Gran Canaria)."),
           ("<b>Tenerife</b> (Santa Cruz de Tenerife, polígono El Mayorazgo).","<b>Tenerife</b> (Santa Cruz de Tenerife, El Mayorazgo industrial estate)."),
           ("<b>Lanzarote</b> (Arrecife) y <b>Fuerteventura</b> (Puerto del Rosario).","<b>Lanzarote</b> (Arrecife) and <b>Fuerteventura</b> (Puerto del Rosario)."),
           ("<b>El Hierro y otras islas.</b> Consúltanos. "+T%"cobertura por confirmar","<b>El Hierro and other islands.</b> Ask us. "+T%"coverage to be confirmed")])),
  ('cols',("Qué hacemos en destino","What we do at destination"),("Del puerto o aeropuerto a tu puerta.","From the port or airport to your door."),("Servicios en las islas.","Services on the islands."),
   [(("Entrega","Delivery"),("Puerta a puerta.","Door to door."),("Uniendo la península con las islas mayores, con equipo disponible todo el año y entregas especiales.","Linking the mainland with the main islands, with equipment available all year and special deliveries.")),
    (("Logística","Logistics"),("Almacenaje y distribución.","Storage and distribution."),("Almacenaje, picking, embalaje y distribución capilar de la mercancía. "+T%"ubicaciones por confirmar","Storage, picking, packing and fine-grained distribution of the goods. "+T%"locations to be confirmed")),
    (("Plazos","Lead times"),("Aéreo y marítimo.","Air and sea."),("Carga aérea en 24–48 h desde la recogida y marítimo LCL desde 72 h. "+T%"condiciones por confirmar","Air cargo in 24–48 h from pick-up and LCL sea freight from 72 h. "+T%"conditions to be confirmed"))]),
  ('faq',("Preguntas frecuentes","Frequently asked questions"),("Logística en Tenerife y Canarias.","Logistics in Tenerife and the Canary Islands."),("Respuesta primero, detalle después.","Answer first, detail after."),
   faq([("¿Tenéis oficina en Tenerife?","Do you have an office in Tenerife?","Sí. Estamos en Subida Principal al Mayorazgo, 5, Pol. Ind. El Mayorazgo, 38110 Santa Cruz de Tenerife.","Yes. We are at Subida Principal al Mayorazgo, 5, Pol. Ind. El Mayorazgo, 38110 Santa Cruz de Tenerife."),
        ("¿Cuánto tarda un envío a Tenerife o Gran Canaria?","How long does a shipment to Tenerife or Gran Canaria take?","Por vía aérea, de 24 a 48 horas desde la recogida; por vía marítima (LCL), desde 72 horas. "+T%"condiciones por confirmar","By air, 24 to 48 hours from pick-up; by sea (LCL), from 72 hours. "+T%"conditions to be confirmed"),
        ("¿Enviáis a El Hierro y a las islas menores?","Do you ship to El Hierro and the smaller islands?","Consúltanos la ruta que necesitas y te confirmamos plazo y condiciones. "+T%"cobertura por confirmar","Ask us about the route you need and we will confirm lead time and conditions. "+T%"coverage to be confirmed"),
        ("¿Hacéis distribución dentro de la isla?","Do you distribute within the island?","Ofrecemos distribución capilar de la mercancía en destino. "+T%"detalle por confirmar","We offer fine-grained distribution of the goods at destination. "+T%"details to be confirmed")]))],
 (("¿Necesitas mover carga en Canarias?","Need to move cargo in the Canary Islands?"),("Cuéntanos origen, destino y mercancía. Te respondemos con precio y plazo.","Tell us origin, destination and goods. We reply with price and lead time.")))

ADU=page(
 (("Agentes de Aduana","Customs agents"),("Desde 1992","Since 1992"),
  ("Agente de aduanas para Canarias y envíos internacionales.","Customs agent for the Canary Islands and international shipments."),
  ("Preparamos y presentamos el DUA nosotros, como Agentes de Aduana, para que no tengas que contratar a un tercero.","We prepare and file the DUA ourselves, as customs agents, so you do not need to hire a third party.")),
 [('split',("Qué gestionamos","What we handle"),("Gestión integral de la aduana.","End-to-end customs management."),
   ("Exportación e importación, para Canarias, para internacional y para destinos como Andorra.","Export and import, for the Canary Islands, for international shipments and for destinations such as Andorra."),
   checks([("<b>Despachos de aduana</b> de exportación e importación.","<b>Customs clearances</b> for export and import."),
           ("<b>Tránsitos</b> y <b>ADT</b> (almacén de depósito temporal).","<b>Transits</b> and <b>ADT</b> (temporary storage warehouse)."),
           ("<b>Exportaciones temporales</b> y cuadernos A.T.A.","<b>Temporary exports</b> and ATA carnets."),
           ("<b>Gestiones de importación:</b> NIF-IVA, EORI, Intrastat y actuaciones ante la AEAT.","<b>Import procedures:</b> VAT ID, EORI, Intrastat and filings with the tax agency.")])),
  ('faq',("Preguntas frecuentes","Frequently asked questions"),("Aduanas y DUA en Canarias.","Customs and DUA in the Canary Islands."),("Respuesta primero, detalle después.","Answer first, detail after."),
   faq([("¿Qué es el DUA y quién lo tramita?","What is the DUA and who files it?","El Documento Único Administrativo es la declaración con la que se despacha la mercancía en aduana. En Cargo Serpa lo preparamos y lo presentamos nosotros, como Agentes de Aduana.","The Single Administrative Document (DUA) is the declaration used to clear goods through customs. At Cargo Serpa we prepare and file it ourselves, as customs agents."),
        ("¿Necesito despacho aduanero para enviar a Canarias?","Do I need customs clearance to ship to the Canary Islands?","En general sí: Canarias tiene régimen fiscal y aduanero propio, y la mercancía se despacha y se declara. Te confirmamos qué corresponde a tu envío. "+T%"redacción por validar con Aduanas","Generally yes: the Canary Islands have their own tax and customs regime, and the goods are cleared and declared. We confirm what applies to your shipment. "+T%"wording to validate with customs"),
        ("¿Qué documentos hacen falta para enviar a Canarias?","What documents are needed to ship to the Canary Islands?","Hace falta factura de la mercancía; además, el documento de transporte y la lista de bultos. Nosotros preparamos el DUA. "+T%"otros documentos según la mercancía","An invoice for the goods is needed; also the transport document and the packing list. We prepare the DUA. "+T%"other documents depending on the goods"),
        ("¿Se paga IGIC o IVA en Canarias?","Do you pay IGIC or VAT in the Canary Islands?","En Canarias se aplica el IGIC en lugar del IVA. El tratamiento concreto depende de la mercancía y de quién sea el importador. "+T%"por validar con Aduanas","In the Canary Islands IGIC applies instead of VAT. The specific treatment depends on the goods and on who the importer is. "+T%"to validate with customs")]))],
 (("¿Necesitas un despacho de aduana?","Need a customs clearance?"),("Cuéntanos origen, destino y mercancía. Te respondemos con precio y plazo.","Tell us origin, destination and goods. We reply with price and lead time.")))
