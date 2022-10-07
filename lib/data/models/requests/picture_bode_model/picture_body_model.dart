import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/requests/picture_body_entity.dart';

part 'picture_body_model.g.dart';

@JsonSerializable(createFactory: false)
class PictureBodyModel extends PictureBodyEntity {
  PictureBodyModel({
    required int visitId,
    required String picture,
  }) : super(
          visitId: visitId,
          picture: picture,
        );

  Map<String, dynamic> toJson() {
    return _$PictureBodyModelToJson(this);
  }
}
