import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/responses/visit_entity.dart';
import '../visit_state/visit_state_model.dart';

part 'visit_model.g.dart';

@JsonSerializable(createToJson: false)
class VisitModel extends VisitEntity {
  VisitModel({
    required int id,
    required String patient,
    required String address,
    required int age,
    required String symptoms,
    required bool posibleCovid,
    required VisitStateModel state,
    String? diagnostic,
    required double latitude,
    required double longitude,
  }) : super(
          id: id,
          patient: patient,
          address: address,
          age: age,
          symptoms: symptoms,
          posibleCovid: posibleCovid,
          state: state,
          diagnostic: diagnostic,
          latitude: latitude,
          longitude: longitude,
        );

  @override
  VisitStateModel get state => super.state as VisitStateModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return _$VisitModelFromJson(json);
  }
}
