import 'dart:convert';

import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:gemini_nano_android/gemini_nano_android.dart';
import 'package:shade_craft/feature/generate_color/model/color_palette_entity.dart';

/// An abstract interface for AI operations.
/// Use this to switch between Firebase AI (Cloud) and Gemini Nano (On-device).
abstract class AiRepository {
  Future<ColorPaletteEntity> getColorPalette(Uint8List imageBytes);

  Future<List<String>> geminiNano();

  Future<GenerateContentResponse> firebaseAI();
}

class GeminiRepository implements AiRepository {
  late Uint8List imageBytes;
  late String instructions;

  @override
  Future<ColorPaletteEntity> getColorPalette(Uint8List imageBytes) async {
    this.imageBytes = imageBytes;
    instructions = await rootBundle.loadString('assets/INSTRUCTIONS.md');

    try {
      final response = await geminiNano();
      debugPrint('GEMINI NANO RESPONSE: $response');

      // always the first in array for gemini nano
      final result = jsonDecode(response.first) as Map<String, dynamic>;
      final colors = List<String>.from(result['colors'] as Iterable);

      return ColorPaletteEntity(
        name: result['name'],
        description: result['description'],
        colors: colors.map((color) => hexToColor(color)).toList(),
      );
    } catch (e) {
      final response = await firebaseAI();

      debugPrint('GEMINI FIREBASE RESPONSE: $response');
      final result = jsonDecode(response.text!) as Map<String, dynamic>;
      debugPrint('GEMINI FIREBASE RESPONSE: $result');
      final colors = List<String>.from(result['colors'] as Iterable);

      return ColorPaletteEntity(
        name: result['name'],
        description: result['description'],
        colors: colors.map((color) => hexToColor(color)).toList(),
      );
    }
  }

  @override
  Future<List<String>> geminiNano() async {
    final GeminiNanoAndroid geminiNanoAndroid = GeminiNanoAndroid();
    final bool isAvailable = await geminiNanoAndroid.isAvailable();

    if (!isAvailable) {
      //throw Exception('Gemini Nano is not available');

      debugPrint('Gemini Nano is not available');
    }
    //instruction
    // final respondToPromptMsg =
    //     'Given the above instructions, respond to the following: $prompt';
    return geminiNanoAndroid.generate(
      prompt: instructions, //'$instructions\n\n $respondToPromptMsg',
      image: imageBytes,
    );
  }

  @override
  Future<GenerateContentResponse> firebaseAI() async {
    return FirebaseAI.googleAI()
        .generativeModel(
          model: 'gemini-3.1-flash-lite',
          systemInstruction: Content.system(instructions),
          generationConfig: GenerationConfig(
            responseMimeType: 'application/json',
          ),
        )
        .generateContent([
          Content.multi([
            // TextPart(prompt),
            InlineDataPart('image/png', imageBytes),
          ]),
        ]);
  }
}

//hexToColor
// Converts a hex string like "#2E7DFF" → Color(0xff2e7dff)
String hexToColor(String hex) {
  final cleaned = hex.replaceFirst('#', '');
  return '${int.parse('ff$cleaned', radix: 16)}';
}
