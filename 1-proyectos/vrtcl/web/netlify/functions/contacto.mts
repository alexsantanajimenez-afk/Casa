// Recibe el formulario de vrtcl.tech, lo guarda en Supabase (UE) sin exponer la clave en la web
// y avisa por email a hello@vrtcl.tech a través del SMTP de DonDominio.
import nodemailer from "nodemailer"

const esc = (v: string) => v.replace(/[&<>"']/g, (c) => ({ "&": "&amp;", "<": "&lt;", ">": "&gt;", '"': "&quot;", "'": "&#39;" }[c] as string))

async function aviso(row: Record<string, any>) {
  const pass = Netlify.env.get("SMTP_PASS")
  if (!pass) { console.error("contacto: falta SMTP_PASS, no se envía aviso"); return false }
  const user = Netlify.env.get("SMTP_USER") || "hello@vrtcl.tech"
  const t = nodemailer.createTransport({
    host: Netlify.env.get("SMTP_HOST") || "smtp.dondominio.com", port: 587, secure: false, requireTLS: true,
    auth: { user, pass }, connectionTimeout: 8000, greetingTimeout: 8000, socketTimeout: 8000,
  })
  const utm = row.utm ? Object.entries(row.utm).map(([k, v]) => `${k}=${v}`).join(", ") : "—"
  const lineas: [string, string][] = [
    ["Nombre", row.nombre], ["Email", row.email], ["Teléfono", `${row.prefijo} ${row.telefono}`], ["Empresa", row.empresa],
    ["Mensaje", row.mensaje || "—"], ["Página", row.pagina || "—"], ["Campaña", utm],
  ]
  const text = lineas.map(([k, v]) => `${k}: ${v}`).join("\n") + "\n\nResponde a este email para escribir directamente al contacto.\nGuardado en Supabase › vrtcl_contactos."
  const html = '<div style="font-family:system-ui,sans-serif;font-size:15px;line-height:1.5;color:#161616">' +
    '<p style="margin:0 0 16px"><b>Nuevo contacto desde vrtcl.tech</b></p><table style="border-collapse:collapse">' +
    lineas.map(([k, v]) => `<tr><td style="padding:4px 16px 4px 0;color:#6e6e6e;vertical-align:top">${k}</td><td style="padding:4px 0;white-space:pre-wrap">${esc(String(v))}</td></tr>`).join("") +
    '</table><p style="margin:16px 0 0;color:#6e6e6e">Responde a este email para escribir directamente al contacto.</p></div>'
  await t.sendMail({
    from: `"VRTCL web" <${user}>`, to: "hello@vrtcl.tech", replyTo: `"${row.nombre.replace(/"/g, "")}" <${row.email}>`,
    subject: `Nuevo contacto web: ${row.empresa} · ${row.nombre}`.slice(0, 160), text, html,
  })
  return true
}
const json = (body: unknown, status = 200) =>
  new Response(JSON.stringify(body), { status, headers: { "content-type": "application/json; charset=utf-8", "cache-control": "no-store" } })

const str = (v: unknown, max: number) => (typeof v === "string" ? v.trim().slice(0, max) : "")
const UTM_KEYS = ["utm_source", "utm_medium", "utm_campaign", "utm_term", "utm_content"]

export default async (req: Request) => {
  if (req.method !== "POST") return json({ ok: false, error: "method" }, 405)
  if (!(req.headers.get("content-type") || "").includes("application/json")) return json({ ok: false, error: "type" }, 415)
  let d: Record<string, unknown>
  try { d = await req.json() } catch { return json({ ok: false, error: "json" }, 400) }
  if (!d || typeof d !== "object") return json({ ok: false, error: "json" }, 400)

  // campo trampa: si viene relleno es un bot; respondemos ok sin guardar
  if (str(d["bot-field"], 200)) return json({ ok: true }, 200)

  const prefijo = str(d.prefijo, 5)
  const telefono = str(d.telefono, 30).replace(/[\s.\-()]/g, "")
  let utm: Record<string, string> | null = null
  if (d.utm && typeof d.utm === "object") {
    const u: Record<string, string> = {}
    for (const k of UTM_KEYS) { const v = str((d.utm as Record<string, unknown>)[k], 100); if (v) u[k] = v }
    if (Object.keys(u).length) utm = u
  }
  const row = {
    nombre: str(d.nombre, 200),
    email: str(d.email, 254).toLowerCase(),
    prefijo,
    telefono,
    empresa: str(d.empresa, 200),
    mensaje: str(d.mensaje, 5000) || null,
    privacidad: d.privacidad === true || d.privacidad === "on",
    pagina: str(d.pagina, 500) || null,
    utm,
  }

  const errors: string[] = []
  if (row.nombre.length < 2) errors.push("nombre")
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(row.email)) errors.push("email")
  if (!/^\+\d{1,4}$/.test(prefijo)) errors.push("prefijo")
  if (prefijo === "+34" ? !/^[6789]\d{8}$/.test(telefono) : !/^\d{6,14}$/.test(telefono)) errors.push("telefono")
  if (!row.empresa) errors.push("empresa")
  if (!row.privacidad) errors.push("privacidad")
  if (errors.length) return json({ ok: false, error: "invalid", fields: errors }, 400)

  const url = Netlify.env.get("SUPABASE_URL")
  const key = Netlify.env.get("SUPABASE_KEY")
  if (!url || !key) { console.error("contacto: faltan SUPABASE_URL o SUPABASE_KEY"); return json({ ok: false, error: "config" }, 500) }

  const r = await fetch(`${url}/rest/v1/vrtcl_contactos`, {
    method: "POST",
    headers: { apikey: key, "content-type": "application/json", prefer: "return=minimal" },
    body: JSON.stringify(row),
  })
  if (!r.ok) { console.error("contacto: supabase", r.status, (await r.text()).slice(0, 300)); return json({ ok: false, error: "store" }, 502) }
  // el contacto ya está guardado: si el aviso falla, no se pierde el lead
  let avisado = false
  try { avisado = await aviso(row) } catch (e) { console.error("contacto: aviso email falló", String(e).slice(0, 300)) }
  return json({ ok: true, aviso: avisado }, 201)
}

export const config = { path: "/api/contacto", method: "POST" }
