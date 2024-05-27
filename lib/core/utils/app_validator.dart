class AppValidator {
  static String? phoneValidate(String? value) {
    if ((value ?? '').isEmpty) {
      return 'invalied number';
    } else if (value!.length < 9) {
      return 'please enter the correct phone';
    }
    return null;
  }

  static String? emailValidate(String? value) {
    if ((value ?? '').isEmpty) {
      return 'invalied email';
    } else if (value!.length < 9) {
      return 'please enter a correct email';
    }
    return null;
  }

  static String? passwordValidate(String? value) {
    if ((value ?? '').isEmpty) {
      return 'invalied passWord';
    } else if (value!.length < 9) {
      return 'please enter a correct passWord';
    }
    return null;
  }

  static String? nameValidate(String? value) {
    if ((value ?? '').isEmpty) {
      return 'envailed name';
    } else if (value!.length < 2) {
      return 'please enter a correct name';
    }
    return null;
  }

  static String? coponValidate(String? value) {
    if ((value ?? '').isEmpty) {
      return 'invalied copon';
    }
    return null;
  }
}
