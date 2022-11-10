import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:yendoc/core/framework/util/cool_snack_bar.dart';

class Util {
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

  static Future<void> launchURL(String url, BuildContext context) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      Future.delayed(
        const Duration(milliseconds: 100),
        () => CoolSnackBar.of(context).error("Se ha producido un error"),
      );
    }
  }
}
