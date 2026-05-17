import 'dart:ui';

import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shade_craft/core/data/generative_ai_repository.dart';
import 'package:shade_craft/core/data/palette_export_service.dart';
import 'package:shade_craft/feature/generate_color/view/color_palette_view_event.dart';

import '../model/color_palette_entity.dart';

part 'color_palette_intent.g.dart';

@riverpod
class ColorPaletteIntentFactory extends _$ColorPaletteIntentFactory {
  late final GeminiRepository geminiRepository;
  late final picker = ImagePicker();
  late final colorPaletteExport = ColorPaletteExport();

  @override
  Future<ColorPaletteEntity> build() {
    geminiRepository = GeminiRepository();
    return Future.value(ColorPaletteEntity(
      name: '',
      colors: [
        '0xffffffff',
        '0xffffffff',
        '0xffffffff',
        '0xffffffff',
        '0xffffffff',
        '0xffffffff',
        '0xffffffff',
      ],
      description: '',
    ));
  }

  void toIntent(ColorPaletteViewEvent colorPaletteViewEvent) async {
    switch (colorPaletteViewEvent) {
      case PickImage():
        final XFile? image = await picker.pickImage(
          source: ImageSource.gallery,
        );
        final imageBytes = await image!.readAsBytes();

       state = await AsyncValue.guard(() => geminiRepository.getColorPalette(imageBytes));
       // state = await geminiRepository.getColorPalette(imageBytes);
      case Export(:final format):
      //view model shouldn't handle Color conversion in map //TODO
      await colorPaletteExport.createFile(format, state.value!.colors.map((colors) => Color(int.parse(colors))).toList());
    }
  }
}
