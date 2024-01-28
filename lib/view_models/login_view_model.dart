import 'dart:async';

import 'package:budgetbuddy/constants/route_names.dart';
import 'package:budgetbuddy/constants/shared_prefs_helpers.dart';
import 'package:budgetbuddy/models/user.dart';
import 'package:budgetbuddy/utils/dialog.dart';
import 'package:budgetbuddy/utils/toast_message.dart';
import 'package:budgetbuddy/utils/validations.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginViewModel with ChangeNotifier, Validation {
  late UserModel user;
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
          SharedPrefsHelper.setEmail(email).then((value) {
            // hiding progress dialog
            Navigator.of(context).pop();
            Navigator.pushReplacementNamed(context, RouteNames.homeView);
          });
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

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      showLoadingDialog(context);
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn()
          .signIn()
          .timeout(const Duration(seconds: 10), onTimeout: () {
        Navigator.pop(context);
        throw TimeoutException("Server request timeout");
      });

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      FirebaseAuth.instance
          .signInWithCredential(credential)
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException("Server request timeout");
      }).then((userCredential) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          SharedPrefsHelper.setEmail(
            FirebaseServies.firebaseAuth.currentUser!.email!,
          ).then((value) {
            user = UserModel(
              displayName:
                  FirebaseServies.firebaseAuth.currentUser!.displayName,
              description: "Hey there i am using Budget Buddy",
              memberSince: DateTime.now().toString().substring(0, 10),
              profileImageUrl:
                  FirebaseServies.firebaseAuth.currentUser!.photoURL,
              uid: FirebaseServies.firebaseAuth.currentUser!.uid,
            );
            Navigator.pop(context);
            FirebaseServies.createUserDocument(user);
          });
        }
        SharedPrefsHelper.setEmail(
                FirebaseServies.firebaseAuth.currentUser!.email!)
            .then((value) {
          Navigator.pushReplacementNamed(context, RouteNames.homeView);
        });
      }).onError((error, stackTrace) {
        Navigator.pop(context);
        if (error is FirebaseAuthException) {
          showToastMessage(message: error.message ?? "An error occured");
          return;
        }
        showToastMessage(message: error.toString());
      });
    } on TimeoutException {
      showToastMessage(message: "Server request timeout");
    } catch (e) {
      if (context.mounted) {
        Navigator.pop(context);
      }
      showToastMessage(message: "Sign up with google terminated");
    }
  }
}
