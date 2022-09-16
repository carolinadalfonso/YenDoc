abstract class PatientEntity {
  final String name;
  final String street;
  final int number;
  final String location;
  final String province;

  const PatientEntity({
    required this.name,
    required this.street,
    required this.number,
    required this.location,
    required this.province,
  });
}
