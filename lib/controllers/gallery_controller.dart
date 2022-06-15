import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class GalleryController extends GetxController {
  late VisitEntity visit;
  List images = [];

  init(VisitEntity visit) async {
    this.visit = visit;
    getVisitImages();
  }

  void getVisitImages() async {
    final Directory directortPath = Directory(await _localPath);
    final String folders = "/visits/${visit.id}";
    final Directory fullPath = Directory("${directortPath.path}$folders");
    images.clear();
    if (await fullPath.exists()) {
      images = fullPath.listSync();
    }
    update();
  }

  void deleteImage(File image, BuildContext context) async {
    await image.delete();
    CoolSnackBar.of(context).success(Localization.xGallery.deletedPhoto);
    getVisitImages();
  }

  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
