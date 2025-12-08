import 'package:dynamic_system_colors/dynamic_system_colors.dart';
import 'package:flutter/services.dart';

import 'models/dynamic_color.dart';
import 'models/theme_style.dart';

abstract class ThemeUtils {
  /// Retrieves the OS dynamic color if available.
  static Future<DynamicColor?> osDynamicColor() async {
    final corePalette = await DynamicColorPlugin.getCorePalette();
    if (corePalette != null) {
      return DynamicCorePalette(corePalette);
    }

    final accentColor = await DynamicColorPlugin.getAccentColor();
    if (accentColor != null) {
      return DynamicAccentColor(accentColor);
    }

    return null;
  }

  /// Determines the theme style based on the target platform.
  static ThemeStyle platformStyle(TargetPlatform platform) => switch (platform) {
    TargetPlatform.iOS || TargetPlatform.macOS => ThemeStyle.cupertino,
    _ => ThemeStyle.material,
  };
}
