import 'package:flutter/material.dart';

extension HighlightExtensionsPro on String {
  /// Splits this string into [TextSpan]s with every case-insensitive
  /// occurrence of [query] styled with [highlightStyle] — useful for
  /// highlighting search matches inside a `RichText`/`Text.rich`.
  List<TextSpan> highlightOccurrences(
    String query, {
    TextStyle? baseStyle,
    TextStyle? highlightStyle,
  }) {
    if (query.isEmpty) return [TextSpan(text: this, style: baseStyle)];

    final spans = <TextSpan>[];
    final lowerText = toLowerCase();
    final lowerQuery = query.toLowerCase();
    var start = 0;
    var index = lowerText.indexOf(lowerQuery, start);

    while (index != -1) {
      if (index > start) {
        spans.add(TextSpan(text: substring(start, index), style: baseStyle));
      }
      spans.add(TextSpan(
        text: substring(index, index + query.length),
        style: highlightStyle ??
            const TextStyle(
              fontWeight: FontWeight.bold,
              backgroundColor: Colors.yellow,
            ),
      ));
      start = index + query.length;
      index = lowerText.indexOf(lowerQuery, start);
    }

    if (start < length) {
      spans.add(TextSpan(text: substring(start), style: baseStyle));
    }
    return spans;
  }
}
