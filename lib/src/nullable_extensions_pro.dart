extension NullableStringExtensionsPro on String? {
  /// True if this is `null` or an empty string.
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  /// True if this is `null`, empty, or contains only whitespace.
  bool get isNullOrBlank => this == null || this!.trim().isEmpty;

  /// Returns this string, or [fallback] if this is `null` or empty.
  String orDefault(String fallback) => isNullOrEmpty ? fallback : this!;
}

extension NullableListExtensionsPro<T> on List<T>? {
  /// True if this is `null` or an empty list.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}

extension NullableMapExtensionsPro<K, V> on Map<K, V>? {
  /// True if this is `null` or an empty map.
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
