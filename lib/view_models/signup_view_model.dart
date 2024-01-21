import 'package:budgetbuddy/utils/validations.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel with ChangeNotifier, Validation {
  Future<void> signUp(GlobalKey<FormState> globalKey, bool isChecked) async {
    if (globalKey.currentState!.validate()) {
      if (!isChecked) {
        // TODO implmenent agree to the terms  of service
      }
    }
  }
}
