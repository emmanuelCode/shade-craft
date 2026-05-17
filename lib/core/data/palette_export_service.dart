import 'dart:io';
import 'dart:typed_data';
import 'dart:ui';

import 'package:color_palette_formats/color_palette_formats.dart';
import 'package:file_picker/file_picker.dart';
import 'package:shade_craft/core/data/palette_export_format.dart';
import 'package:shade_craft/core/utils/color_extensions.dart';

abstract class ColorPaletteService {
  Future<void> createFile(PaletteExportFormat format, List<Color> colors);
}

class ColorPaletteExport implements ColorPaletteService {
  @override
  Future<void> createFile(
    PaletteExportFormat format,
    List<Color> colors,
  ) async {
    switch (format) {
      case PaletteExportFormat.ase:
        // ─────────────────────────────────────────────
        // 1. ASE — Adobe Swatch Exchange
        //    Used by: Illustrator, Photoshop, InDesign
        //    Values: normalized 0.0–1.0
        // ─────────────────────────────────────────────
        final ase = AdobeSwatchExchange(
          colors: colors
              .map(
                (c) => AdobeSwatchExchangeColor(
                  name: c.toHex,
                  model: AdobeSwatchExchangeColorModel.rgb,
                  values: [c.red / 255, c.green / 255, c.blue / 255],
                ),
              )
              .toList(),
        );

        await saveMyFile(format, ase.toBytes());
        break;
      case PaletteExportFormat.aco:
        // ─────────────────────────────────────────────
        // 2. ACO — Adobe Color Swatch
        //    Used by: Photoshop
        //    Values: 0–65535 (multiply by 257)
        // ─────────────────────────────────────────────
        final aco = AdobeColorSwatch(
          colors: colors
              .map(
                (c) => AdobeColorSwatchColor(
                  // model: AdobeColorSwatchColorModel.rgb,
                  colorSpace: AdobeColorSwatchColorSpace.rgb,
                  values: [c.red * 257, c.green * 257, c.blue * 257],
                ),
              )
              .toList(),
        );
        await saveMyFile(format, aco.toBytes());

        break;
      case PaletteExportFormat.act:

        // ─────────────────────────────────────────────
        // 3. ACT — Adobe Color Table
        //    Used by: Photoshop (indexed color mode)
        //    Values: 0–255 RGB
        //    Note: max 256 colors
        // ─────────────────────────────────────────────
        final act = AdobeColorTable(
          colors: colors
              .map(
                (c) => AdobeColorTableColor(
                  red: c.red,
                  green: c.green,
                  blue: c.blue,
                ),
              )
              .toList(),
        );

        await saveMyFile(format, act.toBytes());

        break;
      case PaletteExportFormat.gpl:
        // ─────────────────────────────────────────────
        // 4. GPL — GIMP Palette
        //    Used by: GIMP, Inkscape, Blender (native)
        //    Values: 0–255 RGB
        // ─────────────────────────────────────────────
        final gpl = GimpPalette(
          colors: colors
              .map(
                (c) => GimpPaletteColor(
                  red: c.red,
                  green: c.green,
                  blue: c.blue,
                  name: c.toHex,
                ),
              )
              .toList(),
        );
        await saveMyFile(format, gpl.toBytes());

        break;
      case PaletteExportFormat.sketchpalette:
        // ─────────────────────────────────────────────
        // 5. Sketch Palette — .sketchpalette
        //    Used by: Sketch app
        //    Values: normalized 0.0–1.0
        // ─────────────────────────────────────────────
        final sketch = SketchPalette(
          compatibleVersion: SketchPalette.validVersion,
          pluginVersion: SketchPalette.validVersion,
          colors: colors
              .map(
                (c) => SketchPaletteColor(
                  red: c.red / 255,
                  green: c.green / 255,
                  blue: c.blue / 255,
                  alpha: 1.0,
                ),
              )
              .toList(),
        );

        await saveMyFile(format, sketch.toBytes());
        break;
      case PaletteExportFormat.soc:
        // ─────────────────────────────────────────────
        // 6. SOC — StarOffice / LibreOffice Colors
        //    Used by: LibreOffice, OpenOffice
        //    Values: hex string e.g. '#FF5733'
        // ─────────────────────────────────────────────
        final soc = StarOfficeColorTable(
          colors: colors
              .map(
                (c) => StarOfficeColor(
                  name:
                      '#${c.value.toRadixString(16).substring(2).toUpperCase()}',
                  color:
                      '#${c.value.toRadixString(16).substring(2).toUpperCase()}',
                ),
              )
              .toList(),
        );
        await saveMyFile(format, soc.toBytes());
        break;
      case PaletteExportFormat.xml:
        // ─────────────────────────────────────────────
        // 7. XML — Scribus Swatch
        //    Used by: Scribus (desktop publishing)
        //    Values: normalized 0.0–1.0
        // ─────────────────────────────────────────────
        final scribus = ScribusPalette(
          name: 'My Palette',
          colors: colors
              .map(
                (c) => ScribusColor(
                  name:
                      '#${c.value.toRadixString(16).substring(2).toUpperCase()}',
                  rgb:
                      '#${c.value.toRadixString(16).substring(2).toUpperCase()}',
                  spot: ScribusColor.defaultSpot,
                  register: ScribusColor.defaultRegister,
                ),
              )
              .toList(),
        );
        await saveMyFile(format, scribus.toBytes());
        break;
    }
  }
}

Future<void> saveMyFile(PaletteExportFormat format, List<int> bytesData) async {
  // Triggers the native platform's "Save As" window
  // The bytes parameter handles file writing automatically on all platforms
  String? outputFile = await FilePicker.saveFile(
    dialogTitle: 'Please select an output file:',
    fileName: 'palette.${format.extension}',
    type: FileType.custom,
    allowedExtensions: [format.extension],
    bytes: Uint8List.fromList(bytesData),
  );

  if (outputFile != null) {
    // On Android/iOS: bytes are already written by the plugin
    // On desktop: may need additional handling
    print('✓ Palette exported successfully: $outputFile (${bytesData.length} bytes)');
  } else {
    // User canceled the native dialog
    print('Export canceled');
  }
}
