import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/responses/picture_entity.dart';

part 'picture_model.g.dart';

@JsonSerializable(createToJson: false)
class PictureModel extends PictureEntity {
  PictureModel({
    required int id,
    required String picture,
  }) : super(
          id: id,
          picture: picture,
        );

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return _$PictureModelFromJson(json);
  }
}
