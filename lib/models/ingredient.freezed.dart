// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'ingredient.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
class _$IngredientTearOff {
  const _$IngredientTearOff();

  _Ingredient call(
      {String? id,
      required int amount,
      required Unit unit,
      required String name,
      required DateTime createdAt,
      bool isChosen = false,
      int timesChosen = 0}) {
    return _Ingredient(
      id: id,
      amount: amount,
      unit: unit,
      name: name,
      createdAt: createdAt,
      isChosen: isChosen,
      timesChosen: timesChosen,
    );
  }

  Ingredient fromJson(Map<String, Object> json) {
    return Ingredient.fromJson(json);
  }
}

/// @nodoc
const $Ingredient = _$IngredientTearOff();

/// @nodoc
mixin _$Ingredient {
  String? get id => throw _privateConstructorUsedError;
  int get amount => throw _privateConstructorUsedError;
  Unit get unit => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  bool get isChosen => throw _privateConstructorUsedError;
  int get timesChosen => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      int amount,
      Unit unit,
      String name,
      DateTime createdAt,
      bool isChosen,
      int timesChosen});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res> implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  final Ingredient _value;
  // ignore: unused_field
  final $Res Function(Ingredient) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? isChosen = freezed,
    Object? timesChosen = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isChosen: isChosen == freezed
          ? _value.isChosen
          : isChosen // ignore: cast_nullable_to_non_nullable
              as bool,
      timesChosen: timesChosen == freezed
          ? _value.timesChosen
          : timesChosen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$IngredientCopyWith<$Res> implements $IngredientCopyWith<$Res> {
  factory _$IngredientCopyWith(
          _Ingredient value, $Res Function(_Ingredient) then) =
      __$IngredientCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      int amount,
      Unit unit,
      String name,
      DateTime createdAt,
      bool isChosen,
      int timesChosen});
}

/// @nodoc
class __$IngredientCopyWithImpl<$Res> extends _$IngredientCopyWithImpl<$Res>
    implements _$IngredientCopyWith<$Res> {
  __$IngredientCopyWithImpl(
      _Ingredient _value, $Res Function(_Ingredient) _then)
      : super(_value, (v) => _then(v as _Ingredient));

  @override
  _Ingredient get _value => super._value as _Ingredient;

  @override
  $Res call({
    Object? id = freezed,
    Object? amount = freezed,
    Object? unit = freezed,
    Object? name = freezed,
    Object? createdAt = freezed,
    Object? isChosen = freezed,
    Object? timesChosen = freezed,
  }) {
    return _then(_Ingredient(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as int,
      unit: unit == freezed
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as Unit,
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isChosen: isChosen == freezed
          ? _value.isChosen
          : isChosen // ignore: cast_nullable_to_non_nullable
              as bool,
      timesChosen: timesChosen == freezed
          ? _value.timesChosen
          : timesChosen // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ingredient implements _Ingredient {
  _$_Ingredient(
      {this.id,
      required this.amount,
      required this.unit,
      required this.name,
      required this.createdAt,
      this.isChosen = false,
      this.timesChosen = 0});

  factory _$_Ingredient.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientFromJson(json);

  @override
  final String? id;
  @override
  final int amount;
  @override
  final Unit unit;
  @override
  final String name;
  @override
  final DateTime createdAt;
  @JsonKey(defaultValue: false)
  @override
  final bool isChosen;
  @JsonKey(defaultValue: 0)
  @override
  final int timesChosen;

  @override
  String toString() {
    return 'Ingredient(id: $id, amount: $amount, unit: $unit, name: $name, createdAt: $createdAt, isChosen: $isChosen, timesChosen: $timesChosen)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Ingredient &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)) &&
            (identical(other.unit, unit) ||
                const DeepCollectionEquality().equals(other.unit, unit)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.isChosen, isChosen) ||
                const DeepCollectionEquality()
                    .equals(other.isChosen, isChosen)) &&
            (identical(other.timesChosen, timesChosen) ||
                const DeepCollectionEquality()
                    .equals(other.timesChosen, timesChosen)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(amount) ^
      const DeepCollectionEquality().hash(unit) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(isChosen) ^
      const DeepCollectionEquality().hash(timesChosen);

  @JsonKey(ignore: true)
  @override
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      __$IngredientCopyWithImpl<_Ingredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientToJson(this);
  }
}

abstract class _Ingredient implements Ingredient {
  factory _Ingredient(
      {String? id,
      required int amount,
      required Unit unit,
      required String name,
      required DateTime createdAt,
      bool isChosen,
      int timesChosen}) = _$_Ingredient;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$_Ingredient.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  int get amount => throw _privateConstructorUsedError;
  @override
  Unit get unit => throw _privateConstructorUsedError;
  @override
  String get name => throw _privateConstructorUsedError;
  @override
  DateTime get createdAt => throw _privateConstructorUsedError;
  @override
  bool get isChosen => throw _privateConstructorUsedError;
  @override
  int get timesChosen => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$IngredientCopyWith<_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}
