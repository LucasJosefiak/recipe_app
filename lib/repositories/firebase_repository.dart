import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groceries_app/repositories/repository.dart';

class FirebaseRepository extends Repository {
  var firebaseInstance = FirebaseFirestore.instance.collection('recipes');

  @override
  void addModel(Model model) {}

  @override
  void deleteModel(Model model) {
    // TODO: implement deleteModel
  }
}
