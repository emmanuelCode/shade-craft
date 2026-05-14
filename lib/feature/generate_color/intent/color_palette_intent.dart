import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shade_craft/core/data/generative_ai_repository.dart';
import 'package:shade_craft/feature/generate_color/view/color_palette_view_event.dart';

import '../model/color_palette_entity.dart';

part 'color_palette_intent.g.dart';

@riverpod
class ColorPaletteIntentFactory extends _$ColorPaletteIntentFactory {
  late final GeminiRepository geminiRepository;


@override
ColorPaletteEntity build() {
  geminiRepository = GeminiRepository();
  return ColorPaletteEntity(
    name: '',
    colors: ['#FFFFF'],
    description: '',
  );
}

void toIntent( ColorPaletteViewEvent colorPaletteViewEvent){
  switch (colorPaletteViewEvent) {

    case PickImage():

  }


}


}