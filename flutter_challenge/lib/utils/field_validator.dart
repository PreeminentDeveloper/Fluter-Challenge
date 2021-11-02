class FieldValidator {
  ///check if email is empty and also if email is valid
  static String validateEmail(String value) {
    const String pattern =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    final RegExp regExp = RegExp(pattern);

    if (value.isEmpty) return "Email field cannot be empty";

    if (!regExp.hasMatch(value)) {
      return "Enter Valid Email!";
    }
    return null;
  }

  ///check if string is empty
  static String validateString(String value) {
    if (value.isEmpty) return 'Field cannot be empty';

    return null;
  }

  ///check if number is empty and contains non-numbers
  static String validateNumber(String value) {
    if (value.isEmpty) {
      return 'Field cannot be empty';
    } else if (num.tryParse(value) == null) return 'Field contains non-numbers';

    return null;
  }

  ///check is password is empty and contains the required number of characters
  static String validatePassword(String value) {
    if (value.isEmpty) return 'Password cannot be empty';

    if (value.length < 7) {
      return 'Password cannot be less than seven characters';
    }
    return null;
  }
}
