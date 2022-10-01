import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/requests/visit_body_entity.dart';

part 'visit_body_model.g.dart';

@JsonSerializable(createFactory: false)
class VisitBodyModel extends VisitBodyEntity {
  VisitBodyModel({
    required int id,
    required String stateCode,
    required bool posibleCovid,
    String? diagnostic,
    String? signature,
  }) : super(
          id: id,
          stateCode: stateCode,
          posibleCovid: posibleCovid,
          diagnostic: diagnostic,
          signature: signature,
        );

  Map<String, dynamic> toJson() {
    return _$VisitBodyModelToJson(this);
  }
}
