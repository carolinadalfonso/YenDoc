import 'package:yendoc/domain/entities/responses/visit_state_entity.dart';

abstract class VisitCardEntity {
  final int id;
  final String patient;
  final String address;
  final VisitStateEntity state;

  const VisitCardEntity(
    this.id,
    this.patient,
    this.address,
    this.state,
  );
}
