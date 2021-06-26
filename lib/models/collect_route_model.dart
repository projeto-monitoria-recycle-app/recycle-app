import 'days_of_week.dart';

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
    "Posto de Gasolina - Rede Podium",
    "Manhã",
    DayOfWeek.wednesday,
    "Albuquerque",
  ),
  CollectRoute(
    14,
    "Shopping Baluarte",
    "Manhã",
    DayOfWeek.wednesday,
    "Vargem Grande",
  ),
  CollectRoute(
    15,
    "Posto de Saúde",
    "Tarde",
    DayOfWeek.wednesday,
    "Pessegueiros",
  ),
  CollectRoute(
    17,
    "Estrada de Santa Rita (Escola Fazenda Alpina)",
    "Tarde",
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
    "Av. Lucio Meira (nos dois sentidos)",
    "Tarde",
    DayOfWeek.thursday,
    "Várzea",
  ),
  CollectRoute(
    29,
    "Av. Feliciano Sodré (nos dois sentidos)",
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
    'Corpo de Bombeiros DBM 2/16',
    "Manhã",
    DayOfWeek.wednesday,
    'Bonsucesso',
  ),
  CollectRoute(
    34,
    'Praça Higino da Silveira',
    "Manhã",
    DayOfWeek.tuesday,
    "Alto",
  ),
  // CollectRoute(
  //   35,
  //   "Guarita da Polícia Militar - RJ-130 - Estrada Tere-Fri",
  //   "Manhã",
  //   DayOfWeek.wednesday,
  //   "Vargem Grande",
  // ),
  CollectRoute(
    36,
    'Rua Sebastião Lacerda',
    "Manhã",
    DayOfWeek.tuesday,
    'Alto',
  ),
  CollectRoute(
    37,
    "Estrada Francisco Smolka",
    "Manhã",
    DayOfWeek.friday,
    "Quebra Frascos",
  ),
  CollectRoute(
    38,
    "Rua Guandu",
    'Tarde',
    DayOfWeek.thursday,
    "Pimenteiras",
  ),
  CollectRoute(
    39,
    "Rua Tietê",
    "Tarde",
    DayOfWeek.tuesday,
    "Fátima",
  ),
  CollectRoute(
    40,
    "Ecoponto - SESC",
    "",
    DayOfWeek.thursday,
    "Várzea",
  ),
  CollectRoute(
    41,
    "Rua Nestor Pinto",
    "Manhã",
    DayOfWeek.monday,
    "Parque São Luiz",
  ),
  CollectRoute(
    42,
    "Rua Melvin Jones",
    "Tarde",
    DayOfWeek.monday,
    "Meudon",
  ),
  CollectRoute(
    43,
    "Rua Fernando Luz Filho",
    "Tarde",
    DayOfWeek.monday,
    "Meudon",
  ),
  CollectRoute(
    44,
    "Rua Charruas",
    "Tarde",
    DayOfWeek.monday,
    "Meudon",
  ),
  CollectRoute(
    45,
    "Estrada do Triunfo",
    "Tarde",
    DayOfWeek.monday,
    "Caleme",
  ),
  CollectRoute(
    46,
    "Rua Carlos Guinle",
    "Manhã",
    DayOfWeek.tuesday,
    "40 Casas",
  ),
  CollectRoute(
    47,
    "Rua Mucuri",
    "Manhã",
    DayOfWeek.tuesday,
    "Comary",
  ),
  CollectRoute(
    48,
    "Rua Luiz Lengruber",
    "Manhã",
    DayOfWeek.tuesday,
    "Iúcas",
  ),
  CollectRoute(
    49,
    "Rua Coronel Silvio Lisboa da Cunha",
    "Tarde",
    DayOfWeek.tuesday,
    "Taumaturgo",
  ),
  CollectRoute(
    50,
    "Rua Bahia",
    "Tarde",
    DayOfWeek.tuesday,
    "Araras",
  ),
  CollectRoute(
    51,
    "Vias Principais",
    "Manhã",
    DayOfWeek.wednesday,
    "Venda Nova",
  ),
  CollectRoute(
    52,
    "Vias Principais",
    "Manhã",
    DayOfWeek.wednesday,
    "Imbiú",
  ),
  CollectRoute(
    53,
    "Vias Principais",
    "Manhã",
    DayOfWeek.wednesday,
    "Vale Alpino",
  ),
  CollectRoute(
    54,
    "Vias Principais",
    "Manhã",
    DayOfWeek.wednesday,
    "Prata dos Aredes",
  ),
  CollectRoute(
    55,
    "Rua Dr. Jorge Melick",
    "Manhã",
    DayOfWeek.thursday,
    "Corta Vento",
  ),
  CollectRoute(
    56,
    "Avenida Presidente Roosevelt",
    "Manhã",
    DayOfWeek.friday,
    "Golfe",
  ),
  CollectRoute(
    57,
    "Estrada Isaías Vidal",
    "Tarde",
    DayOfWeek.friday,
    "Canoas",
  ),

];
