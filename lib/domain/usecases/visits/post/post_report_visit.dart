import 'package:dartz/dartz.dart';
import '../../../entities/responses/visit_card_entity.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../repositories/ivisit_repository.dart';

class PostReportVisits implements IUseCase<List<VisitCardEntity>, DateTime> {
  final IVisitRepository _repository;

  PostReportVisits(this._repository);

  @override
  Future<Either<Failure, List<VisitCardEntity>>> call(DateTime date) async {
    return await _repository.getReportVisits(date);
  }
}
