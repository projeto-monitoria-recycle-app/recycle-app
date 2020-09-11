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
  CollectPoint("Unifeso (Vale do Paraíso)")
];
