import 'patient_entity.dart';
import 'visit_state_entity.dart';

abstract class VisitCardEntity {
  final int id;
  final PatientEntity patient;
  final VisitStateEntity state;

  const VisitCardEntity({
    required this.id,
    required this.patient,
    required this.state,
  });
}
