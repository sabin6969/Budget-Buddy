import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:budgetbuddy/models/user.dart';
import 'package:budgetbuddy/utils/dialog.dart';
import 'package:budgetbuddy/utils/toast_message.dart';
import 'package:budgetbuddy/utils/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SignUpViewModel with ChangeNotifier, Validation {
  late UserModel user;
  Future<void> signUp(
      {required GlobalKey<FormState> globalKey,
      required isChecked,
      required String email,
      required String password,
      required String displayName,
      required BuildContext context}) async {
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
        user = UserModel(
          memberSince: DateTime.now().toString(),
          displayName: displayName,
          uid: value.user!.uid,
          description: "Hey i am using Budget Buddy",
          // displayName:
        );
        FirebaseServies.createUserDocument(user).then((value) {
          Navigator.of(context).pop();
          showToastMessage(message: "Account created.Login to your account");
        }).onError((error, stackTrace) {
          Navigator.of(context).pop();
          showToastMessage(message: error.toString());
        });
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
