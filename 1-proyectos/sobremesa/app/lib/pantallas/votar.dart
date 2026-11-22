import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../hojas.dart';
import '../sonido.dart';
import '../tema.dart';
import 'marcador.dart';
import 'punto.dart';

class Votar extends StatefulWidget {
  const Votar({super.key});

  @override
  State<Votar> createState() => _VotarState();
}

class _VotarState extends State<Votar> {
  @override
  void initState() {
    super.initState();
    efectos.hablar('¿Quién gana? A la de tres, señalad. Uno, dos, tres.');
  }

  @override
  Widget build(BuildContext context) {
    return ConPausa(
      child: Pantalla(
        arriba: BarraJuego(texto: 'Ronda ${partida.ronda} de $rondasPorPartida', ronda: partida.ronda, alPausar: () => hojaPausa(context)),
        cuerpo: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('¿QUIÉN GANA?', style: estilo(52, peso: FontWeight.w800, condensada: true, color: C.rojo, alto: .95)),
          const SizedBox(height: 6),
          Text('Señalad todos a la vez. Toca a quien más dedos tenga encima.', style: estilo(19, peso: FontWeight.w600, color: C.gris, alto: 1.3)),
          const SizedBox(height: 18),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            mainAxisSpacing: 12,
            crossAxisSpacing: 6,
            childAspectRatio: .8,
            children: [
              for (final j in partida.jugadores)
                Semantics(
                  button: true,
                  label: 'Gana ${j.nombre}',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () {
                      partida.votar(j);
                      cambiarA(context, const Punto());
                    },
                    child: Column(children: [
                      const SizedBox(height: 4),
                      Disco(j, tam: 82),
                      const SizedBox(height: 8),
                      Text(j.corto, textAlign: TextAlign.center, maxLines: 1, overflow: TextOverflow.ellipsis, style: estilo(18, peso: FontWeight.w800)),
                    ]),
                  ),
                ),
            ],
          ),
        ]),
        pie: BotonGordo('Empate: nadie suma', tono: Tono.blanco, medio: true, alPulsar: () {
          partida.empate();
          cambiarA(context, const Marcador());
        }),
      ),
    );
  }
}
