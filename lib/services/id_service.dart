import 'package:uuid/uuid.dart';

class IdService {
  Uuid instance = Uuid();

  String getId() {
    return instance.v4();
  }
}
