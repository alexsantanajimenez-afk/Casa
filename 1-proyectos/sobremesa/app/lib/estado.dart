import 'dart:convert';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'datos.dart';

/// Estado de la partida, el grupo de jugadores, la liga y las preferencias.
class Partida extends ChangeNotifier {
  final _azar = Random();

  List<Jugador> jugadores = [];
  int ronda = 1;
  (String, String)? frase;
  final Set<int> _usadas = {};
  Jugador? ganador;
  int puntosGanador = 0;

  bool voz = true;
  bool sonido = true;
  bool vistoComo = false;

  /// Puntos acumulados en la liga por nombre de jugador.
  Map<String, int> liga = {};
  int jornadasJugadas = 0;
  bool _partidaCerrada = false;

  SharedPreferences? _prefs;

  bool get hayPeques => jugadores.any((j) => j.peque);
  bool get ultimaRonda => ronda >= rondasPorPartida;
  int get puntosRonda => ultimaRonda ? 200 : 100;
  String get jornadaActual => jornadasJugadas < jornadas.length ? jornadas[jornadasJugadas] : 'sobremesa';
  String get jornadaCerrada {
    final i = jornadasJugadas - 1;
    return i >= 0 && i < jornadas.length ? jornadas[i] : 'sobremesa';
  }

  Future<void> cargar() async {
    try {
      _prefs = await SharedPreferences.getInstance();
      final p = _prefs!;
      voz = p.getBool('voz') ?? true;
      sonido = p.getBool('sonido') ?? true;
      vistoComo = p.getBool('vistoComo') ?? false;
      jornadasJugadas = p.getInt('jornadas') ?? 0;
      final g = p.getString('grupo');
      if (g != null) {
        jugadores = (jsonDecode(g) as List).map((e) => Jugador.fromJson(e as Map<String, dynamic>)).toList();
      }
      final l = p.getString('liga');
      if (l != null) liga = (jsonDecode(l) as Map<String, dynamic>).map((k, v) => MapEntry(k, v as int));
    } catch (_) {
      // Si falla el almacenamiento, el juego funciona igual sin recordar nada.
    }
  }

  void _guardar() {
    final p = _prefs;
    if (p == null) return;
    p.setBool('voz', voz);
    p.setBool('sonido', sonido);
    p.setBool('vistoComo', vistoComo);
    p.setInt('jornadas', jornadasJugadas);
    p.setString('grupo', jsonEncode(jugadores.map((j) => j.toJson()).toList()));
    p.setString('liga', jsonEncode(liga));
  }

  // ---------- jugadores ----------
  int _siguienteIndice() {
    final usados = jugadores.map((j) => j.indice).toSet();
    var i = 0;
    while (usados.contains(i)) {
      i++;
    }
    return i;
  }

  void anadir(String nombre, bool peque) {
    if (jugadores.length >= maxJugadores) return;
    jugadores.add(Jugador(nombre: nombre, peque: peque, indice: _siguienteIndice()));
    _guardar();
    notifyListeners();
  }

  void editar(Jugador j, String nombre, bool peque) {
    j
      ..nombre = nombre
      ..peque = peque;
    _guardar();
    notifyListeners();
  }

  void quitar(Jugador j) {
    jugadores.remove(j);
    _guardar();
    notifyListeners();
  }

  // ---------- preferencias ----------
  void cambiarVoz(bool v) {
    voz = v;
    _guardar();
    notifyListeners();
  }

  void cambiarSonido(bool v) {
    sonido = v;
    _guardar();
    notifyListeners();
  }

  void marcarComoVisto() {
    vistoComo = true;
    _guardar();
  }

  // ---------- partida ----------
  void nuevaPartida() {
    ronda = 1;
    frase = null;
    ganador = null;
    _usadas.clear();
    _partidaCerrada = false;
    for (final j in jugadores) {
      j
        ..puntos = 0
        ..caras = 0
        ..antes = 0;
    }
    notifyListeners();
  }

  void elegirFrase() {
    if (_usadas.length >= frases.length) _usadas.clear();
    int i;
    do {
      i = _azar.nextInt(frases.length);
    } while (_usadas.contains(i));
    _usadas.add(i);
    frase = frases[i];
    notifyListeners();
  }

  String chiste() => chistes[_azar.nextInt(chistes.length)];

  void _fotoAntes() {
    for (final j in jugadores) {
      j.antes = j.puntos;
    }
  }

  void votar(Jugador j) {
    _fotoAntes();
    puntosGanador = puntosRonda;
    j
      ..puntos += puntosGanador
      ..caras += 1;
    ganador = j;
    notifyListeners();
  }

  void empate() {
    _fotoAntes();
    ganador = null;
    notifyListeners();
  }

  void siguienteRonda() {
    ronda++;
    frase = null;
    notifyListeners();
  }

  List<Jugador> ranking() {
    final r = [...jugadores];
    r.sort((a, b) => b.puntos != a.puntos ? b.puntos - a.puntos : b.caras - a.caras);
    return r;
  }

  /// Puestos que ha subido un jugador en la última ronda.
  int subida(Jugador j, int posicionActual) {
    final antes = jugadores.where((x) => x.antes > j.antes).length;
    return antes - posicionActual;
  }

  Jugador? caraDeLaNoche() {
    if (jugadores.isEmpty) return null;
    final r = [...jugadores]..sort((a, b) => b.caras - a.caras);
    return r.first.caras > 0 ? r.first : null;
  }

  /// Suma la partida a la liga. Solo cuenta una vez por partida.
  void cerrarPartida() {
    if (_partidaCerrada) return;
    _partidaCerrada = true;
    for (final j in jugadores) {
      liga[j.nombre] = (liga[j.nombre] ?? 0) + j.puntos;
    }
    jornadasJugadas++;
    _guardar();
    notifyListeners();
  }

  List<MapEntry<Jugador, int>> tablaLiga() {
    final t = jugadores.map((j) => MapEntry(j, liga[j.nombre] ?? 0)).toList();
    t.sort((a, b) => b.value - a.value);
    return t;
  }
}

final partida = Partida();
