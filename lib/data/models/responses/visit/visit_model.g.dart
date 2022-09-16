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
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );
