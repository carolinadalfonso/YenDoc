import 'package:json_annotation/json_annotation.dart';
import 'package:yendoc/domain/entities/requests/location_entity.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  LocationModel({
    required String latitude,
    required String longitude,
  }) : super(
          latitude,
          longitude,
        );

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return _$LocationModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LocationModelToJson(this);
  }
}
