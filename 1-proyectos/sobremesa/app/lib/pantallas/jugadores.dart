import 'package:material_ui/material_ui.dart';

import '../datos.dart';
import '../estado.dart';
import '../hojas.dart';
import '../tema.dart';
import 'ronda.dart';

class Jugadores extends StatelessWidget {
  const Jugadores({super.key});

  Future<void> _empezar(BuildContext context) async {
    partida.nuevaPartida();
    if (!partida.vistoComo) {
      final ok = await hojaComo(context);
      if (ok != true || !context.mounted) return;
    }
    Navigator.of(context).pushReplacement(ruta(const Ronda()));
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: partida,
      builder: (context, _) {
        final js = partida.jugadores;
        final faltan = js.length < 2;
        return PantallaConCabecera(
          titulo: '¿Quién juega?',
          subtitulo: js.isEmpty ? 'Añade a todos los que estáis en la mesa.' : 'Toca a alguien para cambiarlo.',
          cuerpo: Column(children: [
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 6,
              childAspectRatio: .74,
              children: [
                for (final j in js) _Ficha(j),
                if (js.length < maxJugadores) const _Anadir(),
              ],
            ),
            if (faltan)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text('Hacen falta al menos 2 jugadores.', textAlign: TextAlign.center, style: estilo(17, peso: FontWeight.w600, color: C.gris)),
              ),
          ]),
          pie: BotonGordo(faltan ? '¡A jugar!' : '¡A jugar! (${js.length})', alPulsar: faltan ? null : () => _empezar(context)),
        );
      },
    );
  }
}

class _Ficha extends StatelessWidget {
  const _Ficha(this.j);
  final Jugador j;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Cambiar a ${j.nombre}',
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => hojaJugador(context, jugador: j),
        child: Column(children: [
          const SizedBox(height: 4),
          Disco(j),
          const SizedBox(height: 6),
          Text(j.nombre, textAlign: TextAlign.center, maxLines: 2, overflow: TextOverflow.ellipsis, style: estilo(18, peso: FontWeight.w800, alto: 1.05)),
          if (j.peque)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(color: C.amarillo, borderRadius: BorderRadius.circular(99), border: Border.all(color: C.berenjena, width: 2)),
              child: Text('peque', style: estilo(13, peso: FontWeight.w800)),
            ),
        ]),
      ),
    );
  }
}

class _Anadir extends StatelessWidget {
  const _Anadir();

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Añadir jugador',
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: () => hojaJugador(context),
        child: Column(children: [
          const SizedBox(height: 4),
          Container(
            width: 70,
            height: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(shape: BoxShape.circle, color: C.blanco, border: Border.all(color: C.gris, width: 3)),
            child: const Icon(Icons.add_rounded, size: 40, color: C.gris),
          ),
          const SizedBox(height: 6),
          Text('Añadir', style: estilo(18, peso: FontWeight.w800, color: C.gris)),
        ]),
      ),
    );
  }
}
