import 'package:yendoc/controllers/login_controller.dart';

abstract class LocalizationBase extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es': {
          'common.ok': 'Aceptar',
          'common.cancel': 'Cancelar',
          'login.signIn': 'Iniciar sesión',
          'login.username': 'Usuario',
          'login.password': 'Contraseña',
          'drawer.visits': 'Visitas',
          'drawer.about': 'Acerca de',
          'drawer.signOut': 'Cerrar Sesión',
          'drawer.visit': 'Visita',
          'about.developedBy': 'Desarrollado por:',
          'visit.detail': 'Detalle',
          'visit.map': 'Mapa',
          'visit.photos': 'Fotos',
          'visit.signature': 'Firma',
          'visit.camera': 'Cámara',
          'visit.finish': 'Finalizar',
        },
        'en': {
          'common.ok': 'Ok',
          'common.cancel': 'Cancel',
          'login.signIn': 'Sign in',
          'login.username': 'Username',
          'login.password': 'Password',
          'drawer.about': 'About',
          'drawer.signOut': 'Sign out',
          'drawer.visit': 'Visit',
          'about.developedBy': 'Developed by:',
          'visit.detail': 'Detail',
          'visit.map': 'Map',
          'visit.photos': 'Photos',
          'visit.signature': 'Signature',
          'visit.camera': 'Camera',
          'visit.finish': 'Finish',
        }
      };
}
