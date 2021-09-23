// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ingredient.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ingredient _$$_IngredientFromJson(Map<String, dynamic> json) =>
    _$_Ingredient(
      id: json['id'] as String?,
      amount: json['amount'] as int,
      unit: _$enumDecode(_$UnitEnumMap, json['unit']),
      name: json['name'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      isChosen: json['isChosen'] as bool? ?? false,
      timesChosen: json['timesChosen'] as int? ?? 0,
    );

Map<String, dynamic> _$$_IngredientToJson(_$_Ingredient instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'unit': _$UnitEnumMap[instance.unit],
      'name': instance.name,
      'createdAt': instance.createdAt.toIso8601String(),
      'isChosen': instance.isChosen,
      'timesChosen': instance.timesChosen,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$UnitEnumMap = {
  Unit.g: 'g',
  Unit.ml: 'ml',
  Unit.piece: 'piece',
  Unit.can: 'can',
  Unit.glass: 'glass',
};
