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

  @override
  Future<List<PictureEntity>> getPictures(int id) async {
    String finalEndpoint = _endpointGetPictures.replaceAll("{visitId}", id.toString());
    String data = await httpClient.post(
      url: "$_url/$finalEndpoint",
      requireToken: true,
    );

    List dataPictures = json.decode(data);
    return dataPictures.map((picture) => PictureModel.fromJson(picture)).toList();
  }

  @override
  Future<void> savePicture(PictureBodyModel pictureBodyModel) async {
    await httpClient.post(
      url: "$_url/$_endpointSavePicture",
      body: json.encode(pictureBodyModel.toJson()),
      requireToken: true,
    );
  }
}
