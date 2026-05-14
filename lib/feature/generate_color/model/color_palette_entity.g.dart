// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_palette_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ColorPaletteEntity _$ColorPaletteEntityFromJson(Map<String, dynamic> json) =>
    _ColorPaletteEntity(
      name: json['name'] as String,
      colors: (json['colors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      description: json['description'] as String,
    );

Map<String, dynamic> _$ColorPaletteEntityToJson(_ColorPaletteEntity instance) =>
    <String, dynamic>{
      'name': instance.name,
      'colors': instance.colors,
      'description': instance.description,
    };
