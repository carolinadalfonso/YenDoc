import '../../framework/localization/localization.dart';

abstract class Failure {
  final int code;
  final String message;

  const Failure({
    required this.code,
    required this.message,
  });
}

class UnexpectedFailure extends Failure {
  UnexpectedFailure() : super(code: 500, message: Localization.xCore.unexceptedError);

  @override
  String toString() => super.message;
}

class ServerFailure extends Failure {
  const ServerFailure({
    required int code,
    required String message,
  }) : super(code: code, message: message);
}

class NoInternetConnectionFailure extends Failure {
  const NoInternetConnectionFailure({required String message}) : super(code: 599, message: message);
}
