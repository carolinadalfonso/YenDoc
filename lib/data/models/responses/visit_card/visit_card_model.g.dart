// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'visit_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VisitCardModel _$VisitCardModelFromJson(Map<String, dynamic> json) =>
    VisitCardModel(
      id: json['id'] as int,
      patient: json['patient'] as String,
      address: json['address'] as String,
      state: VisitStateModel.fromJson(json['state'] as Map<String, dynamic>),
    );
