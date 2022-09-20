abstract class PatientEntity {
  final String name;
  final String address;
  final String location;
  final int? age;
  final double? latitude;
  final double? longitude;

  const PatientEntity({
    required this.name,
    required this.address,
    required this.location,
    this.age,
    this.latitude,
    this.longitude,
  });
}
