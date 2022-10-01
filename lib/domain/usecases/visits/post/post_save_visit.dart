import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../../data/models/requests/visit_body_model/visit_body_model.dart';
import '../../../repositories/ivisit_repository.dart';

class PostSaveVisit implements IUseCase<void, VisitBodyModel> {
  final IVisitRepository _repository;

  PostSaveVisit(this._repository);

  @override
  Future<Either<Failure, void>> call(VisitBodyModel visitBodyModel) async {
    return await _repository.saveVisit(visitBodyModel);
  }
}
