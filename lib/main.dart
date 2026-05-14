import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shade_craft/feature/generate_color/view/color_palette_screen.dart';
import 'package:shade_craft/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    ProviderScope(child: MaterialApp(
      title: 'Shade Craft',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      home: ColorPaletteScreen(),
    )),
  );
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   String _aiResponse = 'Press the button to ask AI.';
//   bool _isLoading = false;

//   Future<void> _incrementCounter() async {
//     setState(() {
//       _counter++;
//       _isLoading = true;
//       _aiResponse = 'Generating response...';
//     });

//     try {
//       final model = FirebaseAI.googleAI().generativeModel(
//         model: 'gemini-3.1-flash-lite',
//         systemInstruction: Content.system('You are a helpful assistant.'),
//       );

//       // Define the prompt as a list of Content
//       final prompt = [
//         Content.text('The counter is at $_counter. What is Flutter?'),
//       ];
//       final response = await model.generateContent(prompt);

//       setState(() {
//         _aiResponse = response.text ?? 'No response received.';
//         _isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         _aiResponse = 'Error: $e';
//         _isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,

//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: .center,
//           children: [
//             const Text('You have pushed the button this many times:'),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//             const SizedBox(height: 20),
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: _isLoading
//                   ? const CircularProgressIndicator()
//                   : Text(_aiResponse, textAlign: TextAlign.center),
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
