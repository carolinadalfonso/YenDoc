import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/gallery_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

class TakePictureScreen extends GetView<GalleryController> {
  final CameraDescription camera;
  final VisitEntity visit;

  const TakePictureScreen({
    Key? key,
    required this.camera,
    required this.visit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<GalleryController>(
      initState: (state) async => await controller.init(visit, camera),
      init: controller,
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(title: Text(Localization.xVisit.camera)),
          body: FutureBuilder<void>(
            future: controller.initializeControllerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final scale = 1 / (controller.cameraController.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
                controller.flashOn
                    ? controller.cameraController.setFlashMode(FlashMode.torch)
                    : controller.cameraController.setFlashMode(FlashMode.off);

                return Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Transform.scale(
                      scale: scale,
                      alignment: Alignment.topCenter,
                      child: CameraPreview(controller.cameraController),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FloatingActionButton(
                            backgroundColor: controller.flashOn ? ThemeManager.kPrimaryColor : Colors.grey[400],
                            onPressed: () {
                              controller.changeFlash();
                            },
                            child: controller.flashOn ? const Icon(Icons.flash_on_rounded) : const Icon(Icons.flash_off_rounded),
                            heroTag: null,
                          ),
                          FloatingActionButton(
                            backgroundColor: ThemeManager.kPrimaryColor,
                            onPressed: () async {
                              await controller.takePicture(context);
                            },
                            child: const Icon(Icons.photo_camera_rounded),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        );
      },
    );
  }
}
