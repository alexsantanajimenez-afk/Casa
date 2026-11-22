import 'package:material_ui/material_ui.dart';

import 'datos.dart';
import 'estado.dart';
import 'pantallas/podio.dart';
import 'pantallas/portada.dart';
import 'sonido.dart';
import 'tema.dart';

Future<T?> abrirHoja<T>(BuildContext context, Widget Function(BuildContext) contenido, {bool cerrable = true}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true,
    isDismissible: cerrable,
    enableDrag: cerrable,
    backgroundColor: C.crema,
    barrierColor: C.berenjena.withValues(alpha: .5),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      side: borde,
    ),
    builder: (ctx) => Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(ctx).bottom),
      child: SafeArea(
        top: false,
        child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(20, 20, 20, 16), child: contenido(ctx)),
      ),
    ),
  );
}

/// Interruptor grande con título y explicación.
class Interruptor extends StatelessWidget {
  const Interruptor({super.key, required this.titulo, required this.detalle, required this.valor, required this.alCambiar});
  final String titulo;
  final String detalle;
  final bool valor;
  final ValueChanged<bool> alCambiar;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: C.blanco,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18), side: const BorderSide(color: C.berenjena, width: 2)),
      child: SwitchListTile(
        value: valor,
        onChanged: alCambiar,
        activeThumbColor: C.blanco,
        activeTrackColor: C.menta,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 2),
        title: Text(titulo, style: estilo(19, peso: FontWeight.w800)),
        subtitle: Text(detalle, style: estilo(15, peso: FontWeight.w600, color: C.gris)),
      ),
    );
  }
}

// ================= añadir o cambiar jugador =================
Future<void> hojaJugador(BuildContext context, {Jugador? jugador}) {
  final ctrl = TextEditingController(text: jugador?.nombre ?? '');
  var peque = jugador?.peque ?? false;
  return abrirHoja(context, (ctx) {
    return StatefulBuilder(builder: (ctx, set) {
      void guardar() {
        final n = ctrl.text.trim();
        if (n.isEmpty) return;
        if (jugador == null) {
          partida.anadir(n, peque);
        } else {
          partida.editar(jugador, n, peque);
        }
        efectos.pop();
        Navigator.pop(ctx);
      }

      return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text(jugador == null ? 'Nuevo jugador' : 'Cambiar a ${jugador.nombre}', style: estilo(30, peso: FontWeight.w800)),
        const SizedBox(height: 14),
        TextField(
          controller: ctrl,
          autofocus: true,
          maxLength: 18,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.done,
          onSubmitted: (_) => guardar(),
          style: estilo(24),
          decoration: InputDecoration(
            hintText: 'Nombre',
            counterText: '',
            filled: true,
            fillColor: C.blanco,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: borde),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(18), borderSide: const BorderSide(color: C.azul, width: 3)),
          ),
        ),
        const SizedBox(height: 12),
        Interruptor(titulo: 'Es peque', detalle: 'Tendrá frases más fáciles', valor: peque, alCambiar: (v) => set(() => peque = v)),
        const SizedBox(height: 16),
        BotonGordo(jugador == null ? 'Añadir' : 'Guardar', medio: true, alPulsar: guardar),
        if (jugador != null && partida.jugadores.length > 2)
          Enlace('Quitar de la partida', alPulsar: () {
            partida.quitar(jugador);
            Navigator.pop(ctx);
          }),
        Enlace('Cancelar', alPulsar: () => Navigator.pop(ctx)),
      ]);
    });
  });
}

// ================= cómo se juega (solo la primera vez) =================
Future<bool?> hojaComo(BuildContext context) {
  efectos.hablar('Os digo una cara. La ponéis todos a la vez. Y señaláis la mejor.');
  return abrirHoja<bool>(context, cerrable: false, (ctx) {
    Widget paso(String emoji, String texto) => Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
            decoration: BoxDecoration(color: C.blanco, borderRadius: BorderRadius.circular(18), border: const Border.fromBorderSide(borde)),
            child: Column(children: [
              Text(emoji, style: const TextStyle(fontSize: 34)),
              const SizedBox(height: 6),
              Text(texto, textAlign: TextAlign.center, style: estilo(16, peso: FontWeight.w800)),
            ]),
          ),
        );
    return Column(children: [
      const Cafetera(alto: 90),
      const SizedBox(height: 12),
      Text('Os digo una cara. La ponéis todos a la vez. Señaláis la mejor.',
          textAlign: TextAlign.center, style: estilo(30, peso: FontWeight.w800, alto: 1.08)),
      const SizedBox(height: 16),
      Row(children: [paso('👂', 'Escuchad'), const SizedBox(width: 8), paso('😝', '¡Caras!'), const SizedBox(width: 8), paso('👉', 'Señalad')]),
      const SizedBox(height: 18),
      BotonGordo('¡Vamos!', alPulsar: () {
        partida.marcarComoVisto();
        Navigator.pop(ctx, true);
      }),
    ]);
  });
}

// ================= pausa =================
Future<void> hojaPausa(BuildContext context) {
  return abrirHoja(context, (ctx) {
    return ListenableBuilder(
      listenable: partida,
      builder: (ctx, _) => Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text('Pausa', style: estilo(30, peso: FontWeight.w800)),
        const SizedBox(height: 14),
        Interruptor(
          titulo: 'Voz de la cafetera',
          detalle: 'Lee cada frase en voz alta',
          valor: partida.voz,
          alCambiar: (v) {
            partida.cambiarVoz(v);
            if (!v) efectos.callar();
          },
        ),
        const SizedBox(height: 10),
        Interruptor(
          titulo: 'Sonidos',
          detalle: 'Cuenta atrás, puntos y fanfarria',
          valor: partida.sonido,
          alCambiar: partida.cambiarSonido,
        ),
        const SizedBox(height: 16),
        BotonGordo('Seguir jugando', medio: true, alPulsar: () => Navigator.pop(ctx)),
        Enlace('Terminar y ver el podio', alPulsar: () {
          Navigator.pop(ctx);
          partida.cerrarPartida();
          Navigator.of(context).pushAndRemoveUntil(ruta(const Podio()), (r) => r.isFirst);
        }),
        Enlace('Salir al inicio', alPulsar: () {
          Navigator.pop(ctx);
          efectos.callar();
          Navigator.of(context).pushAndRemoveUntil(ruta(const Portada()), (r) => false);
        }),
      ]),
    );
  });
}

/// Envuelve una pantalla de juego: el botón atrás del sistema abre la pausa.
class ConPausa extends StatelessWidget {
  const ConPausa({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) hojaPausa(context);
      },
      child: child,
    );
  }
}
