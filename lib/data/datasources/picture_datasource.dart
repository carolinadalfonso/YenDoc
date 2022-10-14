import 'dart:convert';

import 'package:global_configuration/global_configuration.dart';
import 'package:yendoc/data/models/requests/picture_bode_model/picture_body_model.dart';

import '../../domain/entities/responses/picture_entity.dart';
import '../models/responses/picture/picture_model.dart';
import 'base/datasource.dart';
import 'interfaces/ipicture_datasource.dart';

class PictureDatasource extends DataSource implements IPictureDatasource {
  PictureDatasource({
    required super.httpClient,
  });

  final String _url = GlobalConfiguration().getValue("api");
  final String _endpointGetPictures = GlobalConfiguration().getDeepValue("endpoints:pictures:byVisit");
  final String _endpointSavePicture = GlobalConfiguration().getDeepValue("endpoints:pictures:save");
  final String _endpointDeletePicture = GlobalConfiguration().getDeepValue("endpoints:pictures:delete");

  @override
  Future<List<PictureEntity>> getPictures(int id) async {
    String finalEndpoint = _endpointGetPictures.replaceAll("{visitId}", id.toString());
    String data = await httpClient.get(
      url: "$_url/$finalEndpoint",
      requireToken: true,
    );

    List dataPictures = json.decode(data);
    return dataPictures.map((picture) => PictureModel.fromJson(picture)).toList();
  }

  @override
  Future<int> savePicture(PictureBodyModel pictureBodyModel) async {
    String data = await httpClient.post(
      url: "$_url/$_endpointSavePicture",
      body: json.encode(pictureBodyModel.toJson()),
      requireToken: true,
    );
    return int.parse(data);
  }

  @override
  Future<void> deletePicture(int pictureId) async {
    String finalEndpoint = _endpointDeletePicture.replaceAll("{pictureId}", pictureId.toString());
    await httpClient.delete(
      url: "$_url/$finalEndpoint",
      requireToken: true,
    );
  }
}
