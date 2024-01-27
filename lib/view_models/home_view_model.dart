import 'package:budgetbuddy/constants/firebase_services.dart';
import 'package:flutter/foundation.dart';

class HomeViewModel with ChangeNotifier {
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void changeLoadingStatus() {
    _isLoading = false;
    notifyListeners();
  }

  Future<void> getSelfData() async {
    await FirebaseServies.getSelfDetails();
    changeLoadingStatus();
  }
}
