import 'package:dartz/dartz.dart';
import '../../core/errors/failures/failure.dart';

import '../../data/models/requests/picture_bode_model/picture_body_model.dart';
import '../entities/responses/picture_entity.dart';

abstract class IPictureRepository {
  Future<Either<Failure, List<PictureEntity>>> getPictures(int id);
  Future<Either<Failure, int>> savePicture(PictureBodyModel pictureBodyModel);
  Future<Either<Failure, void>> deletePicture(int pictureId);
}
