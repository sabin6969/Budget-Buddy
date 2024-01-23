import 'package:flutter/material.dart';

class AddExpenseViewModel with ChangeNotifier {
  int _enteredAmount = 0;

  int get getEnteredAmount => _enteredAmount;

  void changeAmount(int amount) {
    _enteredAmount = amount;
    notifyListeners();
  }
}
