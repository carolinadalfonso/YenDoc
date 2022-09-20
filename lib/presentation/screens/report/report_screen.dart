import 'package:flutter/material.dart';
import 'controller/report_controller.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../../core/framework/theme/theme_manager.dart';
import '../../widgets/common/simple_button.dart';
import '../../widgets/common/text_field_custom.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ReportController controller = ReportController();

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
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth / 1.2,
          child: Form(
            key: controller.formKey,
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
                    validator: controller.formValidator.validateField,
                  ),
                  SimpleButton(
                    onPressed: () => controller.validateForm(),
                    text: Localization.xCommon.ok,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
