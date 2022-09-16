import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';

import '../../../errors/failures/failure.dart';

abstract class CubitBase<Entity, State> extends Cubit<State> {
  CubitBase(
    super.initialState,
  );

  State getState(Either<Failure, Entity> either);
}
