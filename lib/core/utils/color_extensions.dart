import 'dart:ui';

extension ColorHex on Color {
  /// Returns the hex code in #RRGGBB format.
  String get toHex {
    return '#${(r * 255).toInt().toRadixString(16).padLeft(2, '0')}${(g * 255).toInt().toRadixString(16).padLeft(2, '0')}${(b * 255).toInt().toRadixString(16).padLeft(2, '0')}'
        .toUpperCase();
  }
}
