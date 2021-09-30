import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';

class FirebaseSetupProvider with ChangeNotifier {
  //with indicates a mixin. ChangeNotifier is now a subclass of FirebaseSetupProvider
  //ChangeNotifier allows other parts of the app to listen to the FirebaseSetup Provider
  LoadingState loadingState = LoadingState.uninitialized;

  Future<void> initializeFirebase() async {
    loadingState = LoadingState.loading;
    notifyListeners();
    await Firebase.initializeApp();
    loadingState = LoadingState.loaded;
    notifyListeners();
  }
}
