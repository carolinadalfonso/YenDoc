import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/responses/visit_card_entity.dart';
import '../visit_state/visit_state_model.dart';

part 'visit_card_model.g.dart';

@JsonSerializable()
class VisitCardModel extends VisitCardEntity {
  VisitCardModel({
    required int id,
    required String patient,
    required String address,
    required VisitStateModel state,
  }) : super(
          id,
          patient,
          address,
          state,
        );

  @override
  VisitStateModel get state => super.state as VisitStateModel;

  factory VisitCardModel.fromJson(Map<String, dynamic> json) {
    return _$VisitCardModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$VisitCardModelToJson(this);
  }
}
