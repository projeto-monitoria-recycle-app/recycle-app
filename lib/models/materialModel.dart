import 'package:flutter/material.dart';

class Waste {
  final String name;
  final Color color;
  final dynamic icon;
  final String title;
  final List<String> content;
  final List<String> images;
  final String discart;
  final List<String> process;
  final String destination;
  final String economicalImpact;
  final String finacialImpact;
  final String environmentalImpact;
  final List<String> itens;

  Waste(
    this.name, {
    this.color,
    this.icon,
    this.title,
    this.content,
    this.images,
    this.discart,
    this.process,
    this.destination,
    this.economicalImpact,
    this.finacialImpact,
    this.environmentalImpact,
    this.itens,
  });
}

List wasteList = [
  Waste('Papel',
      color: Colors.blue,
      icon: AssetImage("assets/icons/paper.png"),
      title: 'Como descartar papel corretamente?',
      content: [
        'Muitas vezes, não imaginamos a importância do descarte correto de papéis. Rasgamos, amassamos e descartamos pensando somente na segurança e sigilo da informação, mas esquecemos da sustentabilidade.',
        'Amassar o papel não o impedirá de ser reciclado, no entanto, as fibras que o compõe perdem a resistência mais facilmente.',
        'Já o papel rasgado, além de ocupar menos espaço, facilita o transporte e mantém a maioria de suas fibras intactas, facilitando o processo de reciclagem.'
      ],
      images: [
        'assets/img/onBoardingImg-04.svg'
      ]),
  Waste(
    'Plástico',
    color: Colors.red,
    icon: AssetImage('assets/icons/plastic.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  Waste(
    'Metal',
    color: Colors.yellow,
    icon: AssetImage('assets/icons/metal.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  Waste(
    'Vidro',
    color: Colors.green,
    icon: AssetImage('assets/icons/glass.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  Waste(
    'Orgânico',
    color: Colors.brown,
    icon: AssetImage('assets/icons/organic.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  Waste(
    'Óleo Vegetal',
    color: Colors.orangeAccent,
    icon: AssetImage('assets/icons/oil.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  Waste(
    'Não Reciclável',
    color: Colors.grey,
    icon: AssetImage('assets/icons/no-recycle.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  Waste(
    'Pilhas e Baterias',
    color: Colors.orange,
    icon: AssetImage('assets/icons/battery.png'),
    title: '',
    content: [''],
    images: ['assets/img/onBoardingImg-04.svg'],
  ),
  // Waste(
  //   'Eletrônicos',
  //   color: Colors.green[900],
  //   icon: AssetImage('assets/icons/eletronic.png'),
  //   title: '',
  //   content: [''],
  //   images: ['assets/img/onBoardingImg-04.svg'],
  // )
];
