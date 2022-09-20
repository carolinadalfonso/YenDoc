part of 'visit_cubit.dart';

abstract class VisitState {
  const VisitState();
}

class VisitInitial extends VisitState {}

class VisitLoading extends VisitState {}

class VisitSuccess extends VisitState {
  final VisitEntity visit;

  const VisitSuccess(this.visit);
}

class VisitError extends VisitState {
  final Failure failure;

  const VisitError(this.failure);
}
