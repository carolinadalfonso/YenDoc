import 'package:json_annotation/json_annotation.dart';
import '../patient/patient_model.dart';
import '../../../../domain/entities/responses/visit_entity.dart';
import '../visit_state/visit_state_model.dart';

part 'visit_model.g.dart';

@JsonSerializable(createToJson: false)
class VisitModel extends VisitEntity {
  VisitModel({
    required int id,
    required PatientModel patient,
    required String symptoms,
    required bool posibleCovid,
    required VisitStateModel state,
    String? diagnostic,
  }) : super(
          id: id,
          patient: patient,
          symptoms: symptoms,
          posibleCovid: posibleCovid,
          state: state,
          diagnostic: diagnostic,
        );

  @override
  VisitStateModel get state => super.state as VisitStateModel;

  @override
  PatientModel get patient => super.patient as PatientModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return _$VisitModelFromJson(json);
  }
}
