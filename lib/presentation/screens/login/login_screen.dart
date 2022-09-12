import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yendoc/presentation/screens/login/controller/login_controller.dart';
import 'package:yendoc/core/framework/localization/localization.dart';
import 'package:yendoc/core/framework/size_config/size_config.dart';
import 'package:yendoc/presentation/widgets/common/simple_button.dart';
import 'package:yendoc/presentation/widgets/common/text_field_custom.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginController controller = LoginController();

  @override
  void initState() {
    super.initState();

    controller.addListener(() => setState(() => {}));
  }

  @override
  void dispose() {
    super.dispose();

    controller.textUserController.dispose();
    controller.textPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth / 1.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset("assets/images/logo.png"),
              ),
              Form(
                key: controller.formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    TextFieldCustom(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: controller.textUserController,
                      prefixIcon: FontAwesomeIcons.userDoctor,
                      hint: Localization.xLogin.username,
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp('[a-z0-9]')),
                        LengthLimitingTextInputFormatter(32),
                      ],
                      validator: controller.formValidator.validateUser,
                    ),
                    const SizedBox(height: 20),
                    TextFieldCustom(
                      autovalidateMode: AutovalidateMode.disabled,
                      controller: controller.textPasswordController,
                      isPassword: true,
                      prefixIcon: Icons.lock,
                      hint: Localization.xLogin.password,
                      validator: controller.formValidator.validatePassword,
                      inputFormatters: [
                        LengthLimitingTextInputFormatter(32),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SimpleButton(
                      onPressed: () => controller.validateForm(),
                      text: Localization.xLogin.signIn,
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
