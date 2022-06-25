import 'package:flutter/material.dart';
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
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth / 1.2,
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFieldCustom(
                  controller: controller.textActualPasswordController,
                  description: Localization.xPassword.current,
                  isPassword: true,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: TextFieldCustom(
                    controller: controller.textNewPasswordController,
                    description: Localization.xPassword.newPassword,
                    isPassword: true,
                  ),
                ),
                TextFieldCustom(
                  controller: controller.textRepeatNewPasswordController,
                  description: Localization.xPassword.repeatNew,
                  isPassword: true,
                ),
                const SizedBox(height: 50),
                SimpleButton(
                  onPressed: () => {},
                  text: Localization.xDrawer.changePassword,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
