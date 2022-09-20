import 'package:dartz/dartz.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../entities/responses/visit_entity.dart';
import '../../../repositories/ivisit_repository.dart';

class GetVisit implements IUseCase<VisitEntity, int> {
  final IVisitRepository _repository;

  GetVisit(this._repository);

  @override
  Future<Either<Failure, VisitEntity>> call(int id) async {
    return await _repository.getVisit(id);
  }
}
