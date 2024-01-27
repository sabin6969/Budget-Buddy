import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:budgetbuddy/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileViewModel with ChangeNotifier {
  Future<void> signOut(BuildContext context) async {
    await FirebaseServies.firebaseAuth.signOut().then((value) async {
      await GoogleSignIn().signOut().then(
        (value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const LoginView()),
              (route) => false);
        },
      );
    });
  }
}
