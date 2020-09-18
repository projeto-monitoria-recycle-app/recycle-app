class CollectPoint {
  final String name;
  final String adreess;
  final String district;
  final List<double> location;

  CollectPoint(
    this.name, {
    this.adreess,
    this.district,
    this.location,
  });
}

List<CollectPoint> collectPointList = [
  CollectPoint(
    "SEC. DE EDUCAÇÃO",
    adreess: 'Rua 01',
    district: 'Agriões',
  ),
  CollectPoint(
    "SHOPPING VALLE",
    adreess: 'Rua 02',
    district: 'Albuquerque',
  ),
  CollectPoint(
    "UNIFESO (SEDE)",
    adreess: 'Rua 03',
    district: 'Alto',
  ),
  CollectPoint(
    "BOMBEIROS",
    adreess: 'Rua 04',
    district: 'Bonsucesso',
  ),
  CollectPoint(
    "ANTIGO FÓRUM",
    adreess: 'Rua 05',
    district: 'Várzea',
  ),
  CollectPoint(
    "SHOPPING DO ALTO",
    adreess: 'Rua 05',
    district: 'Alto',
  ),
  CollectPoint(
    "HOTEL SESC ALPINA",
    adreess: 'Rua 05',
    district: 'Golfe',
  ),
  CollectPoint(
    "POSTO DE SAÚDE",
    adreess: 'Rua 05',
    district: 'Pessegueiros',
  ),
  CollectPoint(
    "PREFEITURA",
    adreess: 'Rua 05',
    district: 'Centro',
  ),
  CollectPoint(
    "ESCOLA FAZ.ALPINA",
    adreess: 'Rua 05',
    district: 'Santa Rita',
  ),
  CollectPoint(
    "UNIFESO (QUINTA)",
    adreess: 'Rua 05',
    district: 'Vale do Paraíso',
  ),
  CollectPoint(
    "LOJA RÚSTIKA",
    adreess: 'Rua 05',
    district: 'Vargem Grande',
  ),
];
