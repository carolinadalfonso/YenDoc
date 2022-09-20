import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/responses/visit_card_entity.dart';
import '../patient/patient_model.dart';
import '../visit_state/visit_state_model.dart';

part 'visit_card_model.g.dart';

@JsonSerializable(createToJson: false)
class VisitCardModel extends VisitCardEntity {
  VisitCardModel({
    required int id,
    required PatientModel patient,
    required VisitStateModel state,
  }) : super(
          id: id,
          patient: patient,
          state: state,
        );

  @override
  VisitStateModel get state => super.state as VisitStateModel;

  @override
  PatientModel get patient => super.patient as PatientModel;

  factory VisitCardModel.fromJson(Map<String, dynamic> json) {
    return _$VisitCardModelFromJson(json);
  }
}
