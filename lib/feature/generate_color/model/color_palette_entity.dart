import 'package:freezed_annotation/freezed_annotation.dart';

part 'color_palette_entity.freezed.dart';

part 'color_palette_entity.g.dart';

@freezed
abstract class ColorPaletteEntity with _$ColorPaletteEntity {

  factory ColorPaletteEntity({
    required String name,
    required List<String> colors,
    required String description,
  }) = _ColorPaletteEntity;


  factory ColorPaletteEntity.fromJson(Map<String, dynamic> json) => _$ColorPaletteEntityFromJson(json);
}


 