import '../../../domain/entities/responses/picture_entity.dart';
import '../../models/requests/picture_bode_model/picture_body_model.dart';

abstract class IPictureDatasource {
  Future<List<PictureEntity>> getPictures(int id);
  Future<int> savePicture(PictureBodyModel pictureBodyModel);
  Future<void> deletePicture(int pictureId);
}
