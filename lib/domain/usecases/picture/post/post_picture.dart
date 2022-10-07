import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../../data/models/requests/picture_bode_model/picture_body_model.dart';
import '../../../repositories/ipicture_repository.dart';

class PostSavePicture implements IUseCase<void, PictureBodyModel> {
  final IPictureRepository _repository;

  PostSavePicture(this._repository);

  @override
  Future<Either<Failure, void>> call(PictureBodyModel pictureBodyModel) async {
    return await _repository.savePicture(pictureBodyModel);
  }
}
