import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsViewModel with ChangeNotifier {
  void setMonthyBudgetDialog(
    BuildContext context,
    TextEditingController budgetController,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Set monthly budget"),
          content: TextFormField(
            controller: budgetController,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 14.w,
                ),
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              prefixIcon: Icon(
                Icons.currency_rupee,
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                FirebaseServies.setMonthlyBudget(
                  double.tryParse(budgetController.text) ?? 0,
                );
                Navigator.pop(context);
              },
              child: const Text("Add"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            )
          ],
        );
      },
    );
  }
}
