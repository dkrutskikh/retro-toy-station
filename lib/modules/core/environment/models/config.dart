import 'package:freezed_annotation/freezed_annotation.dart';

import 'debug_options.dart';

part 'config.freezed.dart';

@freezed
abstract class Config with _$Config {
  const factory Config({
    /// Отладочные настройки приложения
    @Default(DebugOptions()) DebugOptions debugOptions,
  }) = _Config;
}
