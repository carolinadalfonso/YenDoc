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
          'about.developedBy': 'Desarrollado por:',
        },
        'en': {
          'common.ok': 'Ok',
          'common.cancel': 'Cancel',
          'login.signIn': 'Sign in',
          'login.username': 'Username',
          'login.password': 'Password',
          'drawer.about': 'About',
          'drawer.signOut': 'Sign out',
          'about.developedBy': 'Developed by:',
        }
      };
}
