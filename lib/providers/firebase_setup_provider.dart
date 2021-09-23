import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';

class FirebaseSetupProvider with ChangeNotifier {
  LoadingState loadingState = LoadingState.uninitialized;

  Future<void> initializeFirebase() async {
    loadingState = LoadingState.loading;
    notifyListeners();
    await Firebase.initializeApp();
    loadingState = LoadingState.loaded;
    notifyListeners();
  }
}
