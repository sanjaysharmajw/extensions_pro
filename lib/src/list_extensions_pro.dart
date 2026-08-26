import 'dart:math';

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

  // 11. Deduplicate by a Derived Key, Keeping First Occurrence
  List<T> distinctBy<K>(K Function(T) keySelector) {
    final seen = <K>{};
    final result = <T>[];
    for (final item in this) {
      if (seen.add(keySelector(item))) {
        result.add(item);
      }
    }
    return result;
  }

  // 12. Get a Random Element
  T? randomElement() => isEmpty ? null : this[Random().nextInt(length)];

  // 13. Swap Two Elements In Place
  void swap(int i, int j) {
    final temp = this[i];
    this[i] = this[j];
    this[j] = temp;
  }

  // 14. Group Elements by a Derived Key
  Map<K, List<T>> groupBy<K>(K Function(T) keySelector) {
    final map = <K, List<T>>{};
    for (final item in this) {
      map.putIfAbsent(keySelector(item), () => []).add(item);
    }
    return map;
  }

  // 15. Rotate the List by [shift] Positions (positive rotates right)
  List<T> rotate(int shift) {
    if (isEmpty) return [];
    final n = ((shift % length) + length) % length;
    if (n == 0) return List<T>.from(this);
    return [...sublist(length - n), ...sublist(0, length - n)];
  }
}

extension FlattenListExtensionsPro<E> on List<List<E>> {
  /// Flattens a list of lists into a single list.
  ///
  /// [[1, 2], [3], [4, 5]].flatten();  // [1, 2, 3, 4, 5]
  List<E> flatten() => [for (final list in this) ...list];
}

extension WhereNotNullListExtensionsPro<E> on List<E?> {
  /// Returns a new list with all `null` elements removed.
  List<E> whereNotNull() => [for (final item in this) if (item != null) item];
}

extension NumListExtensionsPro on List<num> {
  /// Sum of all elements, or `0` for an empty list.
  num get sumPro {
    num total = 0;
    for (final n in this) {
      total += n;
    }
    return total;
  }

  /// Arithmetic mean of all elements, or `0` for an empty list.
  double get averagePro => isEmpty ? 0 : sumPro / length;

  /// Largest element, or `null` for an empty list.
  num? get maxPro {
    if (isEmpty) return null;
    num result = first;
    for (final n in skip(1)) {
      if (n > result) result = n;
    }
    return result;
  }

  /// Smallest element, or `null` for an empty list.
  num? get minPro {
    if (isEmpty) return null;
    num result = first;
    for (final n in skip(1)) {
      if (n < result) result = n;
    }
    return result;
  }
}
