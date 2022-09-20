import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/requests/location_body_entity.dart';

part 'location_body_model.g.dart';

@JsonSerializable(createFactory: false)
class LocationBodyModel extends LocationEntity {
  LocationBodyModel({
    required String latitude,
    required String longitude,
  }) : super(
          latitude,
          longitude,
        );

  Map<String, dynamic> toJson() {
    return _$LocationBodyModelToJson(this);
  }
}
