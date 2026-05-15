// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'color_palette_intent.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ColorPaletteIntentFactory)
final colorPaletteIntentFactoryProvider = ColorPaletteIntentFactoryProvider._();

final class ColorPaletteIntentFactoryProvider
    extends
        $AsyncNotifierProvider<ColorPaletteIntentFactory, ColorPaletteEntity> {
  ColorPaletteIntentFactoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'colorPaletteIntentFactoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$colorPaletteIntentFactoryHash();

  @$internal
  @override
  ColorPaletteIntentFactory create() => ColorPaletteIntentFactory();
}

String _$colorPaletteIntentFactoryHash() =>
    r'6283edd210ed4e0dbcf5d3f9a077eca07c8a2faf';

abstract class _$ColorPaletteIntentFactory
    extends $AsyncNotifier<ColorPaletteEntity> {
  FutureOr<ColorPaletteEntity> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<ColorPaletteEntity>, ColorPaletteEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ColorPaletteEntity>, ColorPaletteEntity>,
              AsyncValue<ColorPaletteEntity>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
