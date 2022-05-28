import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/models/visit/visit_entity.dart';
import 'package:yendoc/models/visit_state/visit_state_model.dart';

part 'visit_model.g.dart';

@JsonSerializable()
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
  }) : super(
          id,
          patient,
          address,
          age,
          symptoms,
          posibleCovid,
          state,
          diagnostic,
        );

  @override
  VisitStateModel get state => super.state as VisitStateModel;

  factory VisitModel.fromJson(Map<String, dynamic> json) {
    return _$VisitModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VisitModelToJson(this);
  }
}