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
    "PONTO COLETA 01",
    adreess: 'Rua 01',
    district: 'Alto',
  ),
  CollectPoint(
    "PONTO COLETA 02",
    adreess: 'Rua 02',
    district: 'Agriões',
  ),
  CollectPoint(
    "PONTO COLETA 03",
    adreess: 'Rua 03',
    district: 'Barra do Imbuí',
  ),
  CollectPoint(
    "PONTO COLETA 04",
    adreess: 'Rua 04',
    district: 'Panorama',
  ),
  CollectPoint(
    "PONTO COLETA 05",
    adreess: 'Rua 05',
    district: 'Pimenteiras',
  ),
];
