import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yendoc/controllers/change_password_controller.dart';
import 'package:yendoc/controllers/login_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/views/widgets/common/simple_button.dart';
import 'package:yendoc/views/widgets/common/text_field_custom.dart';

class ChangePasswordScreen extends GetView<ChangePasswordController> {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        foregroundColor: ThemeManager.kPrimaryColor,
        backgroundColor: Colors.white,
        title: Text(
          Localization.xDrawer.changePassword,
          style: TextStyle(color: ThemeManager.kPrimaryColor),
        ),
      ),
      body: GetBuilder<ChangePasswordController>(
        initState: (state) async => await controller.init(),
        init: controller,
        builder: (controller) {
          return Align(
            alignment: Alignment.center,
            child: SizedBox(
              height: SizeConfig.screenHeight,
              width: SizeConfig.screenWidth / 1.2,
              child: Form(
                key: controller.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFieldCustom(
                      controller: controller.textActualPasswordController,
                      description: Localization.xPassword.current,
                      isPassword: true,
                      autovalidateMode: AutovalidateMode.disabled,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(32),
                      ],
                      validator: (currentPassword) {
                        return controller.validateField(currentPassword);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50),
                      child: TextFieldCustom(
                        controller: controller.textNewPasswordController,
                        description: Localization.xPassword.newPassword,
                        isPassword: true,
                        autovalidateMode: AutovalidateMode.disabled,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(32),
                        ],
                        validator: (newPassword) {
                          return controller.validateField(newPassword);
                        },
                      ),
                    ),
                    TextFieldCustom(
                      controller: controller.textRepeatNewPasswordController,
                      description: Localization.xPassword.repeatNew,
                      isPassword: true,
                      autovalidateMode: AutovalidateMode.disabled,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(32),
                      ],
                      validator: (repeatNewPassword) {
                        return controller.validateRepeatPassword(repeatNewPassword);
                      },
                    ),
                    const SizedBox(height: 50),
                    SimpleButton(
                      onPressed: () => controller.validateForm(context),
                      text: Localization.xDrawer.changePassword,
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
