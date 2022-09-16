import 'package:json_annotation/json_annotation.dart';
import '../../../../domain/entities/responses/patient_entity.dart';

part 'patient_model.g.dart';

@JsonSerializable(createToJson: false)
class PatientModel extends PatientEntity {
  PatientModel({
    required String name,
    required String street,
    required int number,
    required String location,
    required String province,
  }) : super(
          name: name,
          street: street,
          number: number,
          location: location,
          province: province,
        );

  factory PatientModel.fromJson(Map<String, dynamic> json) {
    return _$PatientModelFromJson(json);
  }
}
