import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

extension StatusBarExtensions on BuildContext {
  // 1. Set Status Bar Color
  void setStatusBarColor(Color color, {bool darkIcons = false}) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: color,
      statusBarIconBrightness: darkIcons ? Brightness.dark : Brightness.light,
    ));
  }

  // 2. Hide the Status Bar
  void hideStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  }

  // 3. Show the Status Bar
  void showStatusBar() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
  }

  // 4. Set Status Bar Brightness
  void setStatusBarBrightness(Brightness brightness) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: brightness,
    ));
  }

  // 5. Set Status Bar Text Color (Dark or Light)
  void setStatusBarTextColor(bool isDark) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarIconBrightness: isDark ? Brightness.dark : Brightness.light,
    ));
  }
}
