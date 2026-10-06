import re,os,json,base64,shutil,html,sys
sys.path.insert(0,'.')
from bs4 import BeautifulSoup,Tag,NavigableString
import newpages
BASE='https://www.cargoserpa.es'   # POR COMPROBAR con A&A: www o sin www
OUT='web'
shutil.rmtree(OUT,ignore_errors=True)
for d in ('assets/css','assets/js','assets/img'): os.makedirs(f'{OUT}/{d}')
src=open('Maqueta_Cargo_Serpa_V5.html',encoding='utf-8').read()
S=BeautifulSoup(src,'html.parser')

# ---------- páginas ----------
P=[ # key, slug_es, slug_en, v5 id o None, title es, title en, desc es, desc en
('inicio','','','p-inicio',"Transporte y aduanas Península–Canarias | Cargo Serpa","Transport and customs Mainland–Canary Islands | Cargo Serpa","Transporte aéreo y marítimo a Canarias y Baleares, con agentes de aduana propios. Especialistas en el corredor Península–Canarias desde 1992. IATA y WCA.","Air and sea transport to the Canary and Balearic Islands, with in-house customs agents. Mainland–Canary Islands specialists since 1992. IATA and WCA."),
('nacional','envios-nacionales','domestic-shipping','p-nacional',"Envíos nacionales y a Andorra | Cargo Serpa","Domestic shipping in Spain and Andorra | Cargo Serpa","Envíos en todo el Territorio Nacional y Andorra, por aire, mar o carretera, con la aduana resuelta por nuestros Agentes de Aduana.","Shipping across Spain and Andorra by air, sea or road, with customs handled by our customs agents."),
('canarias','transporte-peninsula-canarias','mainland-canary-islands-transport','p-canarias',"Transporte Península–Canarias para empresas | Cargo Serpa","Mainland–Canary Islands transport | Cargo Serpa","Transporte aéreo y marítimo a Canarias con despacho de aduanas propio. Aéreo en 24–48 h y marítimo LCL desde 72 h. Pide presupuesto.","Air and sea transport to the Canary Islands with in-house customs clearance. Air in 24–48 h and LCL sea freight from 72 h. Request a quote."),
('maritimo','transporte-maritimo-canarias','sea-freight-canary-islands',None,"Transporte marítimo a Canarias: LCL y FCL | Cargo Serpa","Sea freight to the Canary Islands: LCL and FCL | Cargo Serpa","Transporte marítimo Península–Canarias en LCL y FCL, con aduana propia y un único responsable. LCL con salida los viernes desde Cádiz/Huelva.","Mainland–Canary Islands sea freight in LCL and FCL, with in-house customs and one single owner. LCL departs on Fridays from Cádiz/Huelva."),
('islas','logistica-canarias-islas','logistics-canary-islands',None,"Logística en Tenerife y Canarias | Cargo Serpa","Logistics in Tenerife and the Canary Islands | Cargo Serpa","Oficinas propias en Las Palmas, Tenerife, Lanzarote y Fuerteventura. Logística, almacenaje y distribución en las islas, con aduana propia.","Our own offices in Las Palmas, Tenerife, Lanzarote and Fuerteventura. Logistics, storage and distribution on the islands, with in-house customs."),
('aduanas','aduanas-dua-canarias','customs-clearance-canary-islands',None,"Agente de aduanas en Canarias: DUA y despacho | Cargo Serpa","Customs agent in the Canary Islands | Cargo Serpa","Agentes de Aduana: preparamos y presentamos el DUA, tránsitos, ADT, cuadernos ATA y gestiones de importación y exportación.","Customs agents: we prepare and file the DUA, transits, ADT, ATA carnets and import and export procedures."),
('internacional','internacional','international','p-internacional',"Transporte internacional aéreo y marítimo | Cargo Serpa","International air and sea freight | Cargo Serpa","Consignatarios de carga aérea, miembros de IATA y WCA, con líneas regulares a Sudamérica, México y Estados Unidos y presencia en más de 90 países.","Air cargo consignees, IATA and WCA members, with regular lines to South America, Mexico and the United States and a presence in more than 90 countries."),
('servicios','servicios','services','p-servicios',"Servicios de transporte, logística y aduanas | Cargo Serpa","Transport, logistics and customs services | Cargo Serpa","Transporte aéreo, marítimo y terrestre, plataformas logísticas, Agentes de Aduana y asesoramiento en comercio exterior, bajo un mismo responsable.","Air, sea and road transport, logistics platforms, customs agents and foreign trade advice, under one single owner."),
('empresa','empresa','company','p-empresa',"Quiénes somos: más de 30 años en transporte | Cargo Serpa","About us: more than 30 years in transport | Cargo Serpa","Cargo Serpa, de los primeros transitarios españoles con estructura nacional e internacional. Especialistas en el corredor Península–Canarias desde 1992.","Cargo Serpa, one of the first Spanish freight forwarders with a national and international structure. Canary Islands corridor specialists since 1992."),
('faq','preguntas-frecuentes','faq','p-faq',"Preguntas frecuentes de transporte a Canarias | Cargo Serpa","FAQ on transport to the Canary Islands | Cargo Serpa","Quince respuestas directas sobre cómo enviar a Canarias, el DUA, plazos, mercancías especiales y datos de contacto de Cargo Serpa.","Fifteen direct answers on shipping to the Canary Islands, the DUA, lead times, special cargo and Cargo Serpa contact details."),
('presupuesto','solicitar-presupuesto','request-a-quote','p-presupuesto',"Solicitar presupuesto de transporte | Cargo Serpa","Request a transport quote | Cargo Serpa","Cuéntanos origen, destino y mercancía y te respondemos con precio y plazo. Delegaciones en Madrid, Barcelona, Baleares y Canarias.","Tell us origin, destination and goods and we reply with price and lead time. Offices in Madrid, Barcelona, the Balearic Islands and the Canary Islands."),
]
KEYS={p[0]:p for p in P}
def url(key,lang,abs_=False):
    p=KEYS[key]; slug=p[1] if lang=='es' else p[2]
    u=f'/{lang}/'+(slug+'/' if slug else '')
    return (BASE+u) if abs_ else u
GOKEY={'canarias':'canarias'}

# ---------- imágenes ----------
imgs={}
def extract_img(tag,name):
    d=tag['src']; m=re.match(r'data:image/(\w+);base64,(.*)',d,re.S)
    ext={'jpeg':'jpg'}.get(m.group(1),m.group(1))
    fn=f'assets/img/{name}.{ext}'
    open(f'{OUT}/{fn}','wb').write(base64.b64decode(m.group(2))); tag['src']='/'+fn
for im in S.find_all('img'):
    extract_img(im,'logo-cargo-serpa' if 'brand-img' in (im.get('class') or []) else 'hero-inicio')
    if not im.get('alt') and 'brand-img' not in (im.get('class') or []): im['alt']=''  # decorativa (hero)

# ---------- CSS ----------
css='\n'.join(x.get_text() for x in S.find_all('style'))
css+='''
/* --- añadidos del paquete --- */
a.nl,a.tile,a.door,a.link,.nav a,.mnav a,.dd-menu a{text-decoration:none}
a.link{color:inherit}
a.tile,a.door{color:inherit;display:block}
.nav .dd-menu a{display:block;width:100%;text-align:left;padding:10px 14px;color:inherit;background:none;border:0;font:inherit;cursor:pointer}
.nav .dd-menu a:hover,.nav .dd-menu a[aria-current="page"]{background:rgba(0,0,0,.05)}
.hp{position:absolute;left:-9999px;width:1px;height:1px;overflow:hidden}
.trk{display:flex;gap:10px;flex-wrap:wrap;align-items:center;margin-top:18px}
.trk input{flex:1 1 220px;min-width:0}
.sh-lang{display:flex;gap:6px}
'''
open(f'{OUT}/assets/css/site.css','w',encoding='utf-8').write(re.sub(r'\.stage\{[^}]*\}','',css) if False else css)

# ---------- piezas comunes ----------
header=S.find('header',class_='sh'); footer=S.find('footer',class_='sf'); dele=S.find('section',id='delegaciones'); dock=S.find('div',class_='dock'); sprite=S.find('svg',recursive=False) or [x for x in S.find(id='site').children if isinstance(x,Tag) and x.name=='svg'][0]
def lang_apply(root,lang):
    for el in root.find_all(attrs={'data-es':True}):
        v=el.get('data-'+lang)
        if v is not None:
            el.clear(); el.append(BeautifulSoup(v,'html.parser'))
        for a in ('data-es','data-en'): 
            if a in el.attrs: del el.attrs[a]
    for el in root.find_all(attrs={'data-ph-es':True}):
        el['placeholder']=el.get('data-ph-'+lang)
        del el['data-ph-es']; del el['data-ph-en']
    return root
def convert_links(root,lang,here):
    for el in list(root.find_all(attrs={'data-go':True})):
        key=el['data-go']
        if key not in KEYS:
            el.decompose(); continue
        href=url(key,lang)
        if el.get('data-service'): href+='?servicio='+el['data-service']
        if el.get('data-anchor'): href+='#'+el['data-anchor']
        if el.name=='button' or el.name=='a':
            el.name='a'; el['href']=href
            for k in ('data-go','data-service','data-anchor','type'): el.attrs.pop(k,None)
            cl=el.get('class',[]); 
            if 'btn' not in cl: cl=cl+['nl']
            el['class']=cl
            if key==here and el.name=='a' and not any(c.startswith('btn') for c in cl): el['aria-current']='page'
    for el in root.find_all(attrs={'data-scroll':True}):
        el.name='a'; el['href']='#'+el['data-scroll']; del el['data-scroll']; el.attrs.pop('type',None)
        cl=el.get('class',[]); el['class']=cl+['nl']
    for el in root.find_all(attrs={'data-soon':True}): el.attrs.pop('data-soon')
    for el in root.find_all(attrs={'data-toast':True}):
        el['href']='#'; el['data-todo']='página legal existente: mantener la actual de A&A'; el.attrs.pop('data-toast')
def make_shell(lang,here,body_html_nodes):
    other='en' if lang=='es' else 'es'
    hd=BeautifulSoup(str(header),'html.parser').find('header'); ft=BeautifulSoup(str(footer),'html.parser').find('footer'); dl=BeautifulSoup(str(dele),'html.parser').find('section'); dk=BeautifulSoup(str(dock),'html.parser').find('div')
    for c in hd.find_all(class_='zone'): c.decompose()
    # nav: dropdown completo + FAQ
    dd=hd.find(class_='dd-menu')
    dd.clear()
    dd.append(BeautifulSoup(''.join(f'<button data-go="{k}" data-es="{a}" data-en="{b}">{a}</button>' for k,a,b in [('nacional','Envíos nacionales','Domestic shipping'),('canarias','Península–Canarias','Mainland–Canary Islands'),('maritimo','Marítimo a Canarias','Sea freight to the Canary Islands'),('islas','Logística en las islas','Logistics on the islands'),('aduanas','Aduanas y DUA','Customs and DUA')]),'html.parser'))
    mn=hd.find(id='mnav')
    first=mn.find('button',attrs={'data-go':'canarias'})
    for k,a,b in [('aduanas','Aduanas y DUA','Customs and DUA'),('islas','Logística en las islas','Logistics on the islands'),('maritimo','Marítimo a Canarias','Sea freight to the Canary Islands')]:
        nb=BeautifulSoup(f'<button data-go="{k}" style="padding-left:18px" data-es="{a}" data-en="{b}">{a}</button>','html.parser').find('button'); first.insert_after(nb)
    # logo
    br=hd.find('button',class_='brand'); br['data-go']='inicio'
    # idioma: enlaces a la página equivalente
    lg=hd.find(class_='lang')
    if lg:
        lg.clear(); lg['class']=['lang','sh-lang']
        a_es=BeautifulSoup(f'<a href="{url(here,"es")}" hreflang="es" lang="es" data-evt="language_switch" data-to="es" aria-label="Español" {"aria-current=page" if lang=="es" else ""}>ES</a><span aria-hidden="true">/</span><a href="{url(here,"en")}" hreflang="en" lang="en" data-evt="language_switch" data-to="en" aria-label="English" {"aria-current=page" if lang=="en" else ""}>EN</a>','html.parser')
        lg.append(a_es)
    ml=hd.find(id='mLang')
    if ml:
        ml.name='a'; ml['href']=url(here,other); ml['hreflang']=other; ml['data-evt']='language_switch'; ml['data-to']=other; ml.attrs.pop('id',None); ml.string='English' if lang=='es' else 'Español'; ml.attrs.pop('data-es',None); ml.attrs.pop('data-en',None)
    # quitar duplicados de idioma data-*
    # footer: acceso empleados y clientes
    legal=[h for h in ft.find_all('h4') if 'Legal' in h.get_text()]
    if legal:
        legal[0].parent.append(BeautifulSoup('<a href="/login.aspx" data-es="Acceso empleados y clientes" data-en="Staff and client access">Acceso empleados y clientes</a>','html.parser'))
    # footer 'Web' links
    for h in ft.find_all('h4'):
        if h.get_text().strip()=='Web':
            col=h.parent
            for a in col.find_all('a'): a.decompose()
            col.append(BeautifulSoup(''.join(f'<a data-go="{k}" href="#">{a}</a>' for k,a in [('nacional','Nacional'),('canarias','Península–Canarias'),('maritimo','Marítimo a Canarias'),('islas','Logística en las islas'),('aduanas','Aduanas y DUA'),('internacional','Internacional'),('servicios','Servicios'),('empresa','Empresa'),('faq','Preguntas frecuentes'),('presupuesto','Solicitar presupuesto')]),'html.parser'))
    # un único idioma en footer/Web: traducir
    return hd,ft,dl,dk

def tbc_report():pass
TBC=[]
CLEAN_NOTES=lambda root:[n.decompose() for n in root.find_all('aside',class_='note')]

def page_section(key,lang):
    p=KEYS[key]
    if p[3]:
        sec=BeautifulSoup(str(S.find(id=p[3])),'html.parser').find('section')
        CLEAN_NOTES(sec)
        # idioma
        if key=='internacional':
            for c in sec.find_all(class_='L-en' if lang=='es' else 'L-es'): c.decompose()
            for c in sec.find_all(class_='L-en' if lang=='en' else 'L-es'): c['class']=[x for x in c.get('class',[]) if not x.startswith('L-')]; c.attrs.pop('hidden',None)
        sec['class']=['page','on']; sec.attrs.pop('id',None); sec.attrs.pop('data-title',None)
    else:
        i={'maritimo':newpages.MAR,'islas':newpages.ISL,'aduanas':newpages.ADU}[key]
        sec=BeautifulSoup(i[0 if lang=='es' else 1],'html.parser').find('section'); sec['class']=['page','on']
    return sec

shutil.copy('site.js',f'{OUT}/assets/js/site.js')
exec(open('faq_data.py',encoding='utf-8').read())
def plain(x): return html.unescape(re.sub(r'<[^>]+>','',x)).strip()
ORG={"@type":"Organization","name":"Cargo Serpa","foundingDate":"1992","url":BASE,"logo":BASE+"/assets/img/logo-cargo-serpa.png","email":"info@cargoserpa.es","telephone":"+34913290318","address":{"@type":"PostalAddress","streetAddress":"Calle Echo, Centro de Carga Aérea, Parcela 2-4, Nave 4","postalCode":"28042","addressLocality":"Madrid","addressCountry":"ES"}}
def faq_ld(lang):
    i=2 if lang=='es' else 3; j=0 if lang=='es' else 1
    return {"@type":"FAQPage","mainEntity":[{"@type":"Question","name":q[j],"acceptedAnswer":{"@type":"Answer","text":plain(q[i])}} for g in FAQ for q in g[2]]}

def add_forms(sec):
    for f in sec.find_all('form'):
        fid=f.get('id','')
        f['action']='/api/solicitud'; f['method']='post'; f['data-form']={'quoteForm':'presupuesto','intForm':'internacional','enForm':'internacional_en'}.get(fid,fid or 'form')
        f['novalidate']='novalidate'
        hp=BeautifulSoup('<div class="hp" aria-hidden="true"><label>No rellenar<input type="text" name="website" tabindex="-1" autocomplete="off"></label></div>','html.parser'); f.append(hp)
    for iid in ('q-name','q-mail','q-serv','q-chk','i-name','i-co','i-mail','e-name','e-co','e-mail'):
        el=sec.find(id=iid)
        if el: el['data-req']='1'
    for iid,nm in (('q-name','nombre'),('q-mail','email'),('q-serv','servicio'),('i-name','nombre'),('i-co','empresa'),('i-mail','email'),('i-country','pais'),('i-corr','corredor'),('i-serv','servicio'),('i-msg','mensaje'),('e-name','nombre'),('e-co','empresa'),('e-country','pais'),('e-mail','email'),('e-serv','servicio'),('e-msg','mensaje')):
        el=sec.find(id=iid)
        if el and not el.get('name'): el['name']=nm
    for el in sec.find_all(['input','textarea']):
        if not el.get('name') and el.get('type') not in ('checkbox',): 
            if el.get('id'): el['name']=el['id'].split('-',1)[-1]

def track_box(sec,lang):
    h=sec.find(class_='hero')
    if not h: return
    es=('Seguimiento de envíos','Introduce tu número de envío','Buscar')
    en=('Shipment tracking','Enter your shipment number','Search')
    t=es if lang=='es' else en
    box=BeautifulSoup(f'<section class="sec"><div class="wrap"><p class="eyebrow">{t[0]}</p><form class="trk" data-tracking="1" data-tracking-url=""><input type="text" name="envio" aria-label="{t[1]}" placeholder="{t[1]}"><button class="btn btn-primary" type="submit">{t[2]}</button></form></div></section>','html.parser')
    h.insert_after(box)

TBCLIST={}
pages_out=[]
for lang in ('es','en'):
    for p in P:
        key=p[0]
        sec=page_section(key,lang)
        hd,ft,dl,dk=make_shell(lang,key,None)
        for part in (sec,hd,ft,dl,dk): lang_apply(part,lang)
        # los data-go de nav se crearon con data-es/en: ya aplicados arriba antes de convertir? (se aplica antes de convert_links)
        for part in (sec,hd,ft,dl,dk): convert_links(part,lang,key)
        add_forms(sec)
        if key=='presupuesto':
            h2=sec.find('h2')
            if h2: h2.name='h1'
        if key=='inicio': track_box(sec,lang)
        # imágenes sin alt
        for im in sec.find_all('img'):
            if im.get('alt') is None: im['alt']=''
        # tbc → lista
        TBCLIST.setdefault((lang,key),[]).extend(plain(str(x)) for x in sec.find_all(class_='tbc'))
        title=p[4] if lang=='es' else p[5]; desc=p[6] if lang=='es' else p[7]
        canon=url(key,lang,True); alt_es=url(key,'es',True); alt_en=url(key,'en',True)
        graph=[ORG]+([faq_ld(lang)] if key=='faq' else [])
        ld=json.dumps({"@context":"https://schema.org","@graph":graph},ensure_ascii=False)
        sprite_html=str(sprite)
        head=f'''<!doctype html>
<html lang="{lang}">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>{html.escape(title)}</title>
<meta name="description" content="{html.escape(desc)}">
<link rel="canonical" href="{canon}">
<link rel="alternate" hreflang="es" href="{alt_es}">
<link rel="alternate" hreflang="en" href="{alt_en}">
<link rel="alternate" hreflang="x-default" href="{alt_es}">
<meta property="og:type" content="website"><meta property="og:title" content="{html.escape(title)}"><meta property="og:description" content="{html.escape(desc)}"><meta property="og:url" content="{canon}"><meta property="og:locale" content="{'es_ES' if lang=='es' else 'en_GB'}">
<link rel="icon" href="/assets/img/logo-cargo-serpa.png">
<link rel="stylesheet" href="/assets/css/site.css">
<script>
/* Consent Mode v2: todo denegado hasta que la persona elija. */
window.dataLayer=window.dataLayer||[];function gtag(){{dataLayer.push(arguments)}}
gtag('consent','default',{{analytics_storage:'denied',ad_storage:'denied',ad_user_data:'denied',ad_personalization:'denied',wait_for_update:500}});
</script>
<!-- TODO A&A: pegar aquí el snippet de Google Tag Manager (contenedor GTM-XXXXXXX). GA4 (G-C2TWFJZ8Q1) se configura dentro de GTM, no en el código. -->
<script type="application/ld+json">{ld}</script>
</head>
<body>
<div class="stage" id="stage" data-view="desktop"><div class="site" id="site">
{str(hd)}
<main>
{str(sec)}
</main>
{str(dl)}
{str(ft)}
{sprite_html}
{str(dk)}
</div></div>
<div class="toast" id="toast" role="status" aria-live="polite"></div>
<script src="/assets/js/site.js" defer></script>
</body>
</html>
'''
        # el sprite svg vive fuera de .site en V5? se mantiene
        d=f'{OUT}/{lang}/'+((p[1] if lang=='es' else p[2])+'/' if (p[1] if lang=='es' else p[2]) else '')
        os.makedirs(d,exist_ok=True); open(d+'index.html','w',encoding='utf-8').write(head)
        pages_out.append((lang,key))

# raíz: redirección a /es/ (A&A puede decidir por Accept-Language)
open(f'{OUT}/index.html','w',encoding='utf-8').write(f'<!doctype html><html lang="es"><head><meta charset="utf-8"><title>Cargo Serpa</title><link rel="canonical" href="{BASE}/es/"><meta http-equiv="refresh" content="0; url=/es/"></head><body><a href="/es/">Cargo Serpa</a></body></html>')
# sitemap + robots
sm=['<?xml version="1.0" encoding="UTF-8"?>','<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9" xmlns:xhtml="http://www.w3.org/1999/xhtml">']
for p in P:
    for lang in ('es','en'):
        sm.append(f'<url><loc>{url(p[0],lang,True)}</loc><xhtml:link rel="alternate" hreflang="es" href="{url(p[0],"es",True)}"/><xhtml:link rel="alternate" hreflang="en" href="{url(p[0],"en",True)}"/><xhtml:link rel="alternate" hreflang="x-default" href="{url(p[0],"es",True)}"/></url>')
sm.append('</urlset>')
open(f'{OUT}/sitemap.xml','w',encoding='utf-8').write('\n'.join(sm))
open(f'{OUT}/robots.txt','w').write(f'User-agent: *\nAllow: /\nDisallow: /api/\n# TODO A&A: añadir aquí las rutas internas del GES si procede (sin revelar nada sensible)\n\nSitemap: {BASE}/sitemap.xml\n')
json.dump({f'{l}/{k}':v for (l,k),v in TBCLIST.items()},open('tbc.json','w'),ensure_ascii=False,indent=1)
print('pages',len(pages_out))
