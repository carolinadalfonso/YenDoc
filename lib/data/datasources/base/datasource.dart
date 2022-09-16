import 'package:yendoc/core/http/http_client.dart';

abstract class DataSource {
  final HttpClient httpClient;

  const DataSource({
    required this.httpClient,
  });
}
