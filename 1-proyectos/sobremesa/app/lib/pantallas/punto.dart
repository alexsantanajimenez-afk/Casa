import 'dart:async';
import 'dart:math' as math;

import 'package:confetti/confetti.dart';
import 'package:material_ui/material_ui.dart';

import '../estado.dart';
import '../hojas.dart';
import '../sonido.dart';
import '../tema.dart';
import 'marcador.dart';

/// Celebración del ganador de la ronda. Pasa sola al marcador.
class Punto extends StatefulWidget {
  const Punto({super.key});

  @override
  State<Punto> createState() => _PuntoState();
}

class _PuntoState extends State<Punto> {
  final _confeti = ConfettiController(duration: const Duration(milliseconds: 900));
  late final String _chiste = partida.chiste();
  Timer? _auto;
  bool _ido = false;

  @override
  void initState() {
    super.initState();
    final g = partida.ganador!;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!MediaQuery.disableAnimationsOf(context)) _confeti.play();
    });
    efectos.punto();
    efectos.hablar('¡${partida.puntosGanador} puntos para ${g.nombre}! $_chiste');
    _auto = Timer(const Duration(milliseconds: 3200), _seguir);
  }

  void _seguir() {
    if (_ido || !mounted) return;
    _ido = true;
    cambiarA(context, const Marcador());
  }

  @override
  void dispose() {
    _auto?.cancel();
    _confeti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final g = partida.ganador!;
    return ConPausa(
      child: Pantalla(
        degradado: true,
        scroll: false,
        fondo: Align(
          alignment: Alignment.topCenter,
          child: ConfettiWidget(
            confettiController: _confeti,
            blastDirectionality: BlastDirectionality.explosive,
            numberOfParticles: 40,
            gravity: .25,
            colors: const [...C.cinta, C.blanco],
          ),
        ),
        cuerpo: LayoutBuilder(builder: (context, c) {
          final disco = math.min(c.maxWidth * .42, c.maxHeight * .3);
          return Center(
            child: SingleChildScrollView(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                TweenAnimationBuilder<double>(
                  tween: Tween(begin: .2, end: 1),
                  duration: const Duration(milliseconds: 700),
                  curve: Curves.elasticOut,
                  builder: (_, v, child) => Transform.scale(scale: v, child: child),
                  child: Disco(g, tam: disco, grosor: 5),
                ),
                const SizedBox(height: 10),
                Text('+${partida.puntosGanador}',
                    style: estilo(math.min(c.maxWidth * .3, 130), peso: FontWeight.w800, condensada: true, color: C.blanco, alto: .95)
                        .copyWith(shadows: sombraTexto)),
                Text(g.nombre, textAlign: TextAlign.center, style: estilo(32, peso: FontWeight.w800, color: C.blanco)),
                const SizedBox(height: 14),
                Transform.rotate(
                  angle: -1.5 * math.pi / 180,
                  child: Container(
                    constraints: const BoxConstraints(maxWidth: 320),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(color: C.blanco, borderRadius: BorderRadius.circular(18), border: const Border.fromBorderSide(borde)),
                    child: Text(_chiste, textAlign: TextAlign.center, style: estilo(20, peso: FontWeight.w800, alto: 1.2)),
                  ),
                ),
              ]),
            ),
          );
        }),
        pie: BotonGordo('Ver marcador', tono: Tono.blanco, alPulsar: _seguir),
      ),
    );
  }
}
