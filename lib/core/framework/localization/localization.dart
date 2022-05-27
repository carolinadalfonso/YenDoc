import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yendoc/core/framework/localization/base/localization_base.dart';

class Localization extends LocalizationBase {
  static _LoginLocalization xLogin = _LoginLocalization();
  static _DrawerLocalization xDrawer = _DrawerLocalization();
  static _AboutLocalization xAbout = _AboutLocalization();
  static _VisitLocalization xVisit = _VisitLocalization();
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
  final visit = 'drawer.visit'.tr;
}

class _AboutLocalization {
  final developedBy = 'about.developedBy'.tr;
}

class _VisitLocalization {
  final detail = 'visit.detail'.tr;
  final map = 'visit.map'.tr;
  final photos = 'visit.photos'.tr;
  final signature = 'visit.signature'.tr;
  final camera = 'visit.camera'.tr;
  final finish = 'visit.finish'.tr;
}
