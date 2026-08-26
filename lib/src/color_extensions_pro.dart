import 'package:flutter/material.dart';

extension ColorExtensionsPro on Color {
  /// Converts this color to a hex string, e.g. `#336699`.
  ///
  /// Pass [includeAlpha] to prefix the alpha channel (`#FF336699`) and
  /// [leadingHash] to control whether the `#` is included.
  String toHex({bool includeAlpha = false, bool leadingHash = true}) {
    String channel(double value) =>
        (value * 255).round().clamp(0, 255).toRadixString(16).padLeft(2, '0');
    final hex = includeAlpha
        ? '${channel(a)}${channel(r)}${channel(g)}${channel(b)}'
        : '${channel(r)}${channel(g)}${channel(b)}';
    return leadingHash ? '#$hex' : hex;
  }

  /// Returns a lighter shade of this color by [amount] (0.0–1.0).
  Color lighten([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness + amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// Returns a darker shade of this color by [amount] (0.0–1.0).
  Color darken([double amount = 0.1]) {
    final hsl = HSLColor.fromColor(this);
    return hsl
        .withLightness((hsl.lightness - amount).clamp(0.0, 1.0))
        .toColor();
  }

  /// True if this color is perceived as light (dark text/icons read best on it).
  bool get isLight =>
      ThemeData.estimateBrightnessForColor(this) == Brightness.light;

  /// True if this color is perceived as dark (light text/icons read best on it).
  bool get isDark => !isLight;

  /// Blends this color with [other]. [ratio] of `0.0` returns this color,
  /// `1.0` returns [other], and `0.5` returns an even mix.
  Color blend(Color other, [double ratio = 0.5]) {
    return Color.lerp(this, other, ratio.clamp(0.0, 1.0)) ?? this;
  }

  /// Builds a [MaterialColor] swatch (shades 50–900) from this color.
  MaterialColor toMaterialColor() {
    final r = (this.r * 255).round();
    final g = (this.g * 255).round();
    final b = (this.b * 255).round();
    final primary = (0xFF << 24) | (r << 16) | (g << 8) | b;

    const strengths = <int>[50, 100, 200, 300, 400, 500, 600, 700, 800, 900];
    final swatch = <int, Color>{};
    for (final strength in strengths) {
      final ds = 0.5 - (strength / 1000);
      swatch[strength] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    }
    return MaterialColor(primary, swatch);
  }
}

extension HexToColorExtensionsPro on String {
  /// Parses a hex color string (`#RGB`, `#RRGGBB`, or `#AARRGGBB`) into a
  /// [Color]. Returns `null` if the string is not a valid hex color.
  Color? toColor() {
    var hex = replaceFirst('#', '');
    if (hex.length == 3) {
      hex = hex.split('').map((c) => '$c$c').join();
    }
    if (hex.length == 6) hex = 'FF$hex';
    if (hex.length != 8) return null;
    final value = int.tryParse(hex, radix: 16);
    if (value == null) return null;
    return Color(value);
  }
}
