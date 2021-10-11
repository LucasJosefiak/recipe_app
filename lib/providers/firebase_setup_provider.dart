import 'package:flutter/material.dart';
import 'package:groceries_app/models/loading_state.dart';

// TODO rename
class FirebaseSetupProvider with ChangeNotifier {
  //with indicates a mixin. ChangeNotifier is now a subclass of FirebaseSetupProvider
  //ChangeNotifier allows other parts of the app to listen to the FirebaseSetup Provider
  LoadingState loadingState = LoadingState.uninitialized;

  Future<void> initializeFirebase() async {
    loadingState = LoadingState.loading;
    notifyListeners();
    loadingState = LoadingState.loaded;
    notifyListeners();
  }
}
