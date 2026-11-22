import 'dart:async';
import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../hojas.dart';
import '../sonido.dart';
import '../tema.dart';
import 'votar.dart';

/// 3, 2, 1, ¡CARAS! y tres segundos para aguantar la cara.
class Cuenta extends StatefulWidget {
  const Cuenta({super.key});

  @override
  State<Cuenta> createState() => _CuentaState();
}

class _CuentaState extends State<Cuenta> {
  String _texto = '3';
  bool _aguantando = false;
  final List<Timer> _timers = [];

  @override
  void initState() {
    super.initState();
    const pasos = ['3', '2', '1', '¡CARAS!'];
    for (var i = 0; i < pasos.length; i++) {
      _timers.add(Timer(Duration(milliseconds: 850 * i), () {
        if (!mounted) return;
        setState(() => _texto = pasos[i]);
        if (i < 3) {
          efectos.tic();
          efectos.hablar(pasos[i]);
        } else {
          efectos.ya();
          efectos.hablar('¡Caras!');
        }
      }));
    }
    _timers.add(Timer(const Duration(milliseconds: 850 * 3 + 700), () {
      if (mounted) setState(() => _aguantando = true);
    }));
    _timers.add(Timer(const Duration(milliseconds: 850 * 3 + 700 + 3000), () {
      if (mounted) cambiarA(context, const Votar());
    }));
  }

  @override
  void dispose() {
    for (final t in _timers) {
      t.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ConPausa(
      child: Pantalla(
        degradado: true,
        scroll: false,
        cuerpo: LayoutBuilder(builder: (context, c) {
          final grande = math.min(c.maxWidth * .7, c.maxHeight * .46);
          return Center(
            child: _aguantando
                ? Column(mainAxisSize: MainAxisSize.min, children: [
                    Text('¡AGUANTAD\nLA CARA!',
                        textAlign: TextAlign.center,
                        style: estilo(math.min(c.maxWidth * .16, 72), peso: FontWeight.w800, condensada: true, color: C.blanco, alto: .9)
                            .copyWith(shadows: sombraTexto)),
                    const SizedBox(height: 24),
                    Container(
                      height: 24,
                      width: c.maxWidth * .84,
                      decoration: BoxDecoration(
                        color: C.blanco.withValues(alpha: .25),
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(color: C.blanco, width: 3),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(99),
                        child: TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration: const Duration(seconds: 3),
                          builder: (_, v, _) => FractionallySizedBox(alignment: Alignment.centerLeft, widthFactor: v, child: Container(color: C.blanco)),
                        ),
                      ),
                    ),
                  ])
                : TweenAnimationBuilder<double>(
                    key: ValueKey(_texto),
                    tween: Tween(begin: 1.8, end: 1),
                    duration: const Duration(milliseconds: 450),
                    curve: Curves.elasticOut,
                    builder: (_, v, child) => Transform.scale(scale: v, child: child),
                    child: FittedBox(
                      child: Text(_texto,
                          style: estilo(_texto.length > 1 ? grande * .42 : grande, peso: FontWeight.w800, condensada: true, color: C.blanco, alto: 1)
                              .copyWith(shadows: sombraTexto)),
                    ),
                  ),
          );
        }),
      ),
    );
  }
}
