import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FirebaseSetupProvider with ChangeNotifier {
  bool isLoading;

  Future<void> initializeFirebase() async {
    isLoading = true;
    notifyListeners();
    await Firebase.initializeApp();
    isLoading = false;
    notifyListeners();
  }
}
