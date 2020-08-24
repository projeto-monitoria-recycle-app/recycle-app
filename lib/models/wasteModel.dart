import 'package:flutter/material.dart';

class Waste {
  final String material;
  final Color color;
  final String icon;
  final String title;
  final String content;

  Waste(this.material, {this.color, this.icon, this.title, this.content});
}

List wasteList = [
  Waste(
    'Papel',
    color: Colors.blue,
  ),
  Waste(
    'Plástico',
    color: Colors.red,
  ),
  Waste(
    'Metal',
    color: Colors.yellow,
  ),
  Waste(
    'Vidro',
    color: Colors.green,
  ),
  Waste(
    'Orgânico',
    color: Colors.brown,
  ),
  Waste(
    'Óleo Vegetal',
    color: Colors.orangeAccent,
  ),
  Waste(
    'Não Reciclável',
    color: Colors.grey,
  ),
  Waste('Pilhas e Baterias', color: Colors.orange)
];
