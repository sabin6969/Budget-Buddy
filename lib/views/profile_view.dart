import 'package:budgetbuddy/models/user.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  final UserModel? me;
  const ProfileView({
    super.key,
    this.me,
  });

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile View"),
      ),
    );
  }
}
