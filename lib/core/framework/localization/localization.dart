import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:yendoc/core/framework/localization/base/localization_base.dart';

class Localization extends LocalizationBase {
  static _CommonLocalization xCommon = _CommonLocalization();
  static _LoginLocalization xLogin = _LoginLocalization();
  static _DrawerLocalization xDrawer = _DrawerLocalization();
  static _AboutLocalization xAbout = _AboutLocalization();
  static _VisitLocalization xVisit = _VisitLocalization();
  static _GalleryLocalization xGallery = _GalleryLocalization();
}

class _CommonLocalization {
  final yes = 'common.yes'.tr;
  final no = 'common.no'.tr;
  final ok = 'common.ok'.tr;
  final cancel = 'common.cancel'.tr;
  final yearsOld = 'common.yearsOld'.tr;
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
  final patient = 'visit.patient'.tr;
  final address = 'visit.address'.tr;
  final age = 'visit.age'.tr;
  final symptoms = 'visit.symptoms'.tr;
  final diagnostic = 'visit.diagnostic'.tr;
  final posibleCovid = 'visit.posibleCovid'.tr;
}

class _GalleryLocalization {
  final noPhotos = 'gallery.noPhotos'.tr;
  final deletedPhoto = 'gallery.deletedPhoto'.tr;
  final deletedPhotoError = 'gallery.deletedPhotoError'.tr;
  final photo = 'gallery.photo'.tr;
}
