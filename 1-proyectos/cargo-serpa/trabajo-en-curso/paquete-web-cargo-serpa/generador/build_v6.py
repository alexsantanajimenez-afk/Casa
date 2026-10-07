import re,sys
sys.path.insert(0,'.')
from bs4 import BeautifulSoup,Tag,NavigableString
import newpages
src=open('Maqueta_Cargo_Serpa_V5.html',encoding='utf-8').read()
src=src.replace('Maqueta · V5 · 8 páginas públicas, ES/EN','Maqueta · V6 · 11 páginas públicas, ES/EN').replace('<title>Maqueta web Cargo Serpa · V5</title>','<title>Maqueta web Cargo Serpa · V6</title>')
S=BeautifulSoup(src,'html.parser')
INLINE={'b','i','strong','em','br','span','a','small','u','sup','sub'}
def leaf(el):
    if el.name in ('script','style','svg','select','option'):return False
    has=False
    for c in el.children:
        if isinstance(c,NavigableString):
            if c.strip():has=True
        elif isinstance(c,Tag):
            if c.name not in INLINE or any(isinstance(d,Tag) and d.name not in INLINE for d in c.descendants):return False
    return has
def leaves(sec):
    out=[]
    for el in sec.find_all(True):
        if leaf(el) and not any(leaf(p) for p in el.parents if isinstance(p,Tag) and p is not sec and p.name!='[document]'): out.append(el)
    return out
def bilingual(es_html,en_html,sid,title):
    es=BeautifulSoup(es_html,'html.parser').find('section'); en=BeautifulSoup(en_html,'html.parser').find('section')
    le,ln=leaves(es),leaves(en)
    assert len(le)==len(ln),(sid,len(le),len(ln))
    for a,b in zip(le,ln):
        a['data-es']=a.decode_contents().strip(); a['data-en']=b.decode_contents().strip()
    es['class']=['page']; es['id']='p-'+sid; es['data-title']=title
    return es
NEW=[('maritimo','Marítimo a Canarias',newpages.MAR),('islas','Logística en las islas',newpages.ISL),('aduanas','Aduanas y DUA',newpages.ADU)]
pres=S.find(id='p-presupuesto')
for sid,title,pg in NEW:
    pres.insert_before(bilingual(pg[0],pg[1],sid,title)); 
# nav
def mk(tag,attrs,text):
    b=S.new_tag(tag)
    for k,v in attrs.items(): b[k]=v
    b.string=text; return b
dd=S.find(class_='dd-menu')
for k,a,b in [('maritimo','Marítimo a Canarias','Sea freight to the Canary Islands'),('islas','Logística en las islas','Logistics on the islands'),('aduanas','Aduanas y DUA','Customs and DUA')]:
    dd.append(mk('button',{'data-go':k,'data-es':a,'data-en':b},a))
mn=S.find(id='mnav'); can=mn.find('button',attrs={'data-go':'canarias'})
for k,a,b in [('aduanas','Aduanas y DUA','Customs and DUA'),('islas','Logística en las islas','Logistics on the islands'),('maritimo','Marítimo a Canarias','Sea freight to the Canary Islands')]:
    can.insert_after(mk('button',{'data-go':k,'style':'padding-left:18px','data-es':a,'data-en':b},a))
emp=[b for b in S.find_all('button',class_='tab') if b.get('data-go')=='canarias'][0]
for k,a in [('aduanas','Aduanas y DUA'),('islas','Logística en las islas'),('maritimo','Marítimo a Canarias')]:
    emp.insert_after(mk('button',{'class':'tab','data-go':k},a))
# footer
ft=S.find('footer',class_='sf')
for h in ft.find_all('h4'):
    if h.get_text().strip()=='Web':
        col=h.parent; last=col.find_all('a')[-1]
        for k,a in [('aduanas','Aduanas y DUA'),('islas','Logística en las islas'),('maritimo','Marítimo a Canarias')]:
            n=S.new_tag('a'); n['data-go']=k; n['href']='#'; n.string=a; col.find('a',attrs={'data-go':'canarias'}).insert_after(n)
    if h.get_text().strip()=='Legal':
        n=S.new_tag('a'); n['href']='#'; n['data-toast']='Maqueta: aquí iría el acceso al GES, sin tocar su dirección actual'; n['data-es']='Acceso empleados y clientes'; n['data-en']='Staff and client access'; n.string='Acceso empleados y clientes'; h.parent.append(n)
# seguimiento en la portada
h=S.find(id='p-inicio').find(class_='hero')
box=BeautifulSoup('<section class="sec"><div class="wrap"><p class="eyebrow" data-es="Seguimiento de envíos" data-en="Shipment tracking">Seguimiento de envíos</p><form class="trk" id="trkForm" onsubmit="return false"><input type="text" aria-label="Número de envío" placeholder="Introduce tu número de envío" data-ph-es="Introduce tu número de envío" data-ph-en="Enter your shipment number"><button class="btn btn-primary" type="button" data-toast="Maqueta: aquí iría el enlace real del seguimiento" data-es="Buscar" data-en="Search">Buscar</button></form></div></section>','html.parser')
h.insert_after(box)
out=str(S)
out=out.replace("var pages=['inicio','nacional','canarias','internacional','servicios','empresa','faq','presupuesto','equipo'];","var pages=['inicio','nacional','canarias','maritimo','islas','aduanas','internacional','servicios','empresa','faq','presupuesto','equipo'];")
out=out.replace("faq:'Preguntas frecuentes',presupuesto","faq:'Preguntas frecuentes',maritimo:'Marítimo a Canarias',islas:'Logística en las islas',aduanas:'Aduanas y DUA',presupuesto")
# el selector del menú desplegable marca 'cur' también para las nuevas
out=out.replace("['nacional','canarias'].indexOf(id)>-1","['nacional','canarias','maritimo','islas','aduanas'].indexOf(id)>-1")
out=out.replace('</style>','.trk{display:flex;gap:10px;flex-wrap:wrap;align-items:center;margin-top:18px}.trk input{flex:1 1 220px;min-width:0}\n</style>',1)
open('Maqueta_Cargo_Serpa_V6.html','w',encoding='utf-8').write(out)
print(len(out))
