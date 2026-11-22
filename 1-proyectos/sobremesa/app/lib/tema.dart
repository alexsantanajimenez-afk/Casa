import 'dart:math' as math;

import 'package:material_ui/material_ui.dart';

import 'datos.dart';
import 'sonido.dart';

// ================= colores =================
class C {
  static const rojo = Color(0xFFFF2E3A);
  static const naranja = Color(0xFFFF6A1A);
  static const amarillo = Color(0xFFFFC21A);
  static const menta = Color(0xFF1FC79B);
  static const azul = Color(0xFF2F6BFF);
  static const berenjena = Color(0xFF2A1036);
  static const crema = Color(0xFFFFF6E9);
  static const gris = Color(0xFF5E4C69);
  static const blanco = Colors.white;
  static const verdeWa = Color(0xFF25D366);
  static const cinta = [rojo, naranja, amarillo, menta, azul];
  static const degradado = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFFF2E3A), Color(0xFFFF4A22), Color(0xFFFF7A00)],
    stops: [0, .48, 1],
  );
}

const borde = BorderSide(color: C.berenjena, width: 3);

ThemeData temaApp() => ThemeData(
      useMaterial3: true,
      fontFamily: 'Bricolage',
      scaffoldBackgroundColor: C.crema,
      colorScheme: ColorScheme.fromSeed(seedColor: C.rojo, surface: C.crema),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: C.berenjena,
        contentTextStyle: estilo(17, color: C.blanco),
        behavior: SnackBarBehavior.floating,
      ),
    );

// ================= tipografía =================
/// Bricolage Grotesque variable. [condensada] estrecha el ancho para titulares de impacto.
TextStyle estilo(double size,
    {FontWeight peso = FontWeight.w700, Color? color, bool condensada = false, double alto = 1.1}) {
  return TextStyle(
    fontFamily: 'Bricolage',
    fontSize: size,
    color: color ?? C.berenjena,
    height: alto,
    fontWeight: peso,
    fontVariations: [
      FontVariation('wght', peso.value.toDouble()),
      FontVariation('wdth', condensada ? 75 : 100),
      FontVariation('opsz', size.clamp(12, 96).toDouble()),
    ],
  );
}

TextStyle mano(double size, {Color color = C.blanco}) => TextStyle(
      fontFamily: 'Caveat',
      fontSize: size,
      color: color,
      height: 1,
      fontVariations: const [FontVariation('wght', 700)],
    );

const sombraTexto = [Shadow(color: Color(0x592A1036), offset: Offset(0, 5))];

// ================= navegación =================
Route<T> ruta<T>(Widget pantalla) => PageRouteBuilder<T>(
      transitionDuration: const Duration(milliseconds: 260),
      pageBuilder: (_, _, _) => pantalla,
      transitionsBuilder: (_, a, _, child) => FadeTransition(
        opacity: a,
        child: SlideTransition(
          position: Tween(begin: const Offset(0, .04), end: Offset.zero).animate(CurvedAnimation(parent: a, curve: Curves.easeOut)),
          child: child,
        ),
      ),
    );

void irA(BuildContext context, Widget pantalla) => Navigator.of(context).push(ruta(pantalla));
void cambiarA(BuildContext context, Widget pantalla) => Navigator.of(context).pushReplacement(ruta(pantalla));

// ================= estructura de pantalla =================
/// Cabecera opcional, cuerpo que hace scroll si no cabe y pie con el botón principal siempre visible.
class Pantalla extends StatelessWidget {
  const Pantalla({super.key, this.arriba, required this.cuerpo, this.pie, this.degradado = false, this.scroll = true, this.fondo});

  final Widget? arriba;
  final Widget cuerpo;
  final Widget? pie;
  final bool degradado;
  final bool scroll;
  final Widget? fondo;

  @override
  Widget build(BuildContext context) {
    final contenido = Column(
      children: [
        ?arriba,
        Expanded(
          child: scroll
              ? SingleChildScrollView(padding: const EdgeInsets.fromLTRB(20, 14, 20, 8), child: cuerpo)
              : Padding(padding: const EdgeInsets.fromLTRB(20, 14, 20, 8), child: cuerpo),
        ),
        if (pie != null) Padding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 16), child: pie),
      ],
    );
    return Scaffold(
      backgroundColor: degradado ? null : C.crema,
      body: Container(
        decoration: degradado ? const BoxDecoration(gradient: C.degradado) : null,
        child: Stack(fit: StackFit.expand, children: [
          SafeArea(child: contenido),
          if (fondo != null) Positioned.fill(child: IgnorePointer(child: fondo!)),
        ]),
      ),
    );
  }
}

/// Cabecera roja con título y subtítulo.
class Cabecera extends StatelessWidget {
  const Cabecera(this.titulo, this.subtitulo, {super.key});
  final String titulo;
  final String subtitulo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(gradient: C.degradado, border: Border(bottom: borde)),
      padding: EdgeInsets.fromLTRB(20, MediaQuery.paddingOf(context).top + 18, 20, 16),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(titulo, style: estilo(40, peso: FontWeight.w800, color: C.blanco, alto: 1)),
        const SizedBox(height: 6),
        Text(subtitulo, style: estilo(18, peso: FontWeight.w600, color: C.blanco)),
      ]),
    );
  }
}

/// Pantalla con cabecera roja (la cabecera ya incluye el margen superior del sistema).
class PantallaConCabecera extends StatelessWidget {
  const PantallaConCabecera({super.key, required this.titulo, required this.subtitulo, required this.cuerpo, this.pie});
  final String titulo;
  final String subtitulo;
  final Widget cuerpo;
  final Widget? pie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.crema,
      body: Column(children: [
        Cabecera(titulo, subtitulo),
        Expanded(child: SingleChildScrollView(padding: const EdgeInsets.fromLTRB(20, 16, 20, 8), child: cuerpo)),
        if (pie != null) SafeArea(top: false, child: Padding(padding: const EdgeInsets.fromLTRB(20, 8, 20, 16), child: pie)),
      ]),
    );
  }
}

// ================= botones =================
enum Tono { rojo, blanco, amarillo, whatsapp }

/// Botón grande con sombra sólida que se hunde al pulsar.
class BotonGordo extends StatefulWidget {
  const BotonGordo(this.texto, {super.key, required this.alPulsar, this.tono = Tono.rojo, this.medio = false});
  final String texto;
  final VoidCallback? alPulsar;
  final Tono tono;
  final bool medio;

  @override
  State<BotonGordo> createState() => _BotonGordoState();
}

class _BotonGordoState extends State<BotonGordo> {
  bool _abajo = false;

  @override
  Widget build(BuildContext context) {
    final (fondo, tinta) = switch (widget.tono) {
      Tono.rojo => (C.rojo, C.blanco),
      Tono.blanco => (C.blanco, C.berenjena),
      Tono.amarillo => (C.amarillo, C.berenjena),
      Tono.whatsapp => (C.verdeWa, C.berenjena),
    };
    final activo = widget.alPulsar != null;
    final sombra = widget.medio ? 4.0 : 6.0;
    return Semantics(
      button: true,
      enabled: activo,
      label: widget.texto,
      child: GestureDetector(
        onTapDown: activo ? (_) => setState(() => _abajo = true) : null,
        onTapCancel: () => setState(() => _abajo = false),
        onTapUp: activo
            ? (_) {
                setState(() => _abajo = false);
                widget.alPulsar!();
              }
            : null,
        child: Opacity(
          opacity: activo ? 1 : .45,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 70),
            transform: Matrix4.translationValues(0, _abajo ? sombra - 1 : 0, 0),
            constraints: BoxConstraints(minHeight: widget.medio ? 54 : 64),
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
            decoration: BoxDecoration(
              color: fondo,
              borderRadius: BorderRadius.circular(22),
              border: Border.fromBorderSide(borde),
              boxShadow: [BoxShadow(color: C.berenjena, offset: Offset(0, _abajo ? 1 : sombra))],
            ),
            child: ExcludeSemantics(
              child: Text(widget.texto, textAlign: TextAlign.center, style: estilo(widget.medio ? 20 : 25, peso: FontWeight.w800, color: tinta)),
            ),
          ),
        ),
      ),
    );
  }
}

/// Enlace de texto subrayado con área de toque cómoda.
class Enlace extends StatelessWidget {
  const Enlace(this.texto, {super.key, required this.alPulsar, this.claro = false});
  final String texto;
  final VoidCallback alPulsar;
  final bool claro;

  @override
  Widget build(BuildContext context) {
    final color = claro ? C.blanco : C.berenjena;
    return Center(
      child: TextButton(
        onPressed: () {
          efectos.pop();
          alPulsar();
        },
        style: TextButton.styleFrom(minimumSize: const Size(44, 44), foregroundColor: color),
        child: Text(texto,
            style: estilo(18, color: color).copyWith(decoration: TextDecoration.underline, decorationColor: color, decorationThickness: 2)),
      ),
    );
  }
}

/// Botón redondo de pausa.
class BotonPausa extends StatelessWidget {
  const BotonPausa({super.key, required this.alPulsar});
  final VoidCallback alPulsar;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: 'Pausa',
      child: InkResponse(
        onTap: alPulsar,
        radius: 28,
        child: Container(
          width: 48,
          height: 48,
          decoration: const BoxDecoration(
            color: C.blanco,
            shape: BoxShape.circle,
            border: Border.fromBorderSide(borde),
            boxShadow: [BoxShadow(color: C.berenjena, offset: Offset(0, 3))],
          ),
          child: const Icon(Icons.pause_rounded, color: C.berenjena, size: 26),
        ),
      ),
    );
  }
}

// ================= piezas visuales =================
/// Ficha redonda de jugador con su animal.
class Disco extends StatelessWidget {
  const Disco(this.jugador, {super.key, this.tam = 70, this.sombra = true, this.grosor = 3});
  final Jugador jugador;
  final double tam;
  final bool sombra;
  final double grosor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: tam,
      height: tam,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: jugador.color,
        shape: BoxShape.circle,
        border: Border.all(color: C.berenjena, width: grosor),
        boxShadow: sombra ? [BoxShadow(color: C.berenjena, offset: Offset(0, tam > 60 ? 4 : 3))] : null,
      ),
      child: Text(jugador.animal, style: TextStyle(fontSize: tam * .5, height: 1)),
    );
  }
}

/// La cinta de colores, firma de la marca.
class Cinta extends StatelessWidget {
  const Cinta({super.key, this.alto = 16, this.conBorde = true});
  final double alto;
  final bool conBorde;

  @override
  Widget build(BuildContext context) {
    final franjas = Row(children: [for (final c in C.cinta) Expanded(child: Container(color: c))]);
    if (!conBorde) return SizedBox(height: alto, child: franjas);
    return Container(
      height: alto,
      decoration: BoxDecoration(border: Border.all(color: C.berenjena, width: 2), borderRadius: BorderRadius.circular(99)),
      child: ClipRRect(borderRadius: BorderRadius.circular(99), child: franjas),
    );
  }
}

/// Etiqueta blanca girada (el sello de la marca).
class Etiqueta extends StatelessWidget {
  const Etiqueta(this.texto, {super.key, this.tam = 20});
  final String texto;
  final double tam;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -2 * math.pi / 180,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
        decoration: BoxDecoration(color: C.blanco, borderRadius: BorderRadius.circular(6)),
        child: Text(texto, style: estilo(tam, peso: FontWeight.w800, color: C.rojo)),
      ),
    );
  }
}

/// Barra superior de juego: ronda y pausa, con la barra de progreso debajo.
class BarraJuego extends StatelessWidget {
  const BarraJuego({super.key, required this.texto, required this.ronda, this.incluirActual = false, required this.alPausar});
  final String texto;
  final int ronda;
  final bool incluirActual;
  final VoidCallback alPausar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(children: [
        Row(children: [
          Expanded(child: Text(texto, style: estilo(20, peso: FontWeight.w800))),
          BotonPausa(alPulsar: alPausar),
        ]),
        const SizedBox(height: 10),
        Row(children: [
          for (var i = 1; i <= rondasPorPartida; i++)
            Expanded(
              child: Container(
                height: 12,
                margin: EdgeInsets.only(right: i < rondasPorPartida ? 5 : 0),
                decoration: BoxDecoration(
                  color: i < ronda || (incluirActual && i == ronda)
                      ? C.cinta[(i - 1) % C.cinta.length]
                      : i == ronda
                          ? C.blanco
                          : C.berenjena.withValues(alpha: .1),
                  borderRadius: BorderRadius.circular(99),
                  border: i <= ronda ? Border.all(color: C.berenjena, width: 2) : null,
                ),
              ),
            ),
        ]),
      ]),
    );
  }
}

/// Texto que se encoge solo hasta caber en su caja, sin partir palabras.
class TextoAjustado extends StatelessWidget {
  const TextoAjustado(this.texto, {super.key, this.max = 56, this.min = 26});
  final String texto;
  final double max;
  final double min;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      final escala = MediaQuery.textScalerOf(context);
      var tam = max;
      while (tam > min) {
        final st = estilo(tam, peso: FontWeight.w800, alto: 1.02);
        final tp = TextPainter(text: TextSpan(text: texto, style: st), textDirection: TextDirection.ltr, textScaler: escala)
          ..layout(maxWidth: c.maxWidth);
        var palabraLarga = 0.0;
        for (final p in texto.split(' ')) {
          final w = (TextPainter(text: TextSpan(text: p, style: st), textDirection: TextDirection.ltr, textScaler: escala)..layout()).width;
          palabraLarga = math.max(palabraLarga, w);
        }
        if (tp.height <= c.maxHeight && palabraLarga <= c.maxWidth) break;
        tam -= 2;
      }
      return Align(
        alignment: Alignment.centerLeft,
        child: Text(texto, style: estilo(tam, peso: FontWeight.w800, alto: 1.02)),
      );
    });
  }
}

// ================= la cafetera =================
class Cafetera extends StatelessWidget {
  const Cafetera({super.key, this.alto = 120});
  final double alto;

  @override
  Widget build(BuildContext context) =>
      ExcludeSemantics(child: CustomPaint(size: Size(alto * .8, alto), painter: _PintorCafetera()));
}

class _PintorCafetera extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    canvas.save();
    canvas.scale(size.width / 160, size.height / 200);
    final trazo = Paint()
      ..color = C.berenjena
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6
      ..strokeJoin = StrokeJoin.round
      ..strokeCap = StrokeCap.round;
    final metal = Paint()..color = const Color(0xFFE9EEF4);
    final oscuro = Paint()..color = C.berenjena;

    void forma(Path p, Paint relleno) {
      canvas.drawPath(p, relleno);
      canvas.drawPath(p, trazo);
    }

    // asa
    canvas.drawPath(
        Path()
          ..moveTo(120, 70)
          ..relativeQuadraticBezierTo(34, 4, 28, 38)
          ..relativeQuadraticBezierTo(-5, 22, -30, 22),
        Paint()
          ..color = C.berenjena
          ..style = PaintingStyle.stroke
          ..strokeWidth = 11
          ..strokeCap = StrokeCap.round);
    // cuerpo de arriba, cintura y cuerpo de abajo
    forma(Path()..moveTo(44, 30)..lineTo(116, 30)..lineTo(128, 92)..lineTo(32, 92)..close(), metal);
    forma(Path()..moveTo(30, 92)..lineTo(130, 92)..lineTo(118, 108)..lineTo(42, 108)..close(), oscuro);
    forma(Path()..moveTo(42, 108)..lineTo(118, 108)..lineTo(136, 192)..lineTo(24, 192)..close(), metal);
    forma(Path()..moveTo(68, 30)..lineTo(68, 20)..lineTo(92, 20)..lineTo(92, 30), oscuro);
    final brillo = Paint()
      ..color = C.berenjena.withValues(alpha: .35)
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawLine(const Offset(58, 30), const Offset(52, 92), brillo);
    canvas.drawLine(const Offset(58, 108), const Offset(50, 192), brillo);
    // cara
    canvas.drawOval(Rect.fromCenter(center: const Offset(64, 140), width: 16, height: 22), oscuro);
    canvas.drawOval(Rect.fromCenter(center: const Offset(96, 140), width: 16, height: 22), oscuro);
    final blanco = Paint()..color = C.blanco;
    canvas.drawCircle(const Offset(66, 136), 3, blanco);
    canvas.drawCircle(const Offset(98, 136), 3, blanco);
    final mejilla = Paint()..color = C.rojo.withValues(alpha: .55);
    canvas.drawOval(Rect.fromCenter(center: const Offset(50, 160), width: 18, height: 10), mejilla);
    canvas.drawOval(Rect.fromCenter(center: const Offset(110, 160), width: 18, height: 10), mejilla);
    final boca = Path()
      ..moveTo(66, 158)
      ..relativeQuadraticBezierTo(14, 16, 28, 0)
      ..close();
    canvas.drawPath(boca, Paint()..color = C.rojo);
    canvas.drawPath(boca, trazo..strokeWidth = 5);
    // vapor
    final vapor = Paint()
      ..color = C.blanco.withValues(alpha: .85)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;
    for (final x in [74.0, 88.0]) {
      canvas.drawPath(
          Path()
            ..moveTo(x, 12)
            ..relativeQuadraticBezierTo(-8, -6, 0, -12),
          vapor);
    }
    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
