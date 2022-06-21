import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/screens/display_picture/display_picture.dart';

import '../../../core/framework/util/util.dart';

class TakePictureScreen extends StatefulWidget {
  final CameraDescription camera;
  final int visitId;

  const TakePictureScreen({
    super.key,
    required this.camera,
    required this.visitId,
  });

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late int _visitId;
  late Future<void> _initializeControllerFuture;
  late bool _isCapturing;
  late bool _flashOn;

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _visitId = widget.visitId;
    _initializeControllerFuture = _controller.initialize();
    _isCapturing = false;
    _flashOn = false;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Localization.xVisit.camera)),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            final scale = 1 / (_controller.value.aspectRatio * MediaQuery.of(context).size.aspectRatio);
            _flashOn ? _controller.setFlashMode(FlashMode.torch) : _controller.setFlashMode(FlashMode.off);

            return Stack(
              alignment: Alignment.topCenter,
              children: [
                Transform.scale(
                  scale: scale,
                  alignment: Alignment.topCenter,
                  child: CameraPreview(_controller),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FloatingActionButton(
                        backgroundColor: _flashOn ? ThemeManager.kPrimaryColor : Colors.grey[400],
                        onPressed: () {
                          setState(() {
                            _flashOn = !_flashOn;
                          });
                        },
                        child: _flashOn ? const Icon(Icons.flash_on_rounded) : const Icon(Icons.flash_off_rounded),
                        heroTag: null,
                      ),
                      FloatingActionButton(
                        backgroundColor: ThemeManager.kPrimaryColor,
                        onPressed: _isCapturing
                            ? null
                            : () async {
                                setState(() {
                                  _isCapturing = true;
                                });

                                try {
                                  await _initializeControllerFuture;

                                  await _controller.takePicture().then((image) async {
                                    final pathVisitId = await Util().getPhotosPath(_visitId);
                                    if (!await pathVisitId.exists()) {
                                      await pathVisitId.create(recursive: true);
                                    }
                                    String fullPath = "${pathVisitId.path}/${image.name}";
                                    //Guardado y borrado del archivo automático
                                    await image.saveTo(fullPath);
                                    final imagenDefault = File(image.path);
                                    await imagenDefault.delete();

                                    await Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (context) => DisplayPictureScreen(
                                          imagePath: fullPath,
                                        ),
                                      ),
                                    );
                                  }).whenComplete(() {
                                    setState(() {
                                      _isCapturing = false;
                                    });
                                  });
                                } catch (e) {
                                  rethrow;
                                }
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
