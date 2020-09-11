class Organization {
  final String name;
  final String adreess;
  final String activities;
  final List<String> phone;
  final List<double> location;
  final List<String> photos;

  Organization(
    this.name,
    this.adreess, {
    this.activities,
    this.phone,
    this.location,
    this.photos,
  });
}

List<Organization> organizations = [
  Organization('Cooperativa Teresópolis', 'Rua ... n ##')
];
