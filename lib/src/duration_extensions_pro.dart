extension DurationExtensionsPro on Duration {
  /// Formats this duration as `mm:ss`, or `HH:mm:ss` once it reaches an hour.
  ///
  /// Duration(seconds: 125).toFormattedString();          // "02:05"
  /// Duration(hours: 1, minutes: 2, seconds: 3).toFormattedString(); // "01:02:03"
  String toFormattedString() {
    final hours = inHours;
    final minutes = inMinutes.remainder(60).toString().padLeft(2, '0');
    final seconds = inSeconds.remainder(60).toString().padLeft(2, '0');
    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:$minutes:$seconds';
    }
    return '$minutes:$seconds';
  }

  /// True if this duration is exactly zero.
  bool get isZero => this == Duration.zero;

  /// Formats this duration as a human-readable string, e.g. "1d 2h 3m 4s".
  /// Only non-zero units are included; a zero duration returns "0s".
  String toHumanReadable() {
    if (isZero) return '0s';
    final days = inDays;
    final hours = inHours.remainder(24);
    final minutes = inMinutes.remainder(60);
    final seconds = inSeconds.remainder(60);
    final parts = <String>[
      if (days > 0) '${days}d',
      if (hours > 0) '${hours}h',
      if (minutes > 0) '${minutes}m',
      if (seconds > 0) '${seconds}s',
    ];
    return parts.join(' ');
  }
}
