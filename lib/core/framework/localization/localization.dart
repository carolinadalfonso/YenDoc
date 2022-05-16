import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yendoc/core/framework/localization/base/localization_base.dart';

class Localization extends LocalizationBase {
  static _LoginLocalization xLogin = _LoginLocalization();
}

class _LoginLocalization {
  final username = 'login.username'.tr;
  final password = 'login.password'.tr;
  final signIn = 'login.signIn'.tr;
}
