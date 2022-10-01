// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitModel _$VisitModelFromJson(Map<String, dynamic> json) => VisitModel(
      id: json['id'] as int,
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      symptoms: json['symptoms'] as String,
      posibleCovid: json['posibleCovid'] as bool,
      state: VisitStateModel.fromJson(json['state'] as Map<String, dynamic>),
      diagnostic: json['diagnostic'] as String?,
      signature: json['signature'] as String?,
    );
