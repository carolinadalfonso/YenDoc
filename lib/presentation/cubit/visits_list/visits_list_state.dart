part of 'visits_list_cubit.dart';

abstract class VisitsListState {
  const VisitsListState();
}

class VisitsListInitial extends VisitsListState {}

class VisitsListLoading extends VisitsListState {}

class VisitsListSuccess extends VisitsListState {
  final List<VisitCardEntity> visits;

  const VisitsListSuccess(this.visits);
}

class VisitsListError extends VisitsListState {
  final Failure failure;

  const VisitsListError(this.failure);
}

class VisitsListGeoLocalizationError extends VisitsListState {}
