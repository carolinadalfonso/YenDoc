import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';
import '../../../core/framework/theme/theme_manager.dart';

import 'controller/signature_controller.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../../domain/entities/responses/visit_entity.dart';
import '../../widgets/common/simple_button.dart';

class SignatureScreen extends StatefulWidget {
  final VisitEntity visit;

  const SignatureScreen({
    Key? key,
    required this.visit,
  }) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final SignatureController controller = SignatureController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() => setState(() => {}));
    controller.setVisit(widget.visit);
    controller.loadSignature();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop(true);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          foregroundColor: ThemeManager.kPrimaryColor,
          backgroundColor: Colors.white,
          title: Text(
            Localization.xVisit.signature,
            style: TextStyle(color: ThemeManager.kPrimaryColor),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: SizeConfig.screenWidth / 1.1,
              height: SizeConfig.screenHeight,
              child: Column(
                children: [
                  Flexible(
                    child: Container(
                      height: SizeConfig.screenHeight / 1.1,
                      width: SizeConfig.screenWidth,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          color: ThemeManager.kPrimaryColor100,
                          width: 1,
                        ),
                      ),
                      child: !controller.signatureOK
                          ? HandSignature(
                              control: controller.patientHandSignatureControl,
                              color: Colors.black,
                              type: SignatureDrawType.shape,
                            )
                          : ValueListenableBuilder<ByteData?>(
                              valueListenable: controller.patientSignature,
                              builder: (context, data, child) {
                                if (data != null) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Image.memory(data.buffer.asUint8List()),
                                  );
                                } else {
                                  return const SizedBox.expand();
                                }
                              },
                            ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: !controller.signatureOK
                        ? Row(
                            children: [
                              Flexible(
                                child: SimpleButton(
                                  text: Localization.xCommon.ok,
                                  onPressed: () => controller.confirmSignature(),
                                ),
                              ),
                              SizedBox(width: SizeConfig.blockSizeHorizontal),
                              Flexible(
                                child: SimpleButton(
                                  isSecondary: true,
                                  text: Localization.xSignature.clean,
                                  onPressed: () => controller.clearSignature(),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              Flexible(
                                child: SimpleButton(
                                  isSecondary: true,
                                  text: Localization.xSignature.cleanAndSign,
                                  onPressed: () => controller.clearSignatureAndSign(),
                                ),
                              ),
                            ],
                          ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
