import 'package:budgetbuddy/utils/validations.dart';
import 'package:flutter/cupertino.dart';

class LoginViewModel with ChangeNotifier, Validation {
  Future<void> login(GlobalKey<FormState> globalKey) async {
    if (globalKey.currentState!.validate()) {}
  }
}
