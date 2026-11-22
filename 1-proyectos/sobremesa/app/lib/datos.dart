import 'dart:ui';

/// Colores de fondo de las fichas, uno por jugador.
const coloresFicha = <Color>[
  Color(0xFFFFD9CF), Color(0xFFFFF0BF), Color(0xFFD7F5EC), Color(0xFFDCE6FF),
  Color(0xFFF7D8F0), Color(0xFFE3F3C8), Color(0xFFFFE2C2), Color(0xFFE7E0F5),
  Color(0xFFCFF0FF), Color(0xFFFFE0E9), Color(0xFFE9F7D2), Color(0xFFF1E3D3),
];

const animales = ['🐙', '🐐', '🦎', '🐬', '🦀', '🐫', '🦜', '🐢', '🐝', '🦉', '🐧', '🦊'];

const maxJugadores = 12;
const rondasPorPartida = 6;

const jornadas = ['Nochebuena', 'Navidad', 'Nochevieja', 'Reyes'];
const iconosJornada = ['🎄', '🎁', '🥂', '👑'];

class Jugador {
  Jugador({required this.nombre, this.peque = false, required this.indice});

  String nombre;
  bool peque;
  final int indice;
  int puntos = 0;
  int caras = 0;
  int antes = 0;

  Color get color => coloresFicha[indice % coloresFicha.length];
  String get animal => animales[indice % animales.length];
  String get corto => nombre.split(' ').last;

  Map<String, dynamic> toJson() => {'n': nombre, 'p': peque, 'i': indice};
  factory Jugador.fromJson(Map<String, dynamic> j) =>
      Jugador(nombre: j['n'] as String, peque: j['p'] as bool? ?? false, indice: j['i'] as int? ?? 0);
}

/// Cada frase: versión para mayores y versión fácil para peques.
const frases = <(String, String)>[
  ('un león que ha pisado una pieza de Lego', 'león enfadado'),
  ('cuando ves el precio de las gambas en Navidad', '¡sorpresa enorme!'),
  ('el abuelo cuando el turrón es sin azúcar', 'has comido algo raro'),
  ('te toca la lotería, pero el décimo es de tu suegra', '¡me ha tocado un premio!'),
  ('comerte un limón haciendo como que está rico', 'limón muy ácido'),
  ('un robot que intenta bailar reguetón', 'robot'),
  ('suena el móvil y es tu jefe en Nochebuena', 'miedo'),
  ('un gato que quiere comida a las seis de la mañana', 'gato con hambre'),
  ('el cuñado cuando pierde al parchís', 'enfado de mentira'),
  ('intentas no reírte en misa', 'aguantar la risa'),
  ('un pulpo en una boda', 'pulpo'),
  ('cuando dicen que hay que recoger la mesa', 'mucha pereza'),
  ('tu foto del DNI', 'cara muy seria'),
  ('un pez que acaba de ver un tiburón', 'pez asustado'),
  ('cuando llega la cuenta del restaurante', 'sorpresa'),
  ('un perro al que le dicen "¿quién es un perro bueno?"', 'perrito feliz'),
  ('el presentador de las campanadas cuando se equivoca', '¡uy, me he equivocado!'),
  ('un vampiro que ha mordido un ajo', 'vampiro'),
  ('pisas un charco con calcetines', '¡qué asco!'),
  ('la abuela viendo que no has comido nada', 'abuela preocupada'),
  ('un superhéroe que se ha olvidado la capa', 'superhéroe'),
  ('estornudo que no termina de salir', 'a punto de estornudar'),
  ('un influencer haciéndose un selfie', 'foto con morritos'),
  ('cuando te dan un regalo que no te gusta', '¡qué regalo tan raro!'),
  ('un pirata que se ha mareado en el barco', 'pirata'),
  ('el último en enterarse del chiste', 'no entiendo nada'),
  ('el Grinch viendo luces de Navidad', 'enfadado con la Navidad'),
  ('un futbolista que finge una falta', '¡me he hecho daño!'),
  ('cuando se va la luz en mitad de la peli', 'oscuridad'),
  ('un zombi que llega tarde al trabajo', 'zombi'),
  ('comerte la última croqueta sin preguntar', 'travieso'),
  ('un mago al que le ha fallado el truco', 'mago sorprendido'),
  ('cuando te pillan cantando en la ducha', 'vergüenza'),
  ('un camello en el desfile de Reyes', 'camello'),
  ('esperando a que el microondas termine', 'impaciente'),
  ('un astronauta que ha perdido las llaves de la nave', 'astronauta'),
  ('tu tía cuando pregunta "¿y el novio?"', 'curiosidad'),
  ('un caracol con mucha prisa', 'caracol'),
  ('cuando suena el despertador el lunes', 'mucho sueño'),
  ('un rey que no encuentra su corona', 'rey triste'),
];

const chistes = [
  '¡Cara de Óscar!',
  '¡Que alguien enmarque esa cara!',
  'La cafetera ha visto cosas… pero esto no.',
  '¡Ovación en el salón!',
  '¡Nivel profesional!',
  '¡Esa cara merece un turrón!',
  '¡Qué arte, familia!',
  '¡Esto va directo al álbum!',
];
