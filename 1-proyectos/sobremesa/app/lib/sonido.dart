import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'estado.dart';

/// Efectos de sonido, vibración y la voz de la cafetera.
class Efectos {
  Efectos._();
  static final instancia = Efectos._();

  final Map<String, AudioPlayer> _reproductores = {};
  final FlutterTts _tts = FlutterTts();
  bool _ttsListo = false;

  Future<void> _prepararVoz() async {
    if (_ttsListo) return;
    try {
      await _tts.setLanguage('es-ES');
      await _tts.setSpeechRate(0.5);
      await _tts.setPitch(1.1);
      _ttsListo = true;
    } catch (_) {}
  }

  Future<void> hablar(String texto) async {
    if (!partida.voz) return;
    try {
      await _prepararVoz();
      await _tts.stop();
      await _tts.speak(texto);
    } catch (_) {}
  }

  Future<void> callar() async {
    try {
      await _tts.stop();
    } catch (_) {}
  }

  Future<void> _sonar(String nombre) async {
    if (!partida.sonido) return;
    try {
      final r = _reproductores.putIfAbsent(nombre, () => AudioPlayer()..setReleaseMode(ReleaseMode.stop));
      await r.stop();
      await r.play(AssetSource('sonidos/$nombre.wav'), volume: 0.7);
    } catch (_) {}
  }

  void tic() {
    _sonar('tic');
    HapticFeedback.lightImpact();
  }

  void ya() {
    _sonar('ya');
    HapticFeedback.heavyImpact();
  }

  void punto() {
    _sonar('punto');
    HapticFeedback.mediumImpact();
  }

  void fanfarria() {
    _sonar('fanfarria');
    HapticFeedback.heavyImpact();
  }

  void pop() => _sonar('pop');
}

final efectos = Efectos.instancia;
