// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'color_palette_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ColorPaletteEntity {

 String get name; List<String> get colors; String get description;
/// Create a copy of ColorPaletteEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ColorPaletteEntityCopyWith<ColorPaletteEntity> get copyWith => _$ColorPaletteEntityCopyWithImpl<ColorPaletteEntity>(this as ColorPaletteEntity, _$identity);

  /// Serializes this ColorPaletteEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ColorPaletteEntity&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.colors, colors)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(colors),description);

@override
String toString() {
  return 'ColorPaletteEntity(name: $name, colors: $colors, description: $description)';
}


}

/// @nodoc
abstract mixin class $ColorPaletteEntityCopyWith<$Res>  {
  factory $ColorPaletteEntityCopyWith(ColorPaletteEntity value, $Res Function(ColorPaletteEntity) _then) = _$ColorPaletteEntityCopyWithImpl;
@useResult
$Res call({
 String name, List<String> colors, String description
});




}
/// @nodoc
class _$ColorPaletteEntityCopyWithImpl<$Res>
    implements $ColorPaletteEntityCopyWith<$Res> {
  _$ColorPaletteEntityCopyWithImpl(this._self, this._then);

  final ColorPaletteEntity _self;
  final $Res Function(ColorPaletteEntity) _then;

/// Create a copy of ColorPaletteEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? colors = null,Object? description = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colors: null == colors ? _self.colors : colors // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ColorPaletteEntity].
extension ColorPaletteEntityPatterns on ColorPaletteEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ColorPaletteEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ColorPaletteEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ColorPaletteEntity value)  $default,){
final _that = this;
switch (_that) {
case _ColorPaletteEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ColorPaletteEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ColorPaletteEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  List<String> colors,  String description)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ColorPaletteEntity() when $default != null:
return $default(_that.name,_that.colors,_that.description);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  List<String> colors,  String description)  $default,) {final _that = this;
switch (_that) {
case _ColorPaletteEntity():
return $default(_that.name,_that.colors,_that.description);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  List<String> colors,  String description)?  $default,) {final _that = this;
switch (_that) {
case _ColorPaletteEntity() when $default != null:
return $default(_that.name,_that.colors,_that.description);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ColorPaletteEntity implements ColorPaletteEntity {
   _ColorPaletteEntity({required this.name, required final  List<String> colors, required this.description}): _colors = colors;
  factory _ColorPaletteEntity.fromJson(Map<String, dynamic> json) => _$ColorPaletteEntityFromJson(json);

@override final  String name;
 final  List<String> _colors;
@override List<String> get colors {
  if (_colors is EqualUnmodifiableListView) return _colors;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_colors);
}

@override final  String description;

/// Create a copy of ColorPaletteEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ColorPaletteEntityCopyWith<_ColorPaletteEntity> get copyWith => __$ColorPaletteEntityCopyWithImpl<_ColorPaletteEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ColorPaletteEntityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ColorPaletteEntity&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._colors, _colors)&&(identical(other.description, description) || other.description == description));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,name,const DeepCollectionEquality().hash(_colors),description);

@override
String toString() {
  return 'ColorPaletteEntity(name: $name, colors: $colors, description: $description)';
}


}

/// @nodoc
abstract mixin class _$ColorPaletteEntityCopyWith<$Res> implements $ColorPaletteEntityCopyWith<$Res> {
  factory _$ColorPaletteEntityCopyWith(_ColorPaletteEntity value, $Res Function(_ColorPaletteEntity) _then) = __$ColorPaletteEntityCopyWithImpl;
@override @useResult
$Res call({
 String name, List<String> colors, String description
});




}
/// @nodoc
class __$ColorPaletteEntityCopyWithImpl<$Res>
    implements _$ColorPaletteEntityCopyWith<$Res> {
  __$ColorPaletteEntityCopyWithImpl(this._self, this._then);

  final _ColorPaletteEntity _self;
  final $Res Function(_ColorPaletteEntity) _then;

/// Create a copy of ColorPaletteEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? colors = null,Object? description = null,}) {
  return _then(_ColorPaletteEntity(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colors: null == colors ? _self._colors : colors // ignore: cast_nullable_to_non_nullable
as List<String>,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
