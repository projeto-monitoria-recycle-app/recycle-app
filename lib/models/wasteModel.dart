import 'package:flutter/material.dart';

class Waste {
  final String material;
  final Color color;
  final dynamic icon;
  final String title;
  final String content;

  Waste(this.material, {this.color, this.icon, this.title, this.content});
}

List wasteList = [
  Waste(
    'Papel',
    color: Colors.blue,
    icon: AssetImage("assets/icons/paper.png"),
  ),
  Waste(
    'Plástico',
    color: Colors.red,
    icon: AssetImage('assets/icons/plastic.png'),
  ),
  Waste(
    'Metal',
    color: Colors.yellow,
    icon: AssetImage('assets/icons/metal.png'),
  ),
  Waste(
    'Vidro',
    color: Colors.green,
    icon: AssetImage('assets/icons/glass.png'),
  ),
  Waste(
    'Orgânico',
    color: Colors.brown,
    icon: AssetImage('assets/icons/organic.png'),
  ),
  Waste(
    'Óleo Vegetal',
    color: Colors.orangeAccent,
    icon: AssetImage('assets/icons/oil.png'),
  ),
  Waste(
    'Não Reciclável',
    color: Colors.grey,
    icon: AssetImage('assets/icons/no-recycle.png'),
  ),
  Waste(
    'Pilhas e Baterias',
    color: Colors.orange,
    icon: AssetImage('assets/icons/battery.png'),
  ),
  Waste(
    'Eletrônicos',
    color: Colors.green[900],
    icon: AssetImage('assets/icons/eletronic.png'),
  )
];
