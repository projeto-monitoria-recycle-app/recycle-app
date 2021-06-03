import 'package:recycle_app/daos/inMemoryCollectRouteDao.dart';
import 'package:recycle_app/models/collectRouteModel.dart';

class CollectPoint {
  final String name;
  final CollectRoute route;
  final String image;
  final double latitude;
  final double longitude;

  CollectPoint(
    this.name, {
    this.route,
    this.image = "assets/img/ecopontos.jpg",
    this.latitude,
    this.longitude,
  });
}

var dao = InMemoryCollectRouteDao();
List<CollectPoint> collectPointList = [
  //Rua Carmela Dutra
  CollectPoint(
    "SEC. DE EDUCAÇÃO",
    route: dao.getById(24),
    image: "assets/img/ecoponto-agrioes-secretaria-educacao.jpg",
    latitude: -22.41866,
    longitude: -42.97555,
  ),
  //Estrada Tere-Fri
  CollectPoint(
    "ENTRADA GREEN VALLEY",
    route: dao.getById(13),
    image: "assets/img/ecoponto-albuquerque.jpg",
    latitude: -22.37727,
    longitude: -42.93353,
  ),
  CollectPoint(
    "UNIFESO (SEDE)",
    route: dao.getById(36),
    image: "assets/img/ecoponto-unifeso-sede.jpg",
    latitude: -22.43336,
    longitude: -42.97959,
  ),
  CollectPoint(
    "CORPO DE BOMBEIROS",
    route: dao.getById(33),
    image: "assets/img/ecoponto-bonsucesso.jpg",
    latitude: -22.2745,
    longitude: -42.79552,
  ),
  CollectPoint(
    "CENTRO ADMINISTRATIVO",
    route: dao.getById(28),
    image: "assets/img/ecoponto-varzea-antigo-forum.jpg",
    latitude: -22.41143,
    longitude: -42.96882,
  ),
  CollectPoint(
    "SHOPPING COMARY",
    route: dao.getById(34),
    image: "assets/img/ecoponto-feirinha-do-alto.jpg",
    latitude: -22.44231,
    longitude: -42.97886,
  ),
  CollectPoint(
    "SECS HOTEL ALPINA",
    route: CollectRoute(null, 'Rua Cândido Portinari,', null, null, "Golf"),
    image: "assets/img/ecopontos.jpg",
    latitude: -22.3942477,
    longitude: -42.9876638,
  ),
  CollectPoint(
    "ROD. SANTOS DUMONT, BR 116",
    route: dao.getById(15),
    image: "assets/img/ecoponto-pessegueiros.jpg",
    latitude: -22.31674,
    longitude: -42.93786,
  ),
  CollectPoint(
    "PREFEITURA (SEDE)",
    route: dao.getById(29),
    image: "assets/img/ecoponto-prefeitura.jpg",
    latitude: -22.41816,
    longitude: -42.97394,
  ),
  CollectPoint(
    "ESCOLA FAZ.ALPINA",
    route: dao.getById(17),
    image: "assets/img/ecopontos.jpg",
    latitude: -22.33658,
    longitude: -42.9812,
  ),
  CollectPoint(
    "UNIFESO (QUINTA)",
    route: CollectRoute(
        null, 'Est. Wenceslau José de Medeiros', null, null, 'Vale do Paraíso'),
    image: "assets/img/ecoponto-unifeso-quinta-do-paraiso.jpg",
    latitude: -22.39494,
    longitude: -42.95974,
  ),
  CollectPoint(
    "GUARITA DA POLICIA MILITAR",
    route: dao.getById(35),
    image: "assets/img/ecoponto-vargem-grande.jpg",
    latitude: -22.37093,
    longitude: -42.87199,
  ),
  CollectPoint(
    'CENTRO DE RECICLAGEM',
    route: CollectRoute(null, '', null, null, "Três Corregos"),
    image: "assets/img/central-coleta-seletiva.jpg",
    latitude: -22.34926,
    longitude: -42.94055,
  ),
  CollectPoint(
    'CASA DE CULTURA',
    route: dao.getById(39),
    image: "assets/img/ecopontos.jpg",
    latitude: -22.43448,
    longitude: -42.97430,
  ),
  CollectPoint(
    'RUA GUANDÚ',
    route: dao.getById(38),
    latitude: -22.41612,
    longitude: -42.98428,
  ),
  CollectPoint('PRAÇA DOS EXPEDICIONÁRIOS',
      route: CollectRoute(
          null, 'Praça dos Expedicionários', null, null, "São Pedro"),
      latitude: -22.42518,
      longitude: -42.96613),
  CollectPoint('AMAVALE',
      route: CollectRoute(null, '', null, null, "Amavale"),
      latitude: -22.39038,
      longitude: -42.87179),
  CollectPoint('ESTR. FRANCISCO SMOLKA',
      route: dao.getById(37), latitude: -22.39732, longitude: -42.99175),
];

// ,
