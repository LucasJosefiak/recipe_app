import 'package:flutter/material.dart';
import 'package:groceries_app/models/ingredient.dart';

class Recipe {
  final String id;
  final String title;
  final DateTime createdAt;
  final List<Ingredient> ingredients;

  Recipe({
    this.id,
    @required this.createdAt,
    @required this.title,
    this.ingredients,
  });

  Recipe copyWith({
    final String id,
    final String title,
    final List<Ingredient> ingredients,
  }) {
    return Recipe(
      id: id ?? this.id,
      title: title ?? this.title,
      createdAt: createdAt ?? this.createdAt,
      ingredients: ingredients ?? this.ingredients,
    );
  }

  static Recipe fromJson(
    Map<String, dynamic> data,
    String id,
  ) {
    return Recipe(
      id: id,
      title: data['title'],
      createdAt: DateTime.fromMillisecondsSinceEpoch(
        data['createdAt'],
      ),
      ingredients: data['ingredients'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'title': this.title,
      'createdAt': this.createdAt.millisecondsSinceEpoch,
      'ingredients': this.ingredients,
      // 'igredients': this.ingredients,
    };
  }
}
