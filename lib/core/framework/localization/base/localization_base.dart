import 'package:yendoc/controllers/login_controller.dart';

abstract class LocalizationBase extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es': {
          'common.ok': 'Aceptar',
          'common.cancel': 'Cancelar',
          'login.signIn': 'Iniciar sesión',
          'login.username': 'Usuario',
          'login.password': 'Contraseña'
        },
        'en': {
          'common.ok': 'Ok',
          'common.cancel': 'Cancel',
          'login.signIn': 'Sign In',
          'login.username': 'Username',
          'login.password': 'Password',
        }
      };
}
