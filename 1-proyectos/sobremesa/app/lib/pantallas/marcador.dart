import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../hojas.dart';
import '../tema.dart';
import 'podio.dart';
import 'ronda.dart';

class Marcador extends StatelessWidget {
  const Marcador({super.key});

  @override
  Widget build(BuildContext context) {
    final r = partida.ranking();
    final lider = r.first;
    final ultima = partida.ultimaRonda;
    final penultima = partida.ronda == rondasPorPartida - 1;
    return ConPausa(
      child: Pantalla(
        arriba: BarraJuego(
          texto: 'Marcador: ronda ${partida.ronda} de $rondasPorPartida',
          ronda: partida.ronda,
          incluirActual: true,
          alPausar: () => hojaPausa(context),
        ),
        cuerpo: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Text(lider.puntos > 0 ? '👑 Va ganando ${lider.nombre}' : 'Empate a cero. ¡Todo por decidir!', style: estilo(20, peso: FontWeight.w800)),
          const SizedBox(height: 12),
          for (var i = 0; i < r.length; i++) ...[
            FilaPuntos(
              posicion: i + 1,
              jugador: r[i],
              puntos: r[i].puntos,
              destacado: partida.ganador == r[i],
              extra: partida.subida(r[i], i) > 0 ? '▲${partida.subida(r[i], i)}' : null,
            ),
            const SizedBox(height: 8),
          ],
        ]),
        pie: BotonGordo(
          ultima ? '¡Ver quién gana!' : (penultima ? '¡Última ronda!' : 'Siguiente ronda'),
          alPulsar: () {
            if (ultima) {
              partida.cerrarPartida();
              cambiarA(context, const Podio());
            } else {
              partida.siguienteRonda();
              cambiarA(context, const Ronda());
            }
          },
        ),
      ),
    );
  }
}

/// Fila de clasificación reutilizada en marcador y liga.
class FilaPuntos extends StatelessWidget {
  const FilaPuntos({super.key, required this.posicion, required this.jugador, required this.puntos, this.destacado = false, this.extra});
  final int posicion;
  final Jugador jugador;
  final int puntos;
  final bool destacado;
  final String? extra;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 62),
      padding: const EdgeInsets.fromLTRB(10, 7, 14, 7),
      decoration: BoxDecoration(
        color: destacado ? C.amarillo : C.blanco,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: C.berenjena, width: 2),
      ),
      child: Row(children: [
        SizedBox(width: 26, child: Text('$posicion', textAlign: TextAlign.center, style: estilo(24, peso: FontWeight.w800))),
        const SizedBox(width: 10),
        Disco(jugador, tam: 44, sombra: false, grosor: 2),
        const SizedBox(width: 12),
        Expanded(child: Text(jugador.nombre, style: estilo(20, peso: FontWeight.w800, alto: 1.05))),
        if (extra != null) ...[
          Text(extra!, style: estilo(15, peso: FontWeight.w800, color: const Color(0xFF0A7D5F))),
          const SizedBox(width: 8),
        ],
        Text('$puntos', style: estilo(24, peso: FontWeight.w800)),
      ]),
    );
  }
}
