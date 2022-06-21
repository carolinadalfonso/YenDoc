import 'package:yendoc/controllers/login_controller.dart';

abstract class LocalizationBase extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es': {
          'common.yes': 'Sí',
          'common.no': 'No',
          'common.ok': 'Aceptar',
          'common.cancel': 'Cancelar',
          'common.yearsOld': 'años',
          'login.signIn': 'Iniciar sesión',
          'login.username': 'Usuario',
          'login.password': 'Contraseña',
          'drawer.visits': 'Visitas',
          'drawer.about': 'Acerca de',
          'drawer.signOut': 'Cerrar Sesión',
          'drawer.visit': 'Visita',
          'drawer.questionSignOut': '¿Está seguro que desea cerrar sesión?',
          'about.developedBy': 'Desarrollado por:',
          'visit.detail': 'Detalle',
          'visit.map': 'Mapa',
          'visit.photos': 'Fotos',
          'visit.signature': 'Firma',
          'visit.camera': 'Cámara',
          'visit.finish': 'Finalizar',
          'visit.patient': 'Paciente:',
          'visit.address': 'Dirección:',
          'visit.age': 'Edad:',
          'visit.symptoms': 'Síntomas:',
          'visit.posibleCovid': 'Posible caso de COVID:',
          'visit.diagnostic': 'Diagnóstico:',
          'gallery.photo': 'Foto',
          'gallery.noPhotos': 'No hay fotos para esta visita',
          'gallery.deletedPhoto': 'Se ha eliminado la foto',
          'gallery.deletedPhotoError': 'Error al eliminar la foto',
          'gallery.questionDeletePhoto': '¿Está seguro que desea eliminar esta foto?',
          'gallery.deletePhoto': 'Borrar foto',
          'finish.visit': 'Finalizar Visita',
          'finish.ok': 'Correctamente',
          'finish.notOk': 'No Realizada',
          'finish.question': '¿Cómo desea finalizar la visita?',
          'signature.clean': 'Limpiar firma',
        },
        'en': {
          'common.yes': 'Yes',
          'common.no': 'No',
          'common.ok': 'Ok',
          'common.cancel': 'Cancel',
          'common.yearsOld': 'years old',
          'login.signIn': 'Sign in',
          'login.username': 'Username',
          'login.password': 'Password',
          'drawer.about': 'About',
          'drawer.signOut': 'Sign out',
          'drawer.visit': 'Visit',
          'drawer.questionSignOut': 'Are you sure you want to log out?',
          'about.developedBy': 'Developed by:',
          'visit.detail': 'Detail',
          'visit.map': 'Map',
          'visit.photos': 'Photos',
          'visit.signature': 'Signature',
          'visit.camera': 'Camera',
          'visit.finish': 'Finish',
          'visit.patient': 'Patient:',
          'visit.address': 'Address:',
          'visit.age': 'Age:',
          'visit.symptoms': 'Symptoms:',
          'visit.posibleCovid': 'Posible COVID case:',
          'visit.diagnostic': 'Diagnostic:',
          'gallery.photo': 'Photo',
          'gallery.noPhotos': 'There are no photos for this visit',
          'gallery.deletedPhoto': 'Photo has been deleted',
          'gallery.deletedPhotoError': 'Error deleting photo',
          'gallery.questionDeletePhoto': 'Are you sure you want to delete this photo?',
          'gallery.deletePhoto': 'Delete photo',
          'finish.visit': 'Finish Visit',
          'finish.ok': 'Correctly',
          'finish.notOk': 'Unrealized',
          'finish.question': 'How do you want to end the visit?',
          'signature.clean': 'Clean signature',
        }
      };
}
