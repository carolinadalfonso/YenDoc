import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../repositories/ipicture_repository.dart';

class DeletePicture implements IUseCase<void, int> {
  final IPictureRepository _repository;

  DeletePicture(this._repository);

  @override
  Future<Either<Failure, void>> call(int id) async {
    return await _repository.deletePicture(id);
  }
}
