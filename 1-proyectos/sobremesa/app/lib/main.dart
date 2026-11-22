import 'package:flutter/services.dart';
import 'package:material_ui/material_ui.dart';

import 'estado.dart';
import 'pantallas/portada.dart';
import 'tema.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await partida.cargar();
  runApp(const SobremesaApp());
}

class SobremesaApp extends StatelessWidget {
  const SobremesaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SOBREMESA',
      debugShowCheckedModeBanner: false,
      theme: temaApp(),
      // Respeta el tamaño de letra del móvil, con tope para que nada se rompa.
      builder: (context, child) => MediaQuery.withClampedTextScaling(maxScaleFactor: 1.25, child: child!),
      home: const Portada(),
    );
  }
}
