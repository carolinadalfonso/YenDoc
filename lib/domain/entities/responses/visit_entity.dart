import 'package:yendoc/domain/entities/responses/visit_state_entity.dart';

abstract class VisitEntity {
  final int id;
  final String patient;
  final String address;
  final VisitStateEntity state;
  final int age;
  final String symptoms;
  final bool posibleCovid;
  final String? diagnostic;
  final double latitude;
  final double longitude;

  const VisitEntity({
    required this.id,
    required this.patient,
    required this.address,
    required this.age,
    required this.symptoms,
    required this.posibleCovid,
    required this.state,
    this.diagnostic,
    required this.latitude,
    required this.longitude,
  });
}
