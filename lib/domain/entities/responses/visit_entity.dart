import 'patient_entity.dart';
import 'visit_state_entity.dart';

abstract class VisitEntity {
  final int id;
  final PatientEntity patient;
  final String symptoms;
  final VisitStateEntity state;
  final bool posibleCovid;
  final String? diagnostic;
  final String? signature;

  const VisitEntity({
    required this.id,
    required this.patient,
    required this.symptoms,
    required this.state,
    required this.posibleCovid,
    this.diagnostic,
    this.signature,
  });
}
