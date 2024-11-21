
extension StringExtensions on String {
  String capitalize() {
    return isNotEmpty ? '${this[0].toUpperCase()}${this.substring(1)}' : '';
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
    return this.length > length ? '${this.substring(0, length)}...' : this;
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
}
