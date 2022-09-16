import 'package:yendoc/data/models/requests/location_body_model/location_body_model.dart';
import 'dart:ffi';

import 'package:yendoc/core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:yendoc/domain/entities/responses/visit_entity.dart';
import 'package:yendoc/domain/entities/responses/visit_card_entity.dart';

import '../../domain/repositories/ivisit_repository.dart';
import 'base/repository.dart';

class VisitRepository extends Repository implements IVisitRepository {
  VisitRepository({required super.dataSource});

  @override
  Future<Either<Failure, VisitEntity>> getVisit(Int id) {
    // TODO: implement getVisit
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, List<VisitCardEntity>>> getVisits(LocationBodyModel locationModel) {
    // TODO: implement getVisits
    throw UnimplementedError();
  }
}
