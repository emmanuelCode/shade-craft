import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shade_craft/feature/generate_color/intent/color_palette_intent.dart';
import 'package:shade_craft/core/utils/color_extensions.dart';

import 'color_palette_view_event.dart';

class ColorPaletteScreen extends StatelessWidget {
  const ColorPaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Shade Craft')),
      body: SingleChildScrollView(
        child: Column(
          children: const [ImageInput(), Divider(), ColorsInfoCard()],
        ),
      ),
    );
  }
}

class ImageInput extends ConsumerWidget {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var action = ref.read(colorPaletteIntentFactoryProvider.notifier);

    return Container(
      margin: EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.black12,
      ),
      //
      child: AspectRatio(
        aspectRatio: 5 / 4,
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.upload_file),
            Text('Upload your .png image'),
            OutlinedButton(
              onPressed: () => action.toIntent(PickImage()),
              child: Text('Browse files'),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorsInfoCard extends ConsumerWidget {
  const ColorsInfoCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var state = ref.watch(colorPaletteIntentFactoryProvider);

    return state.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stackTrace) => Text(error.toString()),
      data: (data) => Card(
        color: Colors.blueGrey,
        margin: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: .start,
          children: [
            ListTile(
              title: Text(
                data.name,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white60),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              subtitle: Container(
                height: 50,
                margin: const EdgeInsets.only(top: 12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16.0),
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.centerLeft,
                    end: AlignmentGeometry.centerRight,
                    colors: data.colors
                        .map((color) => Color(int.parse(color)))
                        .toList(),
                  ),
                ),
              ),
            ),
            ColorPalette(colors: data.colors),
            SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Colors Application Note',
                style: Theme.of(
                  context,
                ).textTheme.titleLarge!.copyWith(color: Colors.white60),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white60),
                borderRadius: BorderRadius.circular(16.0),
              ),
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),

              child: Text(
                data.description,
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(color: Colors.white60),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPalette extends StatelessWidget {
  final List<String> colors;
  const ColorPalette({required this.colors, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 512,
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Row(
                //crossAxisAlignment: .stretch,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: _Swatch(
                            Color(int.parse(colors[0])),
                            Color(int.parse(colors[0])).toHex,
                          ),
                        ),
                        Expanded(
                          child: _Swatch(
                            Color(int.parse(colors[1])),
                            Color(int.parse(colors[1])).toHex,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Expanded(
                          child: _Swatch(
                            Color(int.parse(colors[2])),
                            Color(int.parse(colors[2])).toHex,
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Row(
                            // crossAxisAlignment: .stretch,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: _Swatch(
                                        Color(int.parse(colors[3])),
                                        Color(int.parse(colors[3])).toHex,
                                      ),
                                    ),
                                    Expanded(
                                      child: _Swatch(
                                        Color(int.parse(colors[4])),
                                        Color(int.parse(colors[4])).toHex,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: _Swatch(
                                  Color(int.parse(colors[5])),
                                  Color(int.parse(colors[5])).toHex,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: _Swatch(
                Color(int.parse(colors[6])),
                Color(int.parse(colors[6])).toHex,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Swatch extends StatelessWidget {
  final Color color;
  final String label;
  const _Swatch(this.color, this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            label,
            style: const TextStyle(
              color: Colors.white54,
              fontSize: 11,
              fontFamily: 'monospace',
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.0),
              child: ColoredBox(color: color, child: SizedBox.expand()),
            ),
          ),
        ),
      ],
    );
  }
}
