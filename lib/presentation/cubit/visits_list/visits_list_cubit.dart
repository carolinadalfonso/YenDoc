import 'package:dartz/dartz.dart';
import 'package:yendoc/data/models/requests/location_body_model/location_body_model.dart';
import 'package:yendoc/domain/entities/responses/visit_card_entity.dart';
import 'package:yendoc/domain/usecases/visits/post/post_visits.dart';

import '../../../core/errors/failures/failure.dart';
import '../../../core/framework/bloc/cubit/cubit_base.dart';

part 'visits_list_state.dart';

class VisitsListCubit extends CubitBase<List<VisitCardEntity>, VisitsListState> {
  final PostVisits _postVisits;

  VisitsListCubit(this._postVisits) : super(VisitsListInitial());

  void getVisits(LocationBodyModel locationBodyModel) async {
    emit(VisitsListLoading());
    final either = await _postVisits.call(locationBodyModel);
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
