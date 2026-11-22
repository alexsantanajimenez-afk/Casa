import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../tema.dart';
import 'marcador.dart';
import 'portada.dart';
import 'ronda.dart';

class Liga extends StatelessWidget {
  const Liga({super.key});

  @override
  Widget build(BuildContext context) {
    final tabla = partida.tablaLiga();
    final hechas = partida.jornadasJugadas;
    return PantallaConCabecera(
      titulo: 'Liga de Navidad',
      subtitulo: 'Cuatro sobremesas, un campeón.',
      cuerpo: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 2.6,
          children: [
            for (var i = 0; i < jornadas.length; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: i < hechas ? const Color(0xFFC9F2E5) : (i == hechas ? C.amarillo : C.blanco),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: C.berenjena, width: 2),
                ),
                child: Row(children: [
                  Text(iconosJornada[i], style: const TextStyle(fontSize: 24)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      FittedBox(child: Text(jornadas[i], style: estilo(16, peso: FontWeight.w800))),
                      Text(i < hechas ? 'Jugada' : (i == hechas ? 'La próxima' : 'Pendiente'), style: estilo(13, peso: FontWeight.w600, color: C.gris)),
                    ]),
                  ),
                ]),
              ),
          ],
        ),
        const SizedBox(height: 14),
        for (var i = 0; i < tabla.length; i++) ...[
          FilaPuntos(
            posicion: i + 1,
            jugador: tabla[i].key,
            puntos: tabla[i].value,
            destacado: i == 0 && tabla[i].value > 0,
            extra: tabla[i].key.puntos > 0 ? '+${tabla[i].key.puntos}' : null,
          ),
          const SizedBox(height: 8),
        ],
      ]),
      pie: Column(children: [
        BotonGordo('Otra partida', alPulsar: () {
          partida.nuevaPartida();
          Navigator.of(context).pushAndRemoveUntil(ruta(const Ronda()), (r) => false);
        }),
        Enlace('Volver al inicio', alPulsar: () => Navigator.of(context).pushAndRemoveUntil(ruta(const Portada()), (r) => false)),
      ]),
    );
  }
}
