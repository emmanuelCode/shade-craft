import '../../../core/data/palette_export_format.dart';

sealed class ColorPaletteViewEvent {}


class PickImage extends ColorPaletteViewEvent {}

class Export extends ColorPaletteViewEvent {
  final PaletteExportFormat format;
  Export({required this.format});
}


