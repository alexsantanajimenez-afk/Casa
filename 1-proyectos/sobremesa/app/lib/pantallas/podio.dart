import 'dart:async';
import 'dart:math' as math;

import 'package:confetti/confetti.dart';
import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../sonido.dart';
import '../tema.dart';
import 'liga.dart';
import 'tarjeta.dart';

/// Podio que se revela de tercero a primero.
class Podio extends StatefulWidget {
  const Podio({super.key});

  @override
  State<Podio> createState() => _PodioState();
}

class _PodioState extends State<Podio> {
  final _confeti = ConfettiController(duration: const Duration(milliseconds: 1400));
  final Set<int> _visibles = {};
  final List<Timer> _timers = [];
  bool _fin = false;

  @override
  void initState() {
    super.initState();
    final r = partida.ranking();
    efectos.hablar('Redoble de tambores…');
    final pasos = [(3, 800), (2, 1600), (1, 2900)];
    for (final (pos, ms) in pasos) {
      if (pos > r.length) continue;
      _timers.add(Timer(Duration(milliseconds: ms), () {
        if (!mounted) return;
        setState(() => _visibles.add(pos));
        if (pos == 1) {
          efectos.fanfarria();
          efectos.hablar('¡Y gana ${r.first.nombre}!');
          if (!MediaQuery.disableAnimationsOf(context)) _confeti.play();
          setState(() => _fin = true);
        } else {
          efectos.tic();
        }
      }));
    }
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    _confeti.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final r = partida.ranking();
    final cara = partida.caraDeLaNoche();
    return Pantalla(
      degradado: true,
      fondo: Align(
        alignment: Alignment.topCenter,
        child: ConfettiWidget(
          confettiController: _confeti,
          blastDirectionality: BlastDirectionality.explosive,
          numberOfParticles: 50,
          gravity: .22,
          colors: const [...C.cinta, C.blanco],
        ),
      ),
      cuerpo: LayoutBuilder(builder: (context, c) {
        final h = MediaQuery.sizeOf(context).height;
        return Column(children: [
          Text('¡Y GANA…!', style: estilo(math.min(c.maxWidth * .15, 62), peso: FontWeight.w800, condensada: true, color: C.blanco).copyWith(shadows: sombraTexto)),
          const SizedBox(height: 18),
          Row(crossAxisAlignment: CrossAxisAlignment.end, children: [
            if (r.length > 1) Expanded(child: _Puesto(r[1], 2, math.min(h * .11, 90), C.blanco, _visibles.contains(2))),
            const SizedBox(width: 8),
            Expanded(child: _Puesto(r[0], 1, math.min(h * .17, 130), C.amarillo, _visibles.contains(1), grande: true)),
            const SizedBox(width: 8),
            if (r.length > 2) Expanded(child: _Puesto(r[2], 3, math.min(h * .08, 66), const Color(0xFFFFB27A), _visibles.contains(3))),
            if (r.length == 2) const Expanded(child: SizedBox()),
          ]),
          Container(height: 3, color: C.berenjena),
          const SizedBox(height: 14),
          AnimatedOpacity(
            opacity: _fin && cara != null ? 1 : 0,
            duration: const Duration(milliseconds: 400),
            child: cara == null
                ? const SizedBox()
                : Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                    decoration: BoxDecoration(color: C.blanco, borderRadius: BorderRadius.circular(99), border: Border.all(color: C.berenjena, width: 2)),
                    child: Text('😝 Cara de la noche: ${cara.corto}', style: estilo(16, peso: FontWeight.w800)),
                  ),
          ),
        ]);
      }),
      pie: Column(children: [
        BotonGordo('Compartir el resultado', tono: Tono.blanco, alPulsar: () => irA(context, const Tarjeta())),
        Enlace('Ver la liga', claro: true, alPulsar: () => irA(context, const Liga())),
      ]),
    );
  }
}

class _Puesto extends StatelessWidget {
  const _Puesto(this.j, this.pos, this.alto, this.color, this.visible, {this.grande = false});
  final Jugador j;
  final int pos;
  final double alto;
  final Color color;
  final bool visible;
  final bool grande;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: visible ? 1 : 0,
      duration: const Duration(milliseconds: 400),
      child: AnimatedSlide(
        offset: visible ? Offset.zero : const Offset(0, .15),
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeOutBack,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Disco(j, tam: grande ? 88 : 66),
          const SizedBox(height: 6),
          Text(j.nombre, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: estilo(18, peso: FontWeight.w800, color: C.blanco, alto: 1.05)),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 1),
            decoration: BoxDecoration(color: C.blanco, borderRadius: BorderRadius.circular(99)),
            child: Text('${j.puntos} pts', style: estilo(15, peso: FontWeight.w800)),
          ),
          const SizedBox(height: 6),
          Container(
            height: alto,
            width: double.infinity,
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.only(top: 4),
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              border: const Border(top: borde, left: borde, right: borde),
            ),
            child: Text('$pos', style: estilo(44, peso: FontWeight.w800, condensada: true)),
          ),
        ]),
      ),
    );
  }
}
