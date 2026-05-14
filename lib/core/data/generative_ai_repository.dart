
import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter/services.dart';
import 'package:gemini_nano_android/gemini_nano_android.dart';

/// An abstract interface for AI operations.
/// Use this to switch between Firebase AI (Cloud) and Gemini Nano (On-device).
abstract class AiRepository {
  Future<List<String>> getColorPalette(Uint8List imageBytes, String prompt);

  Future<List<String>> geminiNano(); 

  Future<GenerateContentResponse> firebaseAI();
}

class GeminiRepository implements AiRepository {
  late Uint8List imageBytes;
  late String prompt;
  late String instructions;

  @override
  Future<List<String>> getColorPalette(
    Uint8List imageBytes,
    String prompt,
  ) async {
    this.imageBytes = imageBytes;
    this.prompt = prompt;
    instructions = await rootBundle.loadString('assets/INSTRUCTIONS.md');

    try {
     final response = await geminiNano();
     return response;
      
    } catch (e) {
      final response = await firebaseAI();

      return [response.text!];

    } 
      
  }



  @override
  Future<List<String>> geminiNano() async {
    final GeminiNanoAndroid geminiNanoAndroid = GeminiNanoAndroid();
    final bool isAvailable = await geminiNanoAndroid.isAvailable();

    if(!isAvailable){
      throw Exception('Gemini Nano is not available');
    }
    //instruction
    final respondToPromptMsg = 'Given the above instructions, respond to the following: $prompt';
    return geminiNanoAndroid.generate(prompt:'$instructions\n\n $respondToPromptMsg', image: imageBytes);
  }

  @override
  Future<GenerateContentResponse> firebaseAI() async {

    return FirebaseAI.googleAI()
        .generativeModel(
          model: 'gemini-2.0-flash-lite',
          systemInstruction: Content.system(instructions),
          generationConfig: GenerationConfig(
            responseMimeType: 'application/json',
          ),
        )
        .generateContent([
          Content.multi([
            TextPart(prompt),
            InlineDataPart('image/png', imageBytes),
          ]),
        ]);
  }
}



//hexToColor
 // Converts a hex string like "#2E7DFF" → Color(0xff2e7dff)
Color hexToColor(String hex) {
    final cleaned = hex.replaceFirst('#', '');
    return Color(int.parse('ff$cleaned', radix: 16));
  }
