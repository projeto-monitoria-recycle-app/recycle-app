class CollectRoute {
  final String location;
  final String dayPart;
  final String dayOfWeek;
  final String district;
  final double latitude;
  final double longitude;

  CollectRoute(
    this.location,
    this.dayPart,
    this.dayOfWeek,
    this.district, {
    this.latitude,
    this.longitude,
  });
}

List<String> districtList =
    new List<String>.from(collectRouteList.map((element) {
  return element.district;
}));

List<CollectRoute> collectRouteList = [
  CollectRoute(
    "Rua Roberto Rosa",
    "Manhã",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua João Queiroz",
    "Manhã",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Yeda",
    "Manhã",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Julio Rosa",
    "Manhã",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Pref. Sebastião Teixeira",
    "Manhã",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Pref. Monte",
    "Manhã",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Mariana",
    "Tarde",
    "Segunda-Feira",
    "Tijuca",
  ),
  CollectRoute(
    "Rua Ten. Luiz Meireles",
    "Tarde",
    "Segunda-Feira",
    "Bom Retiro",
  ),
  CollectRoute(
    "Av. Rotariana",
    "Manhã",
    "Terça-Feira",
    "Soberbo",
  ),
  CollectRoute(
    "Av. Oliveira Botelho",
    "Manhã",
    "Terça-Feira",
    "Alto",
  ),
  CollectRoute(
    "Av. Alberto Torres",
    "Manhã",
    "Terça-Feira",
    "Alto",
  ),
  CollectRoute(
    "Rua Omar Magalhães",
    "Manhã",
    "Terça-Feira",
    "Parque Ingá",
  ),
  CollectRoute(
    "Shopping do Valle ",
    "Manhã",
    "Quarta-Feira",
    "Albuquerque",
  ),
  CollectRoute(
    "Loja Rústica ",
    "Manhã",
    "Quarta-Feira",
    "Vargem Grande",
  ),
  CollectRoute(
    "Posto de Saúde",
    "Manhã",
    "Quarta-Feira",
    "Pessegueiros",
  ),
  CollectRoute(
    "EcoPonto Santa Rita",
    "Manhã",
    "Quarta-Feira",
    "Santa Rita",
  ),
  CollectRoute(
    "Escola Fazenda Alpina",
    "Manhã",
    "Quarta-Feira",
    "Santa Rita",
  ),
  CollectRoute(
    "Rua Djalma Monteiro",
    "Manhã",
    "Quinta-Feira",
    "Panorama",
  ),
  CollectRoute(
    "Rua Prof. Carmem Gomes",
    "Manhã",
    "Quinta-Feira",
    "Panorama",
  ),
  CollectRoute(
    "Rua Jarí",
    "Manhã",
    "Quinta-Feira",
    "Panorama",
  ),
  CollectRoute(
    "Rua Ver. José Elias Zaquem",
    "Manhã",
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Ipojuca",
    "Manhã",
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Cor. Antonio Santiago",
    "Manhã",
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Carmela Dutra",
    "Manhã",
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Rui Barbosa",
    "Tarde",
    "Quinta-Feira",
    "Agriões",
  ),
  CollectRoute(
    "Rua Rui Barbosa",
    "Tarde",
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Rua Nilza Chiapeta",
    "Tarde",
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Av. Lucio Meira",
    "Tarde",
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Av. Feliciano Sodré",
    "Tarde",
    "Quinta-Feira",
    "Várzea",
  ),
  CollectRoute(
    "Rua Wilhem Cristian Kleme",
    "Manhã",
    "Sexta-Feira",
    "Ermitage",
  ),
  CollectRoute(
    "Manuel José Lebrão",
    "Manhã",
    "Sexta-Feira",
    "Ermitage",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    "Manhã",
    "Sexta-Feira",
    "Barra do Imbuí",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    "Manhã",
    "Sexta-Feira",
    "Barra do Imbuí",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    "Manhã",
    "Sexta-Feira",
    "Golfe",
  ),
  CollectRoute(
    "Avenida Presidente Rooselvelt",
    "Manhã",
    "Sexta-Feira",
    "Golfe",
  ),
];
