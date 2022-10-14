import '../../../domain/entities/responses/visit_card_entity.dart';
import '../../../domain/entities/responses/visit_entity.dart';
import '../../models/requests/location_body_model/location_body_model.dart';
import '../../models/requests/visit_body_model/visit_body_model.dart';

abstract class IVisitDatasource {
  Future<List<VisitCardEntity>> getVisits(LocationBodyModel locationModel);
  Future<VisitEntity> getVisit(int id);
  Future<List<VisitCardEntity>> getReportVisits(DateTime dateTime);
  Future<void> saveVisit(VisitBodyModel visitBodyModel);
}
