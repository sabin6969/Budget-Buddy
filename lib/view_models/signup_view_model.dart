import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:budgetbuddy/utils/dialog.dart';
import 'package:budgetbuddy/utils/toast_message.dart';
import 'package:budgetbuddy/utils/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel with ChangeNotifier, Validation {
  Future<void> signUp({
    required GlobalKey<FormState> globalKey,
    required isChecked,
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    if (globalKey.currentState!.validate()) {
      if (!isChecked) {
        showToastMessage(message: "Please agree to terms and conditions");
        return;
      }
      showLoadingDialog(context);
      FirebaseServies.firebaseAuth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        Navigator.of(context).pop();
        showToastMessage(message: "Account created.Login to your account");
        Navigator.of(context).pop();
      }).onError(
        (error, stackTrace) {
          Navigator.pop(context);
          if (error is FirebaseAuthException) {
            showToastMessage(message: error.message!);
            return;
          }
          showToastMessage(message: error.toString());
        },
      );
    }
  }
}
