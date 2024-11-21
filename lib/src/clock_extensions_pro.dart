extension DigitalClockExtensions on DateTime {
  /// Returns time in `HH:mm:ss` format.
  String toDigitalTimeWithSeconds() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}:${second.toString().padLeft(2, '0')}';
  }

  /// Returns time in `HH:mm` format.
  String toDigitalTime() {
    return '${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}';
  }
}
