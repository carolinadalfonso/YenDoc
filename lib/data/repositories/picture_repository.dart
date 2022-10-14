import 'package:yendoc/data/models/requests/picture_bode_model/picture_body_model.dart';
import 'package:yendoc/domain/entities/responses/picture_entity.dart';

import '../../domain/repositories/ipicture_repository.dart';
import '../datasources/picture_datasource.dart';

import '../../core/errors/failures/failure.dart';
import 'package:dartz/dartz.dart';

import '../../core/errors/exceptions/exception.dart';
import 'base/repository.dart';

class PictureRepository extends Repository<PictureDatasource> implements IPictureRepository {
  PictureRepository({required super.dataSource});

  @override
  Future<Either<Failure, List<PictureEntity>>> getPictures(int id) async {
    try {
      List<PictureEntity> pictures = await dataSource.getPictures(id);
      return Right(pictures);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, int>> savePicture(PictureBodyModel pictureBodyModel) async {
    try {
      int id = await dataSource.savePicture(pictureBodyModel);
      return Right(id);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }

  @override
  Future<Either<Failure, void>> deletePicture(int pictureId) async {
    try {
      await dataSource.deletePicture(pictureId);
      return const Right(null);
    } on ServerException catch (e) {
      return Left(ServerFailure(code: e.code, message: e.message));
    } on NoInternetConnectionException catch (e) {
      return Left(NoInternetConnectionFailure(message: e.message));
    }
  }
}
