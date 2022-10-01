part of 'save_visit_cubit.dart';

abstract class SaveVisitState {
  const SaveVisitState();
}

class SaveVisitInitial extends SaveVisitState {}

class SaveVisitLoading extends SaveVisitState {}

class SaveVisitSuccess extends SaveVisitState {}

class SaveVisitError extends SaveVisitState {
  final Failure failure;

  const SaveVisitError(this.failure);
}
