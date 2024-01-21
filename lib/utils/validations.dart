mixin Validation {
  bool isEmailValid(String email) {
    RegExp emailRegExp = RegExp(
      r'^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$',
    );

    return emailRegExp.hasMatch(email);
  }

  bool isPasswordStrong(String password) {
    return password.length >= 6;
  }

  String? validateEmail(String email) {
    if (email.isEmpty) {
      return "This field is required";
    } else if (isEmailValid(email)) {
      return null;
    }
    return "Invalid email";
  }

  String? validatePassword(String password) {
    if (password.isEmpty) {
      return "This filed is required";
    } else if (isPasswordStrong(password)) {
      return null;
    }
    return "Weak password";
  }

  String? validateName(String name) {
    if (name.isEmpty) {
      return "This field is required";
    } else if (name.length < 3) {
      return "Too short name";
    }
    return null;
  }
}
