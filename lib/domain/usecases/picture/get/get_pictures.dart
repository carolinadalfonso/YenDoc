import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../entities/responses/picture_entity.dart';
import '../../../repositories/ipicture_repository.dart';

class GetPictures implements IUseCase<List<PictureEntity>, int> {
  final IPictureRepository _repository;

  GetPictures(this._repository);

  @override
  Future<Either<Failure, List<PictureEntity>>> call(int id) async {
    return await _repository.getPictures(id);
  }
}
