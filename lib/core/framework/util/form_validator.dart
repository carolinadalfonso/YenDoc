import '../localization/localization.dart';

class FormValidator {
  static final RegExp passwordRegExp = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");

  bool isEmpty(String? value) {
    return value == null || value.isEmpty;
  }

  String? validateField(String? value) {
    return isEmpty(value) ? Localization.xValidation.requiredField : null;
  }

  String? validateUser(String? user) {
    return isEmpty(user)
        ? Localization.xValidation.requiredField
        : user!.length < 8
            ? Localization.xValidation.userLenght
            : null;
  }

  String? validatePassword(String? password) {
    return isEmpty(password)
        ? Localization.xValidation.requiredField
        : !passwordRegExp.hasMatch(password!)
            ? Localization.xValidation.passwordRequisits
            : null;
  }

  String? validateRepeatPassword(String? newPassword, String? repeatNewPassword) {
    final String? isValidPassword = validatePassword(newPassword);

    if (isValidPassword != null) return isValidPassword;
    if (newPassword != repeatNewPassword) {
      return Localization.xValidation.passwordDontMatch;
    } else {
      return null;
    }
  }
}
