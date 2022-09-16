import 'package:yendoc/domain/entities/responses/patient_entity.dart';
import 'package:yendoc/domain/entities/responses/visit_state_entity.dart';

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
