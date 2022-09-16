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

  const VisitEntity(
    this.id,
    this.patient,
    this.address,
    this.age,
    this.symptoms,
    this.posibleCovid,
    this.state,
    this.diagnostic,
    this.latitude,
    this.longitude,
  );
}
