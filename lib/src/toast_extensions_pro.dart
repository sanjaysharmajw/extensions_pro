import 'dart:async';

import 'package:flutter/material.dart';

extension ToastExtensionsPro on BuildContext {
  /// Shows a short-lived, non-blocking toast message near the bottom of the
  /// screen. Unlike a `SnackBar`, it does not require a `Scaffold` ancestor —
  /// only an `Overlay` (already provided by `MaterialApp`/`WidgetsApp`).
  void showToast(
    String message, {
    Duration duration = const Duration(seconds: 2),
    Color backgroundColor = Colors.black87,
    Color textColor = Colors.white,
  }) {
    final overlay = Overlay.of(this);
    late OverlayEntry entry;
    entry = OverlayEntry(
      builder: (context) => Positioned(
        left: 24,
        right: 24,
        bottom: 80,
        child: Material(
          color: Colors.transparent,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(color: textColor),
              ),
            ),
          ),
        ),
      ),
    );
    overlay.insert(entry);
    Timer(duration, () {
      if (entry.mounted) entry.remove();
    });
  }
}
