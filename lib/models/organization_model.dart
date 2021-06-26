class Organization {
  final String name;
  final String adreess;
  final double latitude;
  final double longitude;
  final String activities;
  final List<String> phone;
  final List<String> photos;

  Organization(
    this.name, {
    this.adreess,
    this.activities,
    this.latitude,
    this.longitude,
    this.phone,
    this.photos,
  });
}

List<Organization> organizations = [
  Organization('Associação de Catadores de Teresópolis',
      activities: 'Organização para preservação ambiental',
      adreess: 'Estrada Caxambu - Três Corregos , Teresópolis, RJ',
      latitude: -22.34926,
      longitude: -42.94055,
      phone: ['(21) 97958-8484'])
];
