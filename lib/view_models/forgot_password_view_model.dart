import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/utils/dialog.dart';
import 'package:budgetbuddy/utils/toast_message.dart';
import 'package:budgetbuddy/utils/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class ForgotPasswordViewModel with Validation, ChangeNotifier {
  Future<void> sendResetLink({
    required GlobalKey<FormState> globalKey,
    required String email,
    required BuildContext context,
  }) async {
    if (globalKey.currentState!.validate()) {
      showLoadingDialog(context);
      FirebaseServies.firebaseAuth.sendPasswordResetEmail(email: email).then(
        (value) {
          Navigator.pop(context);
          Navigator.pushReplacementNamed(
            context,
            RouteNames.forgotPasswordEmailSentView,
            arguments: email,
          );
        },
      ).onError(
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
