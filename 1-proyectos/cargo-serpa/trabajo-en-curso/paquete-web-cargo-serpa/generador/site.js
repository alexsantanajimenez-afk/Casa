/* Cargo Serpa · web pública · JS base (sin dependencias).
   A&A: revisar los bloques marcados con TODO. */
(function(){
  var doc=document, root=doc.documentElement, lang=root.getAttribute('lang')==='en'?'en':'es';
  window.dataLayer=window.dataLayer||[];
  function gtag(){window.dataLayer.push(arguments)}
  function push(o){window.dataLayer.push(o)}
  function $(s,c){return (c||doc).querySelector(s)}
  function $$(s,c){return [].slice.call((c||doc).querySelectorAll(s))}
  var T={es:{sent:'Gracias. Ya tenemos tu solicitud.',err:'No hemos podido enviar la solicitud. Inténtalo de nuevo o llámanos al +34 91 329 03 18.',wa:'Número de WhatsApp por confirmar',trk:'Enlace de seguimiento por confirmar'},
         en:{sent:'Thank you. We have your request.',err:'We could not send your request. Please try again or call +34 91 329 03 18.',wa:'WhatsApp number to be confirmed',trk:'Tracking link to be confirmed'}}[lang];
  var toastEl=$('#toast'),tt;
  function toast(m){if(!toastEl)return;toastEl.textContent=m;toastEl.classList.add('show');clearTimeout(tt);tt=setTimeout(function(){toastEl.classList.remove('show')},2600)}

  /* Menú */
  var burger=$('#burger'),mnav=$('#mnav');
  if(burger)burger.addEventListener('click',function(){var o=mnav.classList.toggle('open');burger.setAttribute('aria-expanded',o)});
  function ddClose(){$$('.dd-menu').forEach(function(m){m.hidden=true});$$('.dd-btn').forEach(function(b){b.setAttribute('aria-expanded','false')})}
  $$('.dd-btn').forEach(function(b){b.addEventListener('click',function(e){e.stopPropagation();var m=b.nextElementSibling,w=m.hidden;ddClose();m.hidden=!w;b.setAttribute('aria-expanded',w)})});
  doc.addEventListener('click',function(e){if(!e.target.closest('.dd'))ddClose()});
  doc.addEventListener('keydown',function(e){if(e.key==='Escape')ddClose()});

  /* Consentimiento (Consent Mode v2). TODO A&A: sustituir por el CMP elegido (Cookiebot, CookieYes, Iubenda) si procede. */
  var KEY='cs_consent',ck=$('#cookie');
  function getC(){try{return localStorage.getItem(KEY)}catch(e){return null}}
  function setC(v){try{localStorage.setItem(KEY,v)}catch(e){}}
  function apply(an){gtag('consent','update',{analytics_storage:an?'granted':'denied',ad_storage:'denied',ad_user_data:'denied',ad_personalization:'denied'})}
  var saved=getC();
  if(saved){apply(saved==='all'); if(ck)ck.hidden=true}
  function ckSet(open){var s=$('#ckSet'),m=$('#ckMore');if(!s)return;s.hidden=!open;m.setAttribute('aria-expanded',open)}
  var mo=$('#ckMore'); if(mo)mo.addEventListener('click',function(){ckSet($('#ckSet').hidden)});
  doc.addEventListener('click',function(e){
    var t=e.target.closest('[data-cookie]');if(!t)return;e.preventDefault();
    var a=t.getAttribute('data-cookie');
    if(a==='yes'){setC('all');apply(true);ck.hidden=true}
    else if(a==='no'){setC('none');apply(false);ck.hidden=true}
    else if(a==='save'){var an=$('#ckAn').checked;setC(an?'all':'none');apply(an);ck.hidden=true}
    else if(a==='back'){ckSet(false)}
    else if(a==='open'){ck.hidden=false;ckSet(false)}
  });

  /* WhatsApp. TODO A&A: poner el número real en WA_NUMBER (formato internacional sin +, ej. 34913290318). */
  var WA_NUMBER='';
  var wa=$('#wa'),card=$('#waCard'),fab=$('#waFab'),hint=$('#waHint');
  function waStep(n){var a=$('#waStep1'),b=$('#waStep2');if(a)a.hidden=n!==1;if(b)b.hidden=n!==2}
  function waOpen(o){if(!card)return;card.hidden=!o;wa.classList.toggle('open',o);fab.setAttribute('aria-expanded',o);if(o){if(hint)hint.hidden=true;waStep(1)}}
  if(wa){
    setTimeout(function(){wa.classList.add('on')},3500);
    fab.addEventListener('click',function(){waOpen(card.hidden)});
    $('#waX').addEventListener('click',function(){waOpen(false)});
    $$('.wa-opt').forEach(function(b){b.addEventListener('click',function(){$('#waMsg').textContent=b.getAttribute('data-msg-'+lang);waStep(2)})});
    $('#waBack').addEventListener('click',function(){waStep(1)});
    $('#waGo').addEventListener('click',function(){
      push({event:'click_whatsapp',page:location.pathname});
      if(!WA_NUMBER){toast(T.wa);return}
      window.open('https://wa.me/'+WA_NUMBER+'?text='+encodeURIComponent($('#waMsg').textContent),'_blank','noopener');
    });
    setTimeout(function(){if(hint)hint.hidden=true},14000);
  }

  /* Eventos de medición (GTM / GA4). Ver docs/medicion-ga4-gtm.md */
  doc.addEventListener('click',function(e){
    var a=e.target.closest('a');if(!a)return;
    var h=a.getAttribute('href')||'';
    if(h.indexOf('tel:')===0)push({event:'click_phone',phone:h.slice(4),page:location.pathname});
    else if(h.indexOf('mailto:')===0)push({event:'click_email',email:h.slice(7),page:location.pathname});
    else if(a.getAttribute('data-evt')==='language_switch')push({event:'language_switch',from:lang,to:a.getAttribute('data-to')});
    else if(a.hasAttribute('data-download'))push({event:'file_download',file_name:a.getAttribute('data-download')});
  });
  $$('.faq details').forEach(function(d){d.addEventListener('toggle',function(){if(d.open){var s=$('summary',d);push({event:'faq_open',question:s?s.textContent.trim():''})}})});

  /* Seguimiento de envíos. TODO A&A: poner en data-tracking-url el enlace real del seguimiento. */
  $$('form[data-tracking]').forEach(function(f){f.addEventListener('submit',function(e){
    e.preventDefault();var n=$('input',f).value.trim();if(!n)return;
    push({event:'tracking_search',page:location.pathname});
    var u=f.getAttribute('data-tracking-url');
    if(!u){toast(T.trk);return}
    location.href=u.replace('{n}',encodeURIComponent(n));
  })});

  /* Formularios. TODO A&A: implementar el endpoint indicado en action (envío por correo a pricing@ / comercial@ y antispam). */
  var emailRx=/^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  function fld(el){return el.closest('.fld')}
  function bad(el,b){var f=fld(el);if(f)f.classList.toggle('bad',b);return !b}
  $$('form[data-form]').forEach(function(form){
    $$('input,select,textarea',form).forEach(function(el){el.addEventListener('input',function(){var f=fld(el);if(f)f.classList.remove('bad')})});
    form.addEventListener('submit',function(e){
      e.preventDefault();var ok=true;
      $$('[data-req]',form).forEach(function(el){
        var v=el.value.trim(),inv=!v||(el.type==='email'&&!emailRx.test(v));
        ok=bad(el,inv)&&ok;
      });
      var chk=$('input[type=checkbox][data-req]',form);
      if(chk){var l=chk.closest('label');if(l)l.classList.toggle('bad',!chk.checked);ok=chk.checked&&ok}
      if(!ok){var first=$('.bad input,.bad select,.bad textarea',form);if(first)first.focus();return}
      var data={};$$('input,select,textarea',form).forEach(function(el){if(el.name&&el.type!=='checkbox')data[el.name]=el.value});
      var msg=$('[data-form-msg]',form.parentNode)||$('[data-form-msg]');
      fetch(form.getAttribute('action'),{method:'POST',headers:{'Content-Type':'application/json'},body:JSON.stringify(data)})
        .then(function(r){if(!r.ok)throw new Error(r.status);
          push({event:'generate_lead',form_id:form.getAttribute('data-form'),service_type:data.servicio||data.service||'',language:lang});
          var th=$('#thanks');if(th){form.hidden=true;th.hidden=false;th.scrollIntoView()}else if(msg){msg.textContent=T.sent}
        }).catch(function(){if(msg){msg.textContent=T.err}else{toast(T.err)}});
    });
  });
  var sv=new URLSearchParams(location.search).get('servicio'),qs=$('#q-serv');
  if(sv&&qs){qs.value=sv}
  var ag=$('#again');if(ag)ag.addEventListener('click',function(){var f=$('#quoteForm');$('#thanks').hidden=true;f.hidden=false;f.reset()});

  /* Delegaciones: filtro (si existe) */
  $$('[data-filter]').forEach(function(b){b.addEventListener('click',function(){var f=b.getAttribute('data-filter');$$('[data-filter]').forEach(function(x){x.setAttribute('aria-pressed',x===b)});$$('.ocard').forEach(function(c){c.hidden=!(f==='all'||c.getAttribute('data-zone')===f)})})});
})();
