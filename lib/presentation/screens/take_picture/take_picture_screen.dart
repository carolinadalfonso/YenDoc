import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../gallery/controller/gallery_controller.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/theme/theme_manager.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  final GalleryController controller;

  const TakePictureScreen({
    Key? key,
    required this.camera,
    required this.controller,
  }) : super(key: key);

  @override
  State<TakePictureScreen> createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  @override
  void initState() {
    super.initState();

    widget.controller.initializeControllerFuture = widget.controller.cameraController.initialize();
    widget.controller.getVisitImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localization.xVisit.camera)),
      body: FutureBuilder<void>(
        future: widget.controller.initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final scale = 1 / (widget.controller.cameraController.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
            widget.controller.flashOn
                ? widget.controller.cameraController.setFlashMode(FlashMode.torch)
                : widget.controller.cameraController.setFlashMode(FlashMode.off);

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Transform.scale(
                  scale: scale,
                  alignment: Alignment.topCenter,
                  child: CameraPreview(widget.controller.cameraController),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        backgroundColor: widget.controller.flashOn ? ThemeManager.kPrimaryColor : Colors.grey[400],
                        onPressed: () {
                          widget.controller.changeFlash();
                        },
                        child: widget.controller.flashOn ? const Icon(Icons.flash_on_rounded) : const Icon(Icons.flash_off_rounded),
                        heroTag: null,
                      ),
                      FloatingActionButton(
                        backgroundColor: ThemeManager.kPrimaryColor,
                        onPressed: () async {
                          await widget.controller.takePicture(context);
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
  }
}
