import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hand_signature/signature.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';

import '../../../controllers/visit_controller.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../widgets/common/simple_button.dart';

class SignatureScreen extends GetView<VisitController> {
  const SignatureScreen({Key? key}) : super(key: key);

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
                      child: HandSignaturePainterView(
                        control: controller.patientHandSignatureControl,
                        color: Colors.black,
                        type: SignatureDrawType.shape,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
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
