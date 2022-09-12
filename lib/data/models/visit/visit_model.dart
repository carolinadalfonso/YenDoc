import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/visit_entity.dart';
import 'package:yendoc/data/models/visit_state/visit_state_model.dart';

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
    required double latitude,
    required double longitude,
  }) : super(
          id,
          patient,
          address,
          age,
          symptoms,
          posibleCovid,
          state,
          diagnostic,
          latitude,
          longitude,
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
