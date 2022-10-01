import 'package:dartz/dartz.dart';
import 'package:yendoc/domain/usecases/visits/post/post_save_visit.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';
import '../../../data/models/requests/visit_body_model/visit_body_model.dart';

part 'save_visit_state.dart';

class SaveVisitCubit extends CubitBase<void, SaveVisitState> {
  final PostSaveVisit _postSaveVisit;

  SaveVisitCubit(this._postSaveVisit) : super(SaveVisitInitial());

  void saveVisit(VisitBodyModel visitBodyModel) async {
    emit(SaveVisitLoading());
    final either = await _postSaveVisit.call(visitBodyModel);
    emit(getState(either));
  }

  @override
  SaveVisitState getState(Either<Failure, void> either) {
    return either.fold(
      (failure) => SaveVisitError(failure),
      (data) => SaveVisitSuccess(),
    );
  }
}
