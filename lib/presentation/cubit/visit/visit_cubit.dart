import 'package:dartz/dartz.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';
import '../../../domain/entities/responses/visit_entity.dart';
import '../../../domain/usecases/visits/get/get_report_visit.dart';
import '../../../domain/usecases/visits/get/get_visit.dart';

part 'visit_state.dart';

class VisitCubit extends CubitBase<VisitEntity, VisitState> {
  final GetVisit _getVisit;
  final GetReportVisit _getReportVisit;

  VisitCubit(this._getVisit, this._getReportVisit) : super(VisitInitial());

  void getVisit(int id) async {
    emit(VisitLoading());
    final either = await _getVisit.call(id);
    emit(getState(either));
  }

  void getReportVisit(int id) async {
    emit(VisitLoading());
    final either = await _getReportVisit.call(id);
    emit(getState(either));
  }

  @override
  VisitState getState(Either<Failure, VisitEntity> either) {
    return either.fold(
      (failure) => VisitError(failure),
      (data) => VisitSuccess(data),
    );
  }
}
