import 'package:dartz/dartz.dart';
import '../../../errors/failures/failure.dart';

abstract class IUseCase<Type, Parameters> {
  Future<Either<Failure, Type>> call(Parameters parameters);
}
