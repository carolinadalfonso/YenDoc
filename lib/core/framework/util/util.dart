import 'dart:io';

import 'package:path_provider/path_provider.dart';

class Util {
  Future<Directory> getPhotosPath(int visitId) async {
    final Directory directortPath = Directory(await _localPath);
    final String folders = "/visits/$visitId/photos";
    final Directory fullPath = Directory("${directortPath.path}$folders");
    return fullPath;
  }

  Future<Directory> getSignaturePath(int visitId) async {
    final Directory directortPath = Directory(await _localPath);
    final String folders = "/visits/$visitId/signature";
    final Directory fullPath = Directory("${directortPath.path}$folders");
    return fullPath;
  }

  Future<String> getAndCreateSignaturePath(int visitId) async {
    final Directory fullPath = await getSignaturePath(visitId);
    if (!await fullPath.exists()) {
      await fullPath.create(recursive: true);
    }
    return "${fullPath.path}/signature.png";
  }

  Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
}