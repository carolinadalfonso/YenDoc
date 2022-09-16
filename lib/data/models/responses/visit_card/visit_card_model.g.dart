// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitCardModel _$VisitCardModelFromJson(Map<String, dynamic> json) =>
    VisitCardModel(
      id: json['id'] as int,
      patient: PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      state: VisitStateModel.fromJson(json['state'] as Map<String, dynamic>),
    );
