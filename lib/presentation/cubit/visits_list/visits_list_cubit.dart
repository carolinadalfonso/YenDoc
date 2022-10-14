import 'package:dartz/dartz.dart';
import 'package:yendoc/domain/usecases/visits/post/post_report_visit.dart';
import '../../../data/models/requests/location_body_model/location_body_model.dart';
import '../../../domain/entities/responses/visit_card_entity.dart';
import '../../../domain/usecases/visits/post/post_visits.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';

part 'visits_list_state.dart';

class VisitsListCubit extends CubitBase<List<VisitCardEntity>, VisitsListState> {
  final PostVisits _postVisits;
  final PostReportVisits _postReportVisits;

  VisitsListCubit(this._postVisits, this._postReportVisits) : super(VisitsListInitial());

  void getVisits(LocationBodyModel locationBodyModel) async {
    emit(VisitsListLoading());
    final either = await _postVisits.call(locationBodyModel);
    emit(getState(either));
  }

  void getReportVisits(DateTime date) async {
    emit(VisitsListLoading());
    final either = await _postReportVisits.call(date);
    emit(getState(either));
  }

  void geoLocalizationError() {
    emit(VisitsListGeoLocalizationError());
  }

  @override
  VisitsListState getState(Either<Failure, List<VisitCardEntity>> either) {
    return either.fold(
      (failure) => VisitsListError(failure),
      (data) => VisitsListSuccess(data),
    );
  }
}
