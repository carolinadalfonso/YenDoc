// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitModel _$VisitModelFromJson(Map<String, dynamic> json) => VisitModel(
      id: json['id'] as int,
      patient: json['patient'] as String,
      address: json['address'] as String,
      age: json['age'] as int,
      symptoms: json['symptoms'] as String,
      posibleCovid: json['posibleCovid'] as bool,
      state: VisitStateModel.fromJson(json['state'] as Map<String, dynamic>),
      diagnostic: json['diagnostic'] as String?,
    );

Map<String, dynamic> _$VisitModelToJson(VisitModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'patient': instance.patient,
      'address': instance.address,
      'age': instance.age,
      'symptoms': instance.symptoms,
      'posibleCovid': instance.posibleCovid,
      'diagnostic': instance.diagnostic,
      'state': instance.state,
    };
