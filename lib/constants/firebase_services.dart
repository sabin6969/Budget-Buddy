import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:budgetbuddy/models/user.dart';

class FirebaseServies {
  static final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  static final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static late UserModel me;

  // method to create user related document in cloud firestore
  static Future<void> createUserDocument(UserModel user) async {
    firebaseFirestore.collection("users").doc(user.uid).set(
          user.toJson(),
        );
  }

  static Future<void> getSelfDetails() async {
    DocumentSnapshot<Map<String, dynamic>> snapshot = await firebaseFirestore
        .collection("users")
        .doc(firebaseAuth.currentUser!.uid)
        .get();
    me = UserModel.fromJson(snapshot.data()!);
  }
}
