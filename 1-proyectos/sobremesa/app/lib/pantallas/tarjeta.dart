import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';
import 'package:url_launcher/url_launcher.dart';

import '../datos.dart';
import '../estado.dart';
import '../tema.dart';
import 'liga.dart';

/// Tarjeta del ganador lista para el grupo de WhatsApp.
class Tarjeta extends StatelessWidget {
  const Tarjeta({super.key});

  Future<void> _enviar(BuildContext context) async {
    final g = partida.ranking().first;
    final siguiente = partida.jornadasJugadas < jornadas.length ? jornadas[partida.jornadasJugadas] : 'la próxima sobremesa';
    final texto = '🏆 ${g.nombre} gana la ${partida.jornadaCerrada} en SOBREMESA con ${g.puntos} puntos. '
        'Próxima jornada: $siguiente. ¿Quién le quita el trono?';
    final ok = await launchUrl(Uri.parse('https://wa.me/?text=${Uri.encodeComponent(texto)}'), mode: LaunchMode.externalApplication);
    if (!ok && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('No se ha podido abrir WhatsApp.')));
    }
  }

  @override
  Widget build(BuildContext context) {
    final g = partida.ranking().first;
    return Pantalla(
      cuerpo: LayoutBuilder(builder: (context, c) {
        final w = c.maxWidth;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Transform.rotate(
            angle: -1.5 * math.pi / 180,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                border: const Border.fromBorderSide(borde),
                boxShadow: const [BoxShadow(color: C.berenjena, offset: Offset(0, 8))],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(gradient: C.degradado),
                    padding: const EdgeInsets.fromLTRB(14, 22, 14, 18),
                    child: Column(children: [
                      FittedBox(
                        child: Text('SOBREMESA',
                            style: estilo(math.min(w * .17, 64), peso: FontWeight.w800, condensada: true, color: C.blanco, alto: .9).copyWith(shadows: sombraTexto)),
                      ),
                      const SizedBox(height: 10),
                      Etiqueta('gana la ${partida.jornadaCerrada}', tam: 17),
                      const SizedBox(height: 16),
                      Disco(g, tam: math.min(w * .3, 110)),
                      const SizedBox(height: 10),
                      Text(g.nombre.toUpperCase(),
                          textAlign: TextAlign.center,
                          style: estilo(math.min(w * .12, 46), peso: FontWeight.w800, condensada: true, color: C.blanco, alto: .95).copyWith(shadows: sombraTexto)),
                      const SizedBox(height: 4),
                      Text('Liga de Navidad', style: mano(28)),
                    ]),
                  ),
                  const Cinta(alto: 14, conBorde: false),
                  Container(
                    width: double.infinity,
                    color: C.blanco,
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                    child: Text('${g.puntos} puntos en $rondasPorPartida rondas. ¿Quién le quita el trono?',
                        textAlign: TextAlign.center, style: estilo(16, alto: 1.25)),
                  ),
                ]),
              ),
            ),
          ),
        );
      }),
      pie: Column(children: [
        BotonGordo('Enviar por WhatsApp', tono: Tono.whatsapp, alPulsar: () => _enviar(context)),
        Enlace('Ver la liga', alPulsar: () => irA(context, const Liga())),
      ]),
    );
  }
}
