extension ListExtensions<T> on List<T> {
  // 1. Get First Element or Default
  T? firstOrDefault() => isEmpty ? null : first;

  // 2. Get Last Element or Default
  T? lastOrDefault() => isEmpty ? null : last;

  // 3. Add Item if Not Exists
  void addIfNotExists(T item) {
    if (!contains(item)) {
      add(item);
    }
  }

  // 4. Remove Duplicates
  List<T> removeDuplicates() => toSet().toList();

  // 5. Get Sublist with Bounds Check
  List<T> safeSublist(int start, [int? end]) {
    final maxEnd = end == null || end > length ? length : end;
    return (start < 0 || start >= length) ? [] : sublist(start, maxEnd);
  }

  // 6. Find Element by Condition
  T? find(bool Function(T) condition) {
    for (var item in this) {
      if (condition(item)) return item;
    }
    return null;
  }

  // 7. Sort by Custom Property
  void sortBy<K extends Comparable>(K Function(T) keySelector,
      {bool descending = false}) {
    sort((a, b) {
      final keyA = keySelector(a);
      final keyB = keySelector(b);
      return descending ? keyB.compareTo(keyA) : keyA.compareTo(keyB);
    });
  }

  // 8. Convert to Map by Key Selector
  Map<K, T> toMap<K>(K Function(T) keySelector) {
    return {for (var item in this) keySelector(item): item};
  }

  // 9. Apply Action to Each Element
  void forEachIndexed(void Function(int index, T item) action) {
    for (var i = 0; i < length; i++) {
      action(i, this[i]);
    }
  }

  // 10. Chunk List into Smaller Lists
  List<List<T>> chunked(int chunkSize) {
    if (chunkSize <= 0) {
      throw ArgumentError('Chunk size must be greater than 0');
    }
    List<List<T>> chunks = [];
    for (var i = 0; i < length; i += chunkSize) {
      chunks.add(sublist(i, i + chunkSize > length ? length : i + chunkSize));
    }
    return chunks;
  }
}
