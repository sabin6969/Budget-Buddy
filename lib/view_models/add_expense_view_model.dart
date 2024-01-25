import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddExpenseViewModel with ChangeNotifier {
  num _enteredAmount = 0;
  String _formatedDate = DateFormat("d-MMMM-yyyy").format(DateTime.now());

  String get getFormatedDate => _formatedDate;
  num get getEnteredAmount => _enteredAmount;

  void changeAmount(num amount) {
    _enteredAmount = amount;
    notifyListeners();
  }

  void pickDate(BuildContext context) async {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(
        DateTime.now().year,
        DateTime.now().month,
      ),
      lastDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
    ).then((selectedDate) {
      _formatedDate = DateFormat("d-MMMM-yyyy").format(selectedDate!);
      notifyListeners();
    }).onError((error, stackTrace) {
      _formatedDate = DateFormat("d-MMMM-yyyy").format(DateTime.now());
    });
  }
}
