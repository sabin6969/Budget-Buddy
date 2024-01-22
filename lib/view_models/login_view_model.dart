import 'package:budgetbuddy/utils/dialog.dart';
import 'package:budgetbuddy/utils/toast_message.dart';
import 'package:budgetbuddy/utils/validations.dart';
import 'package:flutter/cupertino.dart';
import 'package:budgetbuddy/constants/firebase_services.dart';

class LoginViewModel with ChangeNotifier, Validation {
  Future<void> login({
    required GlobalKey<FormState> globalKey,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (globalKey.currentState!.validate()) {
      showLoadingDialog(context);
      FirebaseServies.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .timeout(const Duration(seconds: 7))
          .then((value) {
        // hiding progress dialog
        Navigator.of(context).pop();
        showToastMessage(message: "Login Sucess");
      }).onError((error, stackTrace) {
        // hiding progress dialog
        Navigator.of(context).pop();
        showToastMessage(message: error.toString());
      });
    }
  }
}
