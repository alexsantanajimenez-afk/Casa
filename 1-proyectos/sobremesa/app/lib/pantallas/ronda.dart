import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../hojas.dart';
import '../sonido.dart';
import '../tema.dart';
import 'cuenta.dart';

class Ronda extends StatefulWidget {
  const Ronda({super.key});

  @override
  State<Ronda> createState() => _RondaState();
}

class _RondaState extends State<Ronda> {
  @override
  void initState() {
    super.initState();
    if (partida.frase == null) partida.elegirFrase();
    _leer();
  }

  void _leer() {
    final f = partida.frase!;
    efectos.hablar('${partida.ultimaRonda ? '¡Última ronda! Vale el doble. ' : ''}'
        'Poned cara de ${f.$1}.${partida.hayPeques ? ' Los peques: ${f.$2}.' : ''}');
  }

  @override
  Widget build(BuildContext context) {
    return ConPausa(
      child: ListenableBuilder(
        listenable: partida,
        builder: (context, _) {
          final f = partida.frase!;
          return Pantalla(
            scroll: false,
            arriba: BarraJuego(
              texto: 'Ronda ${partida.ronda} de $rondasPorPartida',
              ronda: partida.ronda,
              alPausar: () => hojaPausa(context),
            ),
            cuerpo: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
              Text('Poned cara de…', style: estilo(22, peso: FontWeight.w800, color: C.gris)),
              const SizedBox(height: 12),
              Expanded(
                child: Stack(clipBehavior: Clip.none, children: [
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 180),
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: C.blanco,
                      borderRadius: BorderRadius.circular(30),
                      border: const Border.fromBorderSide(borde),
                      boxShadow: const [BoxShadow(color: C.berenjena, offset: Offset(0, 8))],
                    ),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                      Expanded(child: TextoAjustado(f.$1)),
                      if (partida.hayPeques)
                        Container(
                          margin: const EdgeInsets.only(top: 12),
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                          decoration: BoxDecoration(color: C.crema, borderRadius: BorderRadius.circular(16)),
                          child: Row(children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 1),
                              decoration: BoxDecoration(color: C.amarillo, borderRadius: BorderRadius.circular(99), border: Border.all(color: C.berenjena, width: 2)),
                              child: Text('Peques', style: estilo(14, peso: FontWeight.w800)),
                            ),
                            const SizedBox(width: 10),
                            Expanded(child: Text(f.$2, style: estilo(19))),
                          ]),
                        ),
                    ]),
                  ),
                  if (partida.ultimaRonda)
                    Positioned(
                      top: -18,
                      left: 16,
                      child: Transform.rotate(
                        angle: -3 * math.pi / 180,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 3),
                          decoration: BoxDecoration(color: C.azul, borderRadius: BorderRadius.circular(99), border: const Border.fromBorderSide(borde)),
                          child: Text('¡Última ronda! Vale doble', style: estilo(18, peso: FontWeight.w800, color: C.blanco)),
                        ),
                      ),
                    ),
                ]),
              ),
              const SizedBox(height: 16),
              Center(
                child: OutlinedButton.icon(
                  onPressed: () {
                    efectos.pop();
                    partida.elegirFrase();
                    _leer();
                  },
                  icon: const Icon(Icons.shuffle_rounded, color: C.berenjena),
                  label: Text('Otra frase', style: estilo(18, peso: FontWeight.w800)),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: C.blanco,
                    minimumSize: const Size(44, 46),
                    side: const BorderSide(color: C.berenjena, width: 2),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),
              ),
            ]),
            pie: BotonGordo('3, 2, 1… ¡CARAS!', alPulsar: () => cambiarA(context, const Cuenta())),
          );
        },
      ),
    );
  }
}
