import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/responses/patient_entity.dart';

part 'patient_model.g.dart';

@JsonSerializable(createToJson: false)
class PatientModel extends PatientEntity {
  PatientModel({
    required String name,
    required String address,
  }) : super(
          name: name,
          address: address,
        );

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return _$PatientModelFromJson(json);
  }
}
