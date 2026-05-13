import 'package:flutter/material.dart';

class ColorPaletteScreen extends StatelessWidget {
  const ColorPaletteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Color Palette Generator')),
      body: SingleChildScrollView(
        child: Column(
          children: const [ImageInput(), Divider(), ColorsInfoCard()],
        ),
      ),
    );
  }
}

class ImageInput extends StatelessWidget {
  const ImageInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(16.0),
      margin: EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: Colors.black12,
      ),
      //
      child: AspectRatio(
        aspectRatio: 2 / 1,
        child: Column(
          crossAxisAlignment: .center,
          mainAxisAlignment: .center,
          children: [
            Icon(Icons.upload_file),
            Text('Upload your .png image'),
            OutlinedButton(onPressed: () {}, child: Text('Browse files')),
          ],
        ),
      ),
    );
  }
}

class ColorsInfoCard extends StatelessWidget {
  const ColorsInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blueGrey,
      margin: EdgeInsets.all(16.0),
      child: Column(
        children: [
          ListTile(
            title: Text('Color Blend Name'),

            subtitle: Container(
              height: 50,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: AlignmentGeometry.centerLeft,
                  end: AlignmentGeometry.centerRight,
                  colors: [Colors.black87, Colors.red],
                ),
              ),
            ),
          ),

          ColorPallette(),
        ],
      ),
    );
  }
}

class ColorPallette extends StatelessWidget {
  const ColorPallette({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 380,
      //width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: Row(
              //crossAxisAlignment: .stretch,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(flex: 2, child: _Swatch(Colors.black, 'Black')),
                      _Swatch(Colors.indigo, 'Indigo'),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      _Swatch(Colors.lightBlue, 'Light Blue'),
                      Expanded(
                        flex: 2,
                        child: Row(
                          // crossAxisAlignment: .stretch,
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  _Swatch(Colors.redAccent, 'Red Accent'),
                                  _Swatch(Colors.yellow, 'Yellow'),
                                ],
                              ),
                            ),
                            _Swatch(Colors.purple, 'Purple'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(flex: 1, child: _Swatch(Colors.green, 'Green')),
        ],
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
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
              child: ColoredBox(color: color, child: SizedBox.expand()),
            ),
          ),
        ],
      ),
    );
  }
}
