import 'daysOfWeek.dart';

class CollectRoute {
  final int id;
  final String location;
  final String dayPart;
  final DayOfWeek dayOfWeek;
  final String district;
  final double latitude;
  final double longitude;

  CollectRoute(
    this.id,
    this.location,
    this.dayPart,
    this.dayOfWeek,
    this.district, {
    this.latitude,
    this.longitude,
  });

  @override
  String toString() {
    return 'CollectRoute{id: $id, location: $location, dayPart: $dayPart, dayOfWeek: $dayOfWeek, district: $district, latitude: $latitude, longitude: $longitude}';
  }
}

List<String> districtList =
    new List<String>.from(collectRouteList.map((element) {
  return element.district;
}));

List<CollectRoute> collectRouteList = [
  CollectRoute(
    1,
    "Rua Roberto Rosa",
    "Manhã",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    2,
    "Rua João Queiroz",
    "Manhã",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    3,
    "Rua Yeda",
    "Manhã",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    4,
    "Rua Julio Rosa",
    "Manhã",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    5,
    "Rua Pref. Sebastião Teixeira",
    "Manhã",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    6,
    "Rua Pref. Monte",
    "Manhã",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    7,
    "Rua Mariana",
    "Tarde",
    DayOfWeek.monday,
    "Tijuca",
  ),
  CollectRoute(
    8,
    "Rua Ten. Luiz Meireles",
    "Tarde",
    DayOfWeek.monday,
    "Bom Retiro",
  ),
  CollectRoute(
    9,
    "Av. Rotariana",
    "Manhã",
    DayOfWeek.tuesday,
    "Soberbo",
  ),
  CollectRoute(
    10,
    "Av. Oliveira Botelho",
    "Manhã",
    DayOfWeek.tuesday,
    "Alto",
  ),
  CollectRoute(
    11,
    "Av. Alberto Torres",
    "Manhã",
    DayOfWeek.tuesday,
    "Alto",
  ),
  CollectRoute(
    12,
    "Rua Omar Magalhães",
    "Manhã",
    DayOfWeek.tuesday,
    "Parque Ingá",
  ),
  CollectRoute(
    13,
    "Shopping do Valle - RJ-130 - Estrada Tere-Fri",
    "Manhã",
    DayOfWeek.wednesday,
    "Albuquerque",
  ),
  CollectRoute(
    14,
    "Loja Rústica ",
    "Manhã",
    DayOfWeek.wednesday,
    "Vargem Grande",
  ),
  CollectRoute(
    15,
    "Posto de Saúde",
    "Manhã",
    DayOfWeek.wednesday,
    "Pessegueiros",
  ),
  CollectRoute(
    16,
    "EcoPonto Santa Rita",
    "Manhã",
    DayOfWeek.wednesday,
    "Santa Rita",
  ),
  CollectRoute(
    17,
    "Escola Fazenda Alpina",
    "Manhã",
    DayOfWeek.wednesday,
    "Santa Rita",
  ),
  CollectRoute(
    18,
    "Rua Djalma Monteiro",
    "Manhã",
    DayOfWeek.thursday,
    "Panorama",
  ),
  CollectRoute(
    19,
    "Rua Prof. Carmem Gomes",
    "Manhã",
    DayOfWeek.thursday,
    "Panorama",
  ),
  CollectRoute(
    20,
    "Rua Jarí",
    "Manhã",
    DayOfWeek.thursday,
    "Panorama",
  ),
  CollectRoute(
    21,
    "Rua Ver. José Elias Zaquem",
    "Manhã",
    DayOfWeek.thursday,
    "Agriões",
  ),
  CollectRoute(
    22,
    "Rua Ipojuca",
    "Manhã",
    DayOfWeek.thursday,
    "Agriões",
  ),
  CollectRoute(
    23,
    "Rua Cor. Antonio Santiago",
    "Manhã",
    DayOfWeek.thursday,
    "Agriões",
  ),
  CollectRoute(
    24,
    "Rua Carmela Dutra",
    "Manhã",
    DayOfWeek.thursday,
    "Agriões",
  ),
  CollectRoute(
    25,
    "Rua Rui Barbosa",
    "Tarde",
    DayOfWeek.thursday,
    "Agriões",
  ),
  CollectRoute(
    26,
    "Rua Rui Barbosa",
    "Tarde",
    DayOfWeek.thursday,
    "Várzea",
  ),
  CollectRoute(
    27,
    "Rua Nilza Chiapeta",
    "Tarde",
    DayOfWeek.thursday,
    "Várzea",
  ),
  CollectRoute(
    28,
    "Av. Lucio Meira",
    "Tarde",
    DayOfWeek.thursday,
    "Várzea",
  ),
  CollectRoute(
    29,
    "Av. Feliciano Sodré",
    "Tarde",
    DayOfWeek.thursday,
    "Várzea",
  ),
  CollectRoute(
    30,
    "Rua Wilhem Cristian Kleme",
    "Manhã",
    DayOfWeek.friday,
    "Ermitage",
  ),
  CollectRoute(
    31,
    "Manuel José Lebrão",
    "Manhã",
    DayOfWeek.friday,
    "Ermitage",
  ),
  CollectRoute(
    32,
    "Avenida Presidente Rooselvelt",
    "Manhã",
    DayOfWeek.friday,
    "Barra do Imbuí",
  ),
  CollectRoute(
    33,
    'Corpo de Bombeiros - Estrada Tere-Fri',
    null,
    DayOfWeek.wednesday,
    'Bonsucesso',
  )
];
