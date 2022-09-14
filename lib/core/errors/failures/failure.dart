abstract class Failure {
  final int code;
  final String message;

  const Failure({
    required this.code,
    required this.message,
  });
}

class UnexpectedFailure extends Failure {
  const UnexpectedFailure() : super(code: 500, message: "Unexpected error");

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
