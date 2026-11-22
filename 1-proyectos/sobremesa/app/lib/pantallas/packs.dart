import 'package:material_ui/material_ui.dart';

import '../tema.dart';

class Packs extends StatelessWidget {
  const Packs({super.key});

  @override
  Widget build(BuildContext context) {
    void pronto() => ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(const SnackBar(content: Text('Los packs de pago llegan muy pronto.')));

    return PantallaConCabecera(
      titulo: 'Packs',
      subtitulo: 'Frases nuevas para cada ocasión.',
      cuerpo: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        const _Pack('🍽️', Color(0xFFFFD9CF), 'Clásica', 'Las caras de siempre, para cualquier comida', 'Gratis', tienes: true),
        _Pack('🎄', const Color(0xFFFFF0BF), 'Navidad', 'Cuñados, turrón y lotería', '3,99 €', alPulsar: pronto),
        _Pack('🎂', const Color(0xFFD7F5EC), 'Cumpleaños', 'Para la merienda con los primos', '2,99 €', alPulsar: pronto),
        _Pack('💼', const Color(0xFFDCE6FF), 'Cena de empresa', 'Sin pasarse con el jefe delante', '2,99 €', alPulsar: pronto),
        Container(
          margin: const EdgeInsets.only(top: 4),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(color: C.berenjena, borderRadius: BorderRadius.circular(22)),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Pase de temporada: 6,99 €', style: estilo(22, peso: FontWeight.w800, color: C.blanco)),
            const SizedBox(height: 4),
            Text('Todos los packs del año y los que salgan cada mes. Se paga una vez.',
                style: estilo(16, peso: FontWeight.w500, color: C.blanco, alto: 1.3)),
          ]),
        ),
      ]),
      pie: BotonGordo('Volver', tono: Tono.blanco, medio: true, alPulsar: () => Navigator.pop(context)),
    );
  }
}

class _Pack extends StatelessWidget {
  const _Pack(this.icono, this.fondo, this.titulo, this.detalle, this.precio, {this.tienes = false, this.alPulsar});
  final String icono;
  final Color fondo;
  final String titulo;
  final String detalle;
  final String precio;
  final bool tienes;
  final VoidCallback? alPulsar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        color: C.blanco,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22), side: borde),
        child: InkWell(
          borderRadius: BorderRadius.circular(22),
          onTap: alPulsar,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Container(
                width: 56,
                height: 56,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: fondo, borderRadius: BorderRadius.circular(16), border: Border.all(color: C.berenjena, width: 2)),
                child: Text(icono, style: const TextStyle(fontSize: 30)),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(titulo, style: estilo(20, peso: FontWeight.w800, alto: 1.05)),
                  const SizedBox(height: 3),
                  Text(detalle, style: estilo(15, peso: FontWeight.w600, color: C.gris, alto: 1.25)),
                ]),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 5),
                decoration: BoxDecoration(
                  color: tienes ? C.menta : C.crema,
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: C.berenjena, width: 2),
                ),
                child: Text(precio, style: estilo(17, peso: FontWeight.w800)),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
