import 'dart:convert';

import 'package:http/http.dart' as http;
import '../framework/localization/localization.dart';
import '../framework/util/util_preferences.dart';
import '../network/network_info.dart';

import '../errors/exceptions/exception.dart';

typedef HttpRequestDelegate = Future<http.Response> Function();

class HttpClient {
  final http.Client client;
  final NetworkInfo networkInfo;

  HttpClient({
    required this.client,
    required this.networkInfo,
  });

  Future<String> _execute(HttpRequestDelegate delegate) async {
    if (await networkInfo.isConnected) {
      http.Response? response;
      response = await delegate();

      if (response.statusCode == 200) {
        if (response.headers['set-cookie'] != null) {
          String token = response.headers['set-cookie'].toString();
          UtilPreferences.prefs.setString(UtilPreferences.token, token);
        }
        return utf8.decode(response.bodyBytes);
      } else if (response.statusCode == 503) {
        throw ServerException(code: 503, message: Localization.xCore.serviceUnavailable);
      } else {
        throw ServerException.fromJson(json.decode(response.body));
      }
    } else {
      throw NoInternetConnectionException(message: Localization.xCore.noInternet);
    }
  }

  Future<String> get({required String url, bool requireToken = false}) async {
    final Uri uriUrl = Uri.parse(url);
    return _execute(() async => await client.get(
          uriUrl,
          headers: _getHeaders(requireToken),
        ));
  }

  Future<String> post({required String url, Object? body, bool requireToken = false}) async {
    final Uri uriUrl = Uri.parse(url);
    return _execute(() async => await client.post(
          uriUrl,
          headers: _getHeaders(requireToken),
          body: body,
        ));
  }

  Future<String> put({required String url, Object? body, bool requireToken = false}) async {
    final Uri uriUrl = Uri.parse(url);
    return _execute(() async => await client.put(
          uriUrl,
          headers: _getHeaders(requireToken),
          body: body,
        ));
  }

  Future<String> delete({required String url, Object? body, bool requireToken = false}) async {
    final Uri uriUrl = Uri.parse(url);
    return _execute(() async => await client.delete(
          uriUrl,
          headers: _getHeaders(requireToken),
          body: body,
        ));
  }

  Map<String, String> _getHeaders(bool requireToken) {
    if (requireToken) {
      var token = UtilPreferences.prefs.getString(UtilPreferences.token)!;
      return {
        "Content-Type": "application/json",
        "Authorization": token,
      };
    } else {
      return {
        "Content-Type": "application/json",
      };
    }
  }
}
