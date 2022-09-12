import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yendoc/core/network/network_info.dart';

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
        return utf8.decode(response.bodyBytes);
      } else if (response.statusCode == 503) {
        throw Exception("Servicio no disponible");
      } else {
        throw Exception(json.decode(response.body));
      }
    } else {
      throw Exception("No hay conexión a internet");
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

  Map<String, String> _getHeaders(bool requireToken) {
    return requireToken
        ? {
            "Content-Type": "application/json",
            "Authorization": "Bearer xxx",
          }
        : {
            "Content-Type": "application/json",
          };
  }
}
