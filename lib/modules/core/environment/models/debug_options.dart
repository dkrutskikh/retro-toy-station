import 'package:freezed_annotation/freezed_annotation.dart';

part 'debug_options.freezed.dart';

/// Отладочные настройки приложения
@freezed
abstract class DebugOptions with _$DebugOptions {
  const factory DebugOptions({
    /// Адрес прокси сервера
    String? proxyUrl,

    @Default(false) bool showPerformanceOverlay,
    @Default(false) bool debugShowMaterialGrid,
    @Default(false) bool checkerboardRasterCacheImages,
    @Default(false) bool checkerboardOffscreenLayers,
    @Default(false) bool showSemanticsDebugger,
    @Default(false) bool debugShowCheckedModeBanner,
    @Default(false) bool debugPaintSizeEnabled,
    @Default(false) bool debugRepaintRainbowEnabled,

    @Default(false) bool showAccessibilityTools,

    /// Коэффициент замедления анимации
    @Default(1.0) double timeDilation,
  }) = _DebugOptions;
}
