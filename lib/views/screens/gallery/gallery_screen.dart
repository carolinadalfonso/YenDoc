import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/gallery_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

import '../../../core/framework/util/cool_dialog.dart';

class GalleryScreen extends GetView<GalleryController> {
  final VisitEntity visit;
  final CameraDescription? camera;
  final bool? readOnly;

  const GalleryScreen({
    Key? key,
    required this.visit,
    this.camera,
    this.readOnly = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(
      initState: (state) async => await controller.init(visit, null),
      init: controller,
      builder: (controller) {
        return Center(
          child: controller.images.isNotEmpty
              ? PageView.builder(
                  controller: PageController(viewportFraction: 0.8),
                  itemCount: controller.images.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.file(
                              controller.images[index],
                              fit: BoxFit.cover,
                            ),
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: IconButton(
                                splashRadius: 26,
                                splashColor: Colors.grey[200],
                                icon: const Icon(FontAwesomeIcons.solidTrashCan),
                                color: Colors.grey[400],
                                onPressed: readOnly!
                                    ? null
                                    : () async {
                                        CoolDialog.of(context).show(
                                          textButton1: Localization.xCommon.yes,
                                          textButton2: Localization.xCommon.no,
                                          question: Localization.xGallery.questionDeletePhoto,
                                          title: Localization.xGallery.deletePhoto,
                                          onPressed1: () {
                                            controller.deleteImage(controller.images[index], context);
                                            Get.back();
                                          },
                                          onPressed2: () => Get.back(),
                                        );
                                      },
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        FontAwesomeIcons.images,
                        size: 128,
                        color: ThemeManager.kPrimaryColor50,
                      ),
                      Text(
                        Localization.xGallery.noPhotos,
                        style: TextStyle(
                          color: ThemeManager.kPrimaryColor100,
                        ),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
