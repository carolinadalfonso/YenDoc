import 'package:dartz/dartz.dart';
import '../../../entities/responses/visit_card_entity.dart';

import '../../../../core/errors/failures/failure.dart';
import '../../../../core/framework/bloc/usecase/iusecase.dart';
import '../../../../data/models/requests/location_body_model/location_body_model.dart';
import '../../../repositories/ivisit_repository.dart';

class PostVisits implements IUseCase<List<VisitCardEntity>, LocationBodyModel> {
  final IVisitRepository _repository;

  PostVisits(this._repository);

  @override
  Future<Either<Failure, List<VisitCardEntity>>> call(LocationBodyModel locationBodyModel) async {
    return await _repository.getVisits(locationBodyModel);
  }
}
