import 'package:json_annotation/json_annotation.dart';

import '../../../../domain/entities/responses/patient_entity.dart';

part 'patient_model.g.dart';

@JsonSerializable(createToJson: false)
class PatientModel extends PatientEntity {
  PatientModel({
    required String name,
    required String address,
    required String location,
    int? age,
    double? latitude,
    double? longitude,
  }) : super(
          name: name,
          address: address,
          location: location,
          age: age,
          latitude: latitude,
          longitude: longitude,
        );

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return _$PatientModelFromJson(json);
  }
}
