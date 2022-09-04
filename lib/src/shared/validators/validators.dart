//TODO: add all validations
class Validators {
  static String? validateEmail(String? value) {
    if (value != null && value.isEmpty) {
      return "Please type a valid email";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value != null && value.isEmpty) {
      return "Please type a valid password";
    }
    return null;
  }
}
