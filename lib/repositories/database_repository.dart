import 'dart:async';

import 'package:groceries_app/models/model.dart';
import 'package:groceries_app/repositories/repository.dart';
import 'package:hive/hive.dart';

class DatabaseRepository<Item extends Model> extends Repository<Item> {
  final String name;
  final StreamController<List<Item>> _streamController;
  Box<Item> get box => Hive.box<Item>(name);

  DatabaseRepository(this.name)
      : _streamController = StreamController<List<Item>>();

  void _emitChangesToStream() {
    _streamController.add(box.values.toList());
  }

  @override
  void addAll(Iterable<Item> items) {
    box.addAll(items);
    _emitChangesToStream();
  }

  @override
  Item addItem(Item item) {
    box.put(item.id, item);
    _emitChangesToStream();
    return item;
  }

  @override
  void closeStream() {
    _streamController.close();
  }

  @override
  void deleteAll() {
    box.clear();
    _emitChangesToStream();
  }

  @override
  void deleteItem(Item item) {
    box.delete(item.id);
    _emitChangesToStream();
  }

  @override
  bool doesItemExist(String id) {
    return box.containsKey(id);
  }

  @override
  Item getItem(String id) {
    return box.get(id)!;
  }

  @override
  Stream<List<Item>> getStreamOfItems() {
    _emitChangesToStream();
    return _streamController.stream;
  }

  @override
  void setItem(Item item) {
    box.put(item.id, item);
    _emitChangesToStream();
  }

  @override
  void updateItem(Item item) {
    box.put(item.id, item);
    _emitChangesToStream();
  }
}
