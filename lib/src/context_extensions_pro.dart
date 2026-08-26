import 'package:flutter/material.dart';

extension ContextExtensionsPro on BuildContext {
  /// Shortcut for `MediaQuery.of(this).size`.
  Size get screenSize => MediaQuery.sizeOf(this);

  /// Screen width in logical pixels.
  double get screenWidth => screenSize.width;

  /// Screen height in logical pixels.
  double get screenHeight => screenSize.height;

  /// Shortcut for `Theme.of(this)`.
  ThemeData get theme => Theme.of(this);

  /// Shortcut for `Theme.of(this).textTheme`.
  TextTheme get textTheme => theme.textTheme;

  /// True when the current theme brightness is `Brightness.dark`.
  bool get isDarkMode => theme.brightness == Brightness.dark;

  /// Hides the on-screen keyboard by removing focus from the current node.
  void unfocus() => FocusScope.of(this).unfocus();

  /// Current device orientation (portrait or landscape).
  Orientation get orientation => MediaQuery.orientationOf(this);

  /// True when the shortest side of the screen is 600dp or more —
  /// a common heuristic for detecting tablets.
  bool get isTablet => MediaQuery.sizeOf(this).shortestSide >= 600;

  /// Padding reserved for system UI (notches, status/navigation bars).
  EdgeInsets get safeAreaPadding => MediaQuery.paddingOf(this);

  /// Height of the on-screen keyboard, or `0` when it is hidden.
  double get keyboardHeight => MediaQuery.viewInsetsOf(this).bottom;

  /// True when the on-screen keyboard is currently visible.
  bool get isKeyboardVisible => keyboardHeight > 0;
}
