import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/screens/display_picture/display_picture.dart';

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

  @override
  void initState() {
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.high,
    );
    _visitId = widget.visitId;
    _initializeControllerFuture = _controller.initialize();
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
            _controller.setFlashMode(FlashMode.off);
            return Transform.scale(
              scale: scale,
              alignment: Alignment.topCenter,
              child: CameraPreview(_controller),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeManager.kPrimaryColor,
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            final image = await _controller.takePicture();
            final directortPath = Directory(await _localPath);
            //Creación de carpeta Visitas
            String folderVisits = "/visits";
            final pathVisits = Directory("${directortPath.path}$folderVisits");
            if (!await pathVisits.exists()) {
              await pathVisits.create();
            }
            //Creación de carpeta con el Id de la Visita
            String folderVisitId = "/$_visitId";
            final pathVisitId = Directory("${directortPath.path}$folderVisits$folderVisitId");
            if (!await pathVisitId.exists()) {
              await pathVisitId.create();
            }
            // Ruta final del archivo
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
          } catch (e) {
            rethrow;
          }
        },
        child: const Icon(Icons.photo_camera_rounded),
      ),
    );
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}
