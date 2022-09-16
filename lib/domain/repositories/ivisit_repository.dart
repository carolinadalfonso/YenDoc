import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';
import 'package:yendoc/data/models/requests/location_body_model/location_body_model.dart';

import '../entities/responses/visit_card_entity.dart';
import '../entities/responses/visit_entity.dart';

abstract class IVisitRepository {
  Future<Either<Failure, List<VisitCardEntity>>> getVisits(LocationBodyModel locationModel);
  Future<Either<Failure, VisitEntity>> getVisit(Int id);
}
