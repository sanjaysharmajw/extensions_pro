extension MapExtensionsPro<K, V> on Map<K, V> {
  /// Returns a new map containing only the entries whose key passes [test].
  Map<K, V> filterKeys(bool Function(K key) test) => {
        for (final entry in entries)
          if (test(entry.key)) entry.key: entry.value,
      };

  /// Returns a new map containing only the entries whose value passes [test].
  Map<K, V> filterValues(bool Function(V value) test) => {
        for (final entry in entries)
          if (test(entry.value)) entry.key: entry.value,
      };
}

extension QueryStringMapExtensionsPro on Map<String, dynamic> {
  /// Converts this map into a URL query string, percent-encoding keys
  /// and values.
  ///
  /// {'q': 'flutter dev', 'page': 2}.toQueryString();
  /// // "q=flutter+dev&page=2"
  String toQueryString() {
    return entries
        .map((e) =>
            '${Uri.encodeQueryComponent(e.key)}=${Uri.encodeQueryComponent('${e.value}')}')
        .join('&');
  }
}
