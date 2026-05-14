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
    extends $NotifierProvider<ColorPaletteIntentFactory, ColorPaletteEntity> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ColorPaletteEntity value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ColorPaletteEntity>(value),
    );
  }
}

String _$colorPaletteIntentFactoryHash() =>
    r'658bfc80049cb0c490ce47c528a451741c86f593';

abstract class _$ColorPaletteIntentFactory
    extends $Notifier<ColorPaletteEntity> {
  ColorPaletteEntity build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ColorPaletteEntity, ColorPaletteEntity>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ColorPaletteEntity, ColorPaletteEntity>,
              ColorPaletteEntity,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
