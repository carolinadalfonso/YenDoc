import 'dart:ffi';

import '../../../domain/entities/responses/visit_card_entity.dart';
import '../../../domain/entities/responses/visit_entity.dart';
import '../../models/requests/location_body_model/location_body_model.dart';

abstract class IVisitDatasource {
  Future<List<VisitCardEntity>> getVisits(LocationBodyModel locationModel);
  Future<VisitEntity> getVisit(Int id);
  Future<List<VisitCardEntity>> getVisitsReport(DateTime dateTime);
}
