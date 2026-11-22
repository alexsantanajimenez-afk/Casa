import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../tema.dart';
import 'jugadores.dart';
import 'packs.dart';

class Portada extends StatefulWidget {
  const Portada({super.key});

  @override
  State<Portada> createState() => _PortadaState();
}

class _PortadaState extends State<Portada> with SingleTickerProviderStateMixin {
  late final _balanceo = AnimationController(vsync: this, duration: const Duration(milliseconds: 1600))..repeat(reverse: true);

  @override
  void dispose() {
    _balanceo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quieto = MediaQuery.disableAnimationsOf(context);
    return Pantalla(
      degradado: true,
      scroll: false,
      cuerpo: LayoutBuilder(builder: (context, c) {
        final logo = math.min(c.maxWidth * .34, c.maxHeight * .15);
        final cafe = math.min(c.maxHeight * .24, 200.0);
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: c.maxHeight),
            child: IntrinsicHeight(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('SOBRE\nMESA',
                      textAlign: TextAlign.center,
                      style: estilo(logo, peso: FontWeight.w800, condensada: true, color: C.blanco, alto: .86).copyWith(shadows: sombraTexto)),
                  Column(children: [
                    Etiqueta('el juego de después de comer', tam: math.min(c.maxWidth * .055, 22)),
                    const SizedBox(height: 6),
                    Text('para toda la familia', style: mano(math.min(c.maxWidth * .085, 34))),
                  ]),
                  FractionallySizedBox(widthFactor: .8, child: const Cinta()),
                  AnimatedBuilder(
                    animation: _balanceo,
                    builder: (_, child) => Transform.rotate(
                      angle: quieto ? 0 : (Curves.easeInOut.transform(_balanceo.value) - .5) * .14,
                      child: child,
                    ),
                    child: Cafetera(alto: cafe),
                  ),
                  if (partida.jornadasJugadas > 0) _PildoraLiga(),
                ],
              ),
            ),
          ),
        );
      }),
      pie: Column(children: [
        BotonGordo('¡A jugar!', tono: Tono.blanco, alPulsar: () => irA(context, const Jugadores())),
        Enlace('Ver packs', claro: true, alPulsar: () => irA(context, const Packs())),
      ]),
    );
  }
}

class _PildoraLiga extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final j = math.min(partida.jornadasJugadas + 1, jornadas.length);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(color: C.blanco, borderRadius: BorderRadius.circular(18), border: const Border.fromBorderSide(borde)),
      child: Row(children: [
        const Text('🏆', style: TextStyle(fontSize: 28)),
        const SizedBox(width: 10),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Liga de Navidad', style: estilo(18, peso: FontWeight.w800)),
            Text('Jornada $j de ${jornadas.length}: ${partida.jornadaActual}', style: estilo(16, peso: FontWeight.w600)),
          ]),
        ),
      ]),
    );
  }
}
