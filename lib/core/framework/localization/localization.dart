import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'base/localization_base.dart';

class Localization extends LocalizationBase {
  static _CommonLocalization xCommon = _CommonLocalization();
  static _CoreLocalization xCore = _CoreLocalization();
  static _LoginLocalization xLogin = _LoginLocalization();
  static _DrawerLocalization xDrawer = _DrawerLocalization();
  static _AboutLocalization xAbout = _AboutLocalization();
  static _VisitLocalization xVisit = _VisitLocalization();
  static _GalleryLocalization xGallery = _GalleryLocalization();
  static _FinishLocalization xFinish = _FinishLocalization();
  static _SignatureLocalization xSignature = _SignatureLocalization();
  static _MapLocalization xMap = _MapLocalization();
  static _PasswordLocalization xPassword = _PasswordLocalization();
  static _ReportLocalization xReport = _ReportLocalization();
  static _ValidationLocalization xValidation = _ValidationLocalization();
}

class _CommonLocalization {
  final yes = 'common.yes'.tr;
  final no = 'common.no'.tr;
  final ok = 'common.ok'.tr;
  final cancel = 'common.cancel'.tr;
  final yearsOld = 'common.yearsOld'.tr;
}

class _CoreLocalization {
  final unexceptedError = 'core.unexceptedError'.tr;
  final serviceUnavailable = 'core.serviceUnavailable'.tr;
  final noInternet = 'core.noInternet'.tr;
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
  final report = 'drawer.report'.tr;
  final changePassword = 'drawer.changePassword'.tr;
  final questionSignOut = 'drawer.questionSignOut'.tr;
  final userGuide = 'drawer.userGuide'.tr;
}

class _AboutLocalization {
  final developedBy = 'about.developedBy'.tr;
}

class _VisitLocalization {
  final error = 'visit.error'.tr;
  final empty = 'visit.empty'.tr;
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
  final possibleCovid = 'visit.possibleCovid'.tr;
}

class _GalleryLocalization {
  final noPhotos = 'gallery.noPhotos'.tr;
  final deletedPhoto = 'gallery.deletedPhoto'.tr;
  final savedPhoto = 'gallery.savedPhoto'.tr;
  final deletedPhotoError = 'gallery.deletedPhotoError'.tr;
  final savePhotoError = 'gallery.savePhotoError'.tr;
  final photo = 'gallery.photo'.tr;
  final questionDeletePhoto = 'gallery.questionDeletePhoto'.tr;
  final deletePhoto = 'gallery.deletePhoto'.tr;
}

class _FinishLocalization {
  final visit = 'finish.visit'.tr;
  final ok = 'finish.ok'.tr;
  final notOk = 'finish.notOk'.tr;
  final question = 'finish.question'.tr;
}

class _SignatureLocalization {
  final clean = 'signature.clean'.tr;
  final cleanAndSign = 'signature.cleanAndSign'.tr;
}

class _MapLocalization {
  final you = 'map.you'.tr;
  final patient = 'map.patient'.tr;
}

class _PasswordLocalization {
  final current = 'password.current'.tr;
  final newPassword = 'password.new'.tr;
  final repeatNew = 'password.repeatNew'.tr;
  final changeOk = 'password.changeOk'.tr;
  final changeNotOk = 'password.changeNotOk'.tr;
}

class _ReportLocalization {
  final date = 'report.date'.tr;
  final visits = 'report.visits'.tr;
  final visit = 'report.visit'.tr;
}

class _ValidationLocalization {
  final requiredField = 'validation.requiredField'.tr;
  final passwordDontMatch = 'validation.passwordDontMatch'.tr;
  final passwordRequisits = 'validation.passwordRequisits'.tr;
  final userLenght = 'validation.userLenght'.tr;
  final visitRequisitsOk = 'validation.visitRequisitsOk'.tr;
  final visitRequisitsOkPossibleCOVID = 'validation.visitRequisitsOkPossibleCOVID'.tr;
  final visitRequisitsNotOk = 'validation.visitRequisitsNotOk'.tr;
  final saveVisitOk = 'validation.saveVisitOk'.tr;
  final finishingVisit = 'validation.finishingVisit'.tr;
}
