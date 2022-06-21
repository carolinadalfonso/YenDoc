import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';
import 'package:yendoc/core/framework/util/util.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class GalleryController extends GetxController {
  late VisitEntity visit;
  List images = [];

  init(VisitEntity visit) async {
    this.visit = visit;
    getVisitImages();
  }

  void getVisitImages() async {
    final Directory fullPath = await Util().getPhotosPath(visit.id);
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
}
