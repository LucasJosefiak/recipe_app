import 'package:groceries_app/models/model.dart';

abstract class Repository<Item extends Model> {
  // Item operations
  Item addItem(Item item);
  void setItem(Item item);
  Item getItem(String id);
  bool doesItemExist(String id);
  void updateItem(Item item);
  void deleteItem(Item item);

  // List operations
  Stream<List<Item>> getStreamOfItems();
  void closeStream();

  void deleteAll();
  void addAll(Iterable<Item> items);
}
