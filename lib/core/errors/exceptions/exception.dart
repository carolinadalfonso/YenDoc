abstract class Exception {
  final int code;
  final String message;

  const Exception({
    required this.code,
    required this.message,
  });
}

class UnexpectedException extends Exception {
  const UnexpectedException() : super(code: 500, message: "Unexpected error");

  @override
  String toString() => super.message;
}

class ServerException extends Exception {
  const ServerException({
    required int code,
    required String message,
  }) : super(code: code, message: message);
}

class NoInternetConnectionException extends Exception {
  const NoInternetConnectionException({required String message}) : super(code: 599, message: message);
}
