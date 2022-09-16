import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/responses/visit_state_entity.dart';

part 'visit_state_model.g.dart';

@JsonSerializable(createToJson: false)
class VisitStateModel extends VisitStateEntity {
  VisitStateModel({
    required int id,
    required String code,
    required String name,
  }) : super(
          id,
          code,
          name,
        );

  factory VisitStateModel.fromJson(Map<String, dynamic> json) {
    return _$VisitStateModelFromJson(json);
  }
}
