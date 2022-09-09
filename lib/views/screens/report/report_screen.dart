import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yendoc/controllers/report_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/widgets/common/simple_button.dart';
import 'package:yendoc/views/widgets/common/text_field_custom.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: ThemeManager.kPrimaryColor,
        backgroundColor: Colors.white,
        title: Text(
          Localization.xDrawer.report,
          style: TextStyle(color: ThemeManager.kPrimaryColor),
        ),
      ),
      body: GetBuilder<ReportController>(
        builder: (controller) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth / 1.2,
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFieldCustom(
                        readOnly: true,
                        autovalidateMode: AutovalidateMode.disabled,
                        controller: controller.textDatePickController,
                        description: Localization.xReport.date,
                        isDate: true,
                        validator: (_) {
                          return controller.validateDate();
                        },
                      ),
                      SimpleButton(
                        onPressed: () => controller.validateForm(_formKey),
                        text: Localization.xCommon.ok,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
