import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yendoc/core/framework/localization/base/localization_base.dart';

class Localization extends LocalizationBase {
  static _LoginLocalization xLogin = _LoginLocalization();
  static _DrawerLocalization xDrawer = _DrawerLocalization();
  static _AboutLocalization xAbout = _AboutLocalization();
}

class _LoginLocalization {
  final username = 'login.username'.tr;
  final password = 'login.password'.tr;
  final signIn = 'login.signIn'.tr;
}

class _DrawerLocalization {
  final visits = 'drawer.visits'.tr;
  final about = 'drawer.about'.tr;
  final signOut = 'drawer.signOut'.tr;
}

class _AboutLocalization {
  final developedBy = 'about.developedBy'.tr;
}
