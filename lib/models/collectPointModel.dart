class CollectPoint {
  final String name;
  final String adreess;
  final String district;
  final String image;
  final double latitude;
  final double longitude;

  CollectPoint(
    this.name, {
    this.adreess,
    this.district,
    this.image,
    this.latitude,
    this.longitude,
  });
}

List<CollectPoint> collectPointList = [
  CollectPoint(
    "SEC. DE EDUCAÇÃO",
    adreess: 'Rua Carmela Dutra',
    district: 'Agriões',
    image: "assets/img/ecoponto-agrioes-secretaria-educacao.jpg",
    latitude: -22.41866,
    longitude: -42.97555,
  ),
  CollectPoint(
    "ENTRADA GREEN VALLEY",
    adreess: 'Estrada Tere-Fri',
    district: 'Albuquerque',
    image: "assets/img/ecoponto-albuquerque.jpg",
    latitude: -22.37727,
    longitude: -42.93353,
  ),
  CollectPoint(
    "UNIFESO (SEDE)",
    adreess: 'Rua Sebastião Lacerda',
    district: 'Alto',
    image: "assets/img/ecoponto-unifeso-sede.jpg",
    latitude: -22.43336,
    longitude: -42.97959,
  ),
  CollectPoint(
    "CORPO DE BOMBEIROS",
    adreess: 'Estrada Tere-Fri',
    district: 'Bonsucesso',
    image: "assets/img/ecoponto-bonsucesso.jpg",
    latitude: -22.2745,
    longitude: -42.79552,
  ),
  CollectPoint(
    "CENTRO ADMINISTRATIVO",
    adreess: 'Av. Lucio Meira, 375',
    district: 'Várzea',
    image: "assets/img/ecoponto-varzea-antigo-forum.jpg",
    latitude: -22.41143,
    longitude: -42.96882,
  ),
  CollectPoint(
    "SHOPPING COMARY",
    adreess: 'Rua Praça Higino da Silveira',
    district: 'Alto',
    image: "assets/img/ecoponto-feirinha-do-alto.jpg",
    latitude: -22.44231,
    longitude: -42.97886,
  ),
  // CollectPoint(
  //   "HOTEL SESC ALPINA",
  //   adreess: 'Rua 05',
  //   district: 'Golfe',
  // ),
  CollectPoint(
    "POSTO DE SAÚDE",
    adreess: 'BR 116, km 67',
    district: 'Pessegueiros',
    image: "assets/img/ecoponto-pessegueiros.jpg",
    latitude: -22.31674,
    longitude: -42.93786,
  ),
  CollectPoint(
    "PREFEITURA (SEDE)",
    adreess: 'Av. Feliciano Sodré',
    district: 'Centro',
    image: "assets/img/ecoponto-prefeitura.jpg",
    latitude: -22.41816,
    longitude: -42.97394,
  ),
  CollectPoint(
    "ESCOLA FAZ.ALPINA",
    adreess: '-',
    district: 'Santa Rita',
    image: "assets/img/ecopontos.jpg",
    latitude: -22.33658,
    longitude: -42.9812,
  ),
  CollectPoint(
    "UNIFESO (QUINTA)",
    adreess: 'Est. Wenceslau José de Medeiros',
    district: 'Vale do Paraíso',
    image: "assets/img/ecoponto-unifeso-quinta-do-paraiso.jpg",
    latitude: -22.39494,
    longitude: -42.95974,
  ),
  CollectPoint(
    "GUARITA DA POLICIA MILITAR",
    adreess: 'RJ 130-Est. Tere-Fri',
    district: 'Vargem Grande',
    image: "assets/img/ecoponto-vargem-grande.jpg",
    latitude: -22.37093,
    longitude: -42.87199,
  ),
  CollectPoint(
    'CENTRO DE RECICLAGEM',
    adreess: '',
    district: 'Três Corregos',
    image: "assets/img/central-coleta-seletiva.jpg",
    latitude: -22.34926,
    longitude: -42.94055,
  )
];
