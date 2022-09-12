import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yendoc/presentation/screens/change_password/controller/change_password_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/core/framework/theme/theme_manager.dart';
import 'package:yendoc/presentation/widgets/common/simple_button.dart';
import 'package:yendoc/presentation/widgets/common/simple_scroll.dart';
import 'package:yendoc/presentation/widgets/common/text_field_custom.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final ChangePasswordController controller = ChangePasswordController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    super.dispose();

    controller.textActualPasswordController.dispose();
    controller.textNewPasswordController.dispose();
    controller.textRepeatNewPasswordController.dispose();
  }

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
      body: SimpleScroll(
        child: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: SizeConfig.screenHeight,
            width: SizeConfig.screenWidth / 1.2,
            child: Form(
              key: controller.formKey,
              child: Column(
                children: [
                  TextFieldCustom(
                    controller: controller.textActualPasswordController,
                    description: Localization.xPassword.current,
                    isPassword: true,
                    autovalidateMode: AutovalidateMode.disabled,
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(32),
                    ],
                    validator: controller.formValidator.validatePassword,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: TextFieldCustom(
                      controller: controller.textNewPasswordController,
                      description: Localization.xPassword.newPassword,
                      isPassword: true,
                      autovalidateMode: AutovalidateMode.disabled,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(32),
                      ],
                      validator: controller.formValidator.validatePassword,
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
                      return controller.formValidator.validateRepeatPassword(controller.textNewPasswordController.text, repeatNewPassword);
                    },
                  ),
                  const SizedBox(height: 20),
                  SimpleButton(
                    onPressed: () => controller.validateForm(context),
                    text: Localization.xDrawer.changePassword,
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
