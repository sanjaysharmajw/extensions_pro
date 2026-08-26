import 'package:flutter/services.dart';

extension ClipboardExtensionsPro on String {
  /// Copies this string to the system clipboard.
  Future<void> copyToClipboard() {
    return Clipboard.setData(ClipboardData(text: this));
  }
}
