import 'package:json_annotation/json_annotation.dart';

import '../../framework/localization/localization.dart';

part 'exception.g.dart';

abstract class Exception {
  final int code;
  final String message;

  const Exception({
    required this.code,
    required this.message,
  });
}

class UnexpectedException extends Exception {
  UnexpectedException() : super(code: 500, message: Localization.xCore.unexceptedError);

  @override
  String toString() => super.message;
}

@JsonSerializable(createToJson: false)
class ServerException extends Exception {
  const ServerException({
    required int code,
    required String message,
  }) : super(code: code, message: message);

  factory ServerException.fromJson(Map<String, dynamic> json) {
    try {
      return _$ServerExceptionFromJson(json);
    } catch (e) {
      int status = json["status"];
      String error = json["error"];
      return ServerException(code: status, message: error);
    }
  }
}

class NoInternetConnectionException extends Exception {
  const NoInternetConnectionException({required String message}) : super(code: 599, message: message);
}
