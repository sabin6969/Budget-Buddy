import 'package:budgetbuddy/utils/validations.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordViewModel with Validation, ChangeNotifier {
  Future<void> sendResetLink(GlobalKey<FormState> globalKey) async {
    if (globalKey.currentState!.validate()) {}
  }
}
