import 'dart:async';

import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/utils/dialog.dart';
import 'package:budgetbuddy/utils/toast_message.dart';
import 'package:budgetbuddy/utils/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
      try {
        showLoadingDialog(context);
        FirebaseServies.firebaseAuth
            .signInWithEmailAndPassword(email: email, password: password)
            .timeout(
          const Duration(seconds: 7),
          onTimeout: () {
            throw TimeoutException("Please check your internet connection");
          },
        ).then((value) {
          // hiding progress dialog
          Navigator.of(context).pop();
          Navigator.pushReplacementNamed(context, RouteNames.homeView);
        }).onError((error, stackTrace) {
          // hiding progress dialog
          Navigator.of(context).pop();
          if (error is FirebaseAuthException) {
            showToastMessage(message: error.message ?? "Error");
            return;
          }
          showToastMessage(message: error.toString());
        });
      } on TimeoutException {
        showToastMessage(
          message:
              "Server request timeout\nPlease check your internet connection",
        );
      } catch (e) {
        showToastMessage(
          message: e.toString(),
        );
      }
    }
  }
}
