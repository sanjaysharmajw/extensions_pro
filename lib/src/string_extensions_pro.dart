import 'dart:convert';

extension StringExtensionsPro on String {
  String capitalize() {
    return isNotEmpty ? '${this[0].toUpperCase()}${substring(1)}' : '';
  }

  String reverse() {
    return split('').reversed.join('');
  }

  bool isNumeric() {
    return double.tryParse(this) != null;
  }

  String removeWhitespace() {
    return replaceAll(' ', '');
  }

  String truncate(int length) {
    return this.length > length ? '${substring(0, length)}...' : this;
  }

  String toCamelCase() {
    return split('_').map((e) => e.capitalize()).join('');
  }

  int countOccurrences(String char) {
    return split(char).length - 1;
  }

  bool isPalindrome() {
    String cleaned = toLowerCase().replaceAll(' ', '');
    return cleaned == cleaned.split('').reversed.join('');
  }

  String extractNumbers() {
    return replaceAll(RegExp(r'[^0-9]'), '');
  }

  /// Capitalizes the first letter of every word.
  ///
  /// 'flutter is awesome'.toTitleCase() => 'Flutter Is Awesome'
  String toTitleCase() {
    if (trim().isEmpty) return this;
    return split(' ').map((word) => word.capitalize()).join(' ');
  }

  /// Masks the middle of a string, keeping [visibleStart] characters at the
  /// start and [visibleEnd] characters at the end, replacing the rest with
  /// [maskChar]. Useful for hiding emails, card numbers, or phone numbers.
  ///
  /// '1234567890123456'.mask(visibleStart: 0, visibleEnd: 4) => '************3456'
  String mask({int visibleStart = 0, int visibleEnd = 4, String maskChar = '*'}) {
    final keep = visibleStart + visibleEnd;
    if (length <= keep) return this;
    final start = substring(0, visibleStart);
    final end = substring(length - visibleEnd);
    return '$start${maskChar * (length - keep)}$end';
  }

  /// Extracts up to [maxLetters] initials from a name.
  ///
  /// 'John Doe'.toInitials();  // "JD"
  String toInitials({int maxLetters = 2}) {
    final words = trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty);
    return words.take(maxLetters).map((w) => w[0].toUpperCase()).join();
  }

  /// Converts this string into a URL-friendly slug.
  ///
  /// 'Hello, Flutter World!'.toSlug();  // "hello-flutter-world"
  String toSlug() {
    return trim()
        .toLowerCase()
        .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
        .replaceAll(RegExp(r'[\s-]+'), '-')
        .replaceAll(RegExp(r'^-+|-+$'), '');
  }

  /// Case-insensitive equality check.
  bool equalsIgnoreCase(String other) => toLowerCase() == other.toLowerCase();

  /// Encodes this string as Base64.
  String toBase64() => base64Encode(utf8.encode(this));

  /// Decodes a Base64-encoded string back to plain text.
  String fromBase64() => utf8.decode(base64Decode(this));

  /// Counts the number of whitespace-separated words.
  int wordCount() =>
      trim().isEmpty ? 0 : trim().split(RegExp(r'\s+')).length;

  /// Removes everything except letters, digits, and spaces.
  ///
  /// 'Hello, World! #2024'.removeSpecialCharacters(); // "Hello World 2024"
  String removeSpecialCharacters() =>
      replaceAll(RegExp(r'[^a-zA-Z0-9\s]'), '');

  /// Returns this string pluralized when [count] is not 1.
  ///
  /// 'item'.pluralize(1);  // "item"
  /// 'item'.pluralize(5);  // "items"
  /// 'box'.pluralize(2, plural: 'boxes');  // "boxes"
  String pluralize(int count, {String? plural}) =>
      count == 1 ? this : (plural ?? '${this}s');
}
