import 'package:yendoc/models/visit_state/visit_state_entity.dart';

abstract class VisitEntity {
  final int id;
  final String patient;
  final String address;
  final int age;
  final String symptoms;
  final bool posibleCovid;
  final VisitStateEntity state;
  final String? diagnostic;

  const VisitEntity(
    this.id,
    this.patient,
    this.address,
    this.age,
    this.symptoms,
    this.posibleCovid,
    this.state,
    this.diagnostic,
  );
}
