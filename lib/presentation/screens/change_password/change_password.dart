import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/framework/bloc/injection_container.dart';
import '../../../core/framework/localization/localization.dart';
import '../../../core/framework/size_config/size_config.dart';
import '../../../core/framework/theme/theme_manager.dart';
import '../../../core/framework/util/cool_snack_bar.dart';
import '../../../core/framework/util/general_navigator.dart';
import '../../cubit/change_password/change_password_cubit.dart';
import '../../widgets/common/simple_button.dart';
import '../../widgets/common/simple_scroll.dart';
import '../../widgets/common/text_field_custom.dart';
import 'controller/change_password_controller.dart';

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
        child: BlocProvider<ChangePasswordCubit>(
          create: (context) => sl<ChangePasswordCubit>(),
          child: BlocConsumer<ChangePasswordCubit, ChangePasswordState>(
            listener: (bloc, state) {
              if (state is ChangePasswordSuccess) {
                CoolSnackBar.of(context).success(Localization.xPassword.changeOk);
                GeneralNavigator.pop();
              } else if (state is ChangePasswordError) {
                CoolSnackBar.of(context).error(state.failure.message);
              }
            },
            builder: (blocContext, state) {
              return AbsorbPointer(
                absorbing: state is ChangePasswordLoading,
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: SizeConfig.screenHeight - 90,
                    width: SizeConfig.screenWidth / 1.2,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20),
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
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 25),
                                  child: SimpleButton(
                                    onPressed: () => controller.validateForm(blocContext),
                                    text: Localization.xDrawer.changePassword,
                                    isLoading: state is ChangePasswordLoading,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
