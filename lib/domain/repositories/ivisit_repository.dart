import 'package:dartz/dartz.dart';
import '../../core/errors/failures/failure.dart';
import '../../data/models/requests/location_body_model/location_body_model.dart';

import '../../data/models/requests/visit_body_model/visit_body_model.dart';
import '../entities/responses/visit_card_entity.dart';
import '../entities/responses/visit_entity.dart';

abstract class IVisitRepository {
  Future<Either<Failure, List<VisitCardEntity>>> getVisits(LocationBodyModel locationModel);
  Future<Either<Failure, VisitEntity>> getVisit(int id);
  Future<Either<Failure, List<VisitCardEntity>>> getReportVisits(DateTime dateTime);
  Future<Either<Failure, void>> saveVisit(VisitBodyModel visitBodyModel);
}
