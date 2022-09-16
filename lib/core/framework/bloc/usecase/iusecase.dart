import 'package:dartz/dartz.dart';
import 'package:yendoc/core/errors/failures/failure.dart';

abstract class IUseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters parameters);
}
