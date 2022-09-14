import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';

import '../entities/responses/visit_card_entity.dart';
import '../entities/responses/visit_entity.dart';

abstract class IVisitRepository {
  Future<Either<Failure, VisitCardEntity>> getVisits(Double longitude, Double latitude);
  Future<Either<Failure, VisitEntity>> getVisit(Int id);
}
