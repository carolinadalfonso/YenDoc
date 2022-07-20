import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';
import 'package:yendoc/models/visit/visit_entity.dart';

import '../core/framework/util/util.dart';

class SignatureController extends GetxController {
  late VisitEntity visit;
  late String fullPathSign;
  bool signatureOK = false;
  ValueNotifier<ByteData?> patientSignature = ValueNotifier<ByteData?>(null);

  final HandSignatureControl patientHandSignatureControl = HandSignatureControl(
    threshold: 0.001,
    smoothRatio: 0.35,
    velocityRange: 2.0,
  );

  Future<void> init(VisitEntity visit) async {
    this.visit = visit;
    loadSignature();
  }

  void clearSignature() {
    patientHandSignatureControl.clear();
    patientSignature.value = null;
  }

  bool checkSignaturesEmpty() {
    return patientSignature.value == null;
  }

  void confirmSignature() async {
    patientSignature.value = await patientHandSignatureControl.toImage();
    if (!checkSignaturesEmpty()) {
      fullPathSign = await Util().getAndCreateSignaturePath(visit.id);
      File(fullPathSign).writeAsBytesSync(patientSignature.value!.buffer.asInt8List());
    }

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
      Get.back();
    });
  }

  void loadSignature() async {
    fullPathSign = await Util().getAndCreateSignaturePath(visit.id);
    File file = File(fullPathSign);
    if (await file.exists()) {
      Uint8List bytes = file.readAsBytesSync();
      ByteData signatureBytes = ByteData.view(bytes.buffer);
      patientSignature.value = signatureBytes;
      signatureOK = true;
    } else {
      clearSignature();
      signatureOK = false;
    }
  }

  void clearSignatureAndSign() {
    File file = File(fullPathSign);
    file.deleteSync();
    clearSignature();
    signatureOK = false;
    update();
  }
}
