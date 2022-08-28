import 'dart:io';

import 'package:path_provider/path_provider.dart';

import '../localization/localization.dart';

class Util {
  static final RegExp passwordRegExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");

  static Future<Directory> getPhotosPath(int visitId) async {
    final Directory directortPath = Directory(await _localPath);
    final String folders = "/visits/$visitId/photos";
    final Directory fullPath = Directory("${directortPath.path}$folders");
    return fullPath;
  }

  static Future<Directory> getSignaturePath(int visitId) async {
    final Directory directortPath = Directory(await _localPath);
    final String folders = "/visits/$visitId/signature";
    final Directory fullPath = Directory("${directortPath.path}$folders");
    return fullPath;
  }

  static Future<String> getAndCreateSignaturePath(int visitId) async {
    final Directory fullPath = await getSignaturePath(visitId);
    if (!await fullPath.exists()) {
      await fullPath.create(recursive: true);
    }
    return "${fullPath.path}/signature.png";
  }

  static Future<String> get _localPath async {
    final Directory directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  static bool isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  static String? validateField(String? value) {
    return isEmpty(value) ? Localization.xValidation.requiredField : null;
  }
}
