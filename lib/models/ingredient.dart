import 'package:flutter/material.dart';
import 'package:groceries_app/models/unit.dart';

class Ingredient {
  final String id;
  final int amount;
  final Unit unit;
  final String name;
  final DateTime createdAt;
  bool isChosen;
  int timesChosen;

  Ingredient({
    this.id,
    @required this.amount,
    @required this.unit,
    @required this.name,
    @required this.createdAt,
    this.isChosen = false,
    this.timesChosen = 0,
  });

  Ingredient copyWith({
    final String id,
    final int amount,
    final Unit unit,
    final String name,
    final DateTime createdAt,
    bool isChosen,
    int timesChosen,
  }) {
    return Ingredient(
        id: id ?? this.id,
        amount: amount ?? this.amount,
        unit: unit ?? this.unit,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        isChosen: isChosen ?? this.isChosen,
        timesChosen: timesChosen ?? this.timesChosen);
  }

  static Ingredient fromJson(
    Map<String, dynamic> data,
    String id,
  ) {
    return Ingredient(
      id: id,
      amount: data['amount'],
      unit: data['unit'],
      name: data['name'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        data['createdAt'],
      ),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'amount': this.amount,
      'unit': this.unit,
      'name': this.name,
      'createdAt': this.createdAt.millisecondsSinceEpoch,
    };
  }
}
