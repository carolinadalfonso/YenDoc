import 'package:yendoc/data/models/requests/visit_body_model/visit_body_model.dart';

import '../models/requests/location_body_model/location_body_model.dart';

import '../../core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';
import '../../domain/entities/responses/visit_entity.dart';
import '../../domain/entities/responses/visit_card_entity.dart';

import '../../core/errors/exceptions/exception.dart';
import '../../domain/repositories/ivisit_repository.dart';
import '../datasources/visit_datasource.dart';
import 'base/repository.dart';

class VisitRepository extends Repository<VisitDatasource> implements IVisitRepository {
  VisitRepository({required super.dataSource});

  @override
  Future<Either<Failure, VisitEntity>> getVisit(int id) async {
    try {
      VisitEntity visit = await dataSource.getVisit(id);
      return Right(visit);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<VisitCardEntity>>> getVisits(LocationBodyModel locationModel) async {
    try {
      List<VisitCardEntity> visitas = await dataSource.getVisits(locationModel);
      return Right(visitas);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, List<VisitCardEntity>>> getReportVisits(DateTime dateTime) async {
    try {
      List<VisitCardEntity> visitasReporte = await dataSource.getReportVisits(dateTime);
      return Right(visitasReporte);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> saveVisit(VisitBodyModel visitBodyModel) async {
    try {
      await dataSource.saveVisit(visitBodyModel);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }
}
