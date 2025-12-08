import 'package:flutter/rendering.dart';
import 'package:material_color_utilities/material_color_utilities.dart';

/// Represents a dynamic color obtained from the operating system.
sealed class DynamicColor {
  const DynamicColor();
}

/// Represents a dynamic core palette obtained from the operating system.
final class DynamicCorePalette extends DynamicColor {
  /// The core palette of dynamic colors.
  final CorePalette palette;

  const DynamicCorePalette(this.palette);
}

/// Represents a dynamic accent color obtained from the operating system.
final class DynamicAccentColor extends DynamicColor {
  /// The accent color.
  final Color color;

  const DynamicAccentColor(this.color);
}
