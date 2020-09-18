import 'package:flutter/material.dart';

class CollectRoute {
  final String location;
  final TimeOfDay hour;
  final String dayOfWeek;
  final String district;
  final double latitude;
  final double longitude;

  CollectRoute(
    this.location,
    this.hour,
    this.dayOfWeek,
    this.district, {
    this.latitude,
    this.longitude,
  });
}

List<CollectRoute> collectRouteList = [
  CollectRoute(
    "Rua Roberto Rosa",
    TimeOfDay(hour: 09, minute: 30),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua João Queiroz",
    TimeOfDay(hour: 10, minute: 00),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Yeda",
    TimeOfDay(hour: 10, minute: 05),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Julio Rosa",
    TimeOfDay(hour: 10, minute: 35),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Pref. Sebastião Teixeira",
    TimeOfDay(hour: 10, minute: 50),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Pref. Monte",
    TimeOfDay(hour: 11, minute: 50),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Mariana",
    TimeOfDay(hour: 12, minute: 50),
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Ten. Luiz Meireles",
    TimeOfDay(hour: 15, minute: 00),
    "Segunda-Feira",
    "Bom Retiro",
  ),
  CollectRoute(
    "Av. Rotariana",
    TimeOfDay(hour: 10, minute: 00),
    "Terça-Feira",
    "Soberbo",
  ),
  CollectRoute(
    "Av. Oliveira Botelho",
    TimeOfDay(hour: 10, minute: 30),
    "Terça-Feira",
    "Alto",
  ),
  CollectRoute(
    "Av. Alberto Torres",
    TimeOfDay(hour: 11, minute: 10),
    "Terça-Feira",
    "Alto",
  ),
  CollectRoute(
    "Rua Omar Magalhães",
    TimeOfDay(hour: 12, minute: 30),
    "Terça-Feira",
    "Parque Ingá",
  ),
  CollectRoute(
    "Shopping do Valle ",
    TimeOfDay(hour: null, minute: null),
    "Quarta-Feira",
    "Albuquerque",
  ),
  CollectRoute(
    "Loja Rústika ",
    TimeOfDay(hour: null, minute: null),
    "Quarta-Feira",
    "Vargem Grande",
  ),
  CollectRoute(
    "Posto de Saúde",
    TimeOfDay(hour: null, minute: null),
    "Quarta-Feira",
    "Pessgueiros",
  ),
  CollectRoute(
    "EcoPonto Santa Rita",
    TimeOfDay(hour: null, minute: null),
    "Quarta-Feira",
    "Santa Rita",
  ),
  CollectRoute(
    "Escola Fazenda Alpina",
    TimeOfDay(hour: null, minute: null),
    "Quarta-Feira",
    "Santa Rita",
  ),
  CollectRoute(
    "Rua Djalma Monteiro",
    TimeOfDay(hour: 09, minute: 30),
    "Quinta-Feira",
    "Panorama",
  ),
  CollectRoute(
    "Rua Prof. Carmem Gomes",
    TimeOfDay(hour: 10, minute: 10),
    "Quinta-Feira",
    "Panorama",
  ),
  CollectRoute(
    "Rua Jarí",
    TimeOfDay(hour: 10, minute: 40),
    "Quinta-Feira",
    "Panorama",
  ),
  CollectRoute(
    "Rua Ver. José Elias Zaquem",
    TimeOfDay(hour: 11, minute: 00),
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Ipojuca",
    TimeOfDay(hour: 11, minute: 10),
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Cor. Antonio Santiago",
    TimeOfDay(hour: 11, minute: 20),
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Carmela Dutra",
    TimeOfDay(hour: 11, minute: 40),
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Rui Barbosa",
    TimeOfDay(hour: 12, minute: 20),
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Rui Barbosa",
    TimeOfDay(hour: 12, minute: 20),
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Rua Nilza Chiapeta",
    TimeOfDay(hour: 12, minute: 40),
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Av. Lucio Meira",
    TimeOfDay(hour: 14, minute: 30),
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Av. Feliciano Sodré",
    TimeOfDay(hour: 13, minute: 30),
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Rua Wilhem Cristian Kleme",
    TimeOfDay(hour: 09, minute: 30),
    "Sexta-Feira",
    "Ermitage",
  ),
  CollectRoute(
    "Manuel José Lebrão",
    TimeOfDay(hour: 10, minute: 00),
    "Sexta-Feira",
    "Ermitage",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    TimeOfDay(hour: 10, minute: 30),
    "Sexta-Feira",
    "Barra do Imbuí",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    TimeOfDay(hour: 11, minute: 30),
    "Sexta-Feira",
    "Barra do Imbuí",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    TimeOfDay(hour: 10, minute: 30),
    "Sexta-Feira",
    "Golfe",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    TimeOfDay(hour: 11, minute: 30),
    "Sexta-Feira",
    "Golfe",
  ),
];
