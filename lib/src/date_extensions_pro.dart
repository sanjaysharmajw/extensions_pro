import 'package:intl/intl.dart';

extension DateExtensionsPro on DateTime {
  /// Formatting a Date
  String format(String pattern) {
    return DateFormat(pattern).format(this);
  }

  /// Getting Start and End of Day
  DateTime get startOfDay => DateTime(year, month, day);
  DateTime get endOfDay => DateTime(year, month, day, 23, 59, 59);

  //Age Calculate
  int get age {
    final today = DateTime.now();
    int age = today.year - year;
    if (today.month < month || (today.month == month && today.day < day)) {
      age--;
    }
    return age;
  }

  //Checking if Date is Today, Yesterday, or Tomorrow
  bool get isToday {
    final now = DateTime.now();
    return now.year == year && now.month == month && now.day == day;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.year == year &&
        yesterday.month == month &&
        yesterday.day == day;
  }

  bool get isTomorrow {
    final tomorrow = DateTime.now().add(const Duration(days: 1));
    return tomorrow.year == year &&
        tomorrow.month == month &&
        tomorrow.day == day;
  }

  // Adding or Subtracting Days, Months, or Years
  DateTime addDays(int days) => add(Duration(days: days));
  DateTime subtractDays(int days) => subtract(Duration(days: days));
  DateTime addMonths(int months) {
    int newMonth = month + months;
    int newYear = year + (newMonth - 1) ~/ 12;
    newMonth = (newMonth - 1) % 12 + 1;
    return DateTime(newYear, newMonth, day);
  }

  DateTime subtractMonths(int months) => addMonths(-months);
  DateTime addYears(int years) => DateTime(year + years, month, day);
  DateTime subtractYears(int years) => DateTime(year - years, month, day);

  //Getting Day of the Week Name
  String get weekdayName {
    return DateFormat('EEEE').format(this);
  }

  /// True for Saturday or Sunday.
  bool get isWeekend => weekday == DateTime.saturday || weekday == DateTime.sunday;

  /// True for Monday through Friday.
  bool get isWeekday => !isWeekend;

  /// True if [year] is a leap year.
  bool get isLeapYear =>
      (year % 4 == 0 && year % 100 != 0) || year % 400 == 0;

  /// Number of days in this date's month, accounting for leap years.
  int get daysInMonth => DateTime(year, month + 1, 0).day;

  /// Whether this date falls on the same calendar day as [other],
  /// ignoring the time-of-day component.
  bool isSameDay(DateTime other) =>
      year == other.year && month == other.month && day == other.day;

  /// A human-readable relative time string, e.g. "5m ago", "3d ago".
  /// Returns "just now" for moments less than a minute ago or in the future.
  String get timeAgo {
    final diff = DateTime.now().difference(this);
    if (diff.isNegative || diff.inSeconds < 60) return 'just now';
    if (diff.inMinutes < 60) return '${diff.inMinutes}m ago';
    if (diff.inHours < 24) return '${diff.inHours}h ago';
    if (diff.inDays < 7) return '${diff.inDays}d ago';
    if (diff.inDays < 30) return '${(diff.inDays / 7).floor()}w ago';
    if (diff.inDays < 365) return '${(diff.inDays / 30).floor()}mo ago';
    return '${(diff.inDays / 365).floor()}y ago';
  }

  /// Returns a copy of this [DateTime] with the given fields replaced.
  DateTime copyWith({
    int? year,
    int? month,
    int? day,
    int? hour,
    int? minute,
    int? second,
    int? millisecond,
    int? microsecond,
  }) {
    return DateTime(
      year ?? this.year,
      month ?? this.month,
      day ?? this.day,
      hour ?? this.hour,
      minute ?? this.minute,
      second ?? this.second,
      millisecond ?? this.millisecond,
      microsecond ?? this.microsecond,
    );
  }

  /// True if this moment is before now.
  bool get isInPast => isBefore(DateTime.now());

  /// True if this moment is after now.
  bool get isInFuture => isAfter(DateTime.now());

  /// Midnight of the Monday that starts this date's week.
  DateTime get startOfWeek => subtractDays(weekday - 1).startOfDay;

  /// The last moment (23:59:59) of the Sunday that ends this date's week.
  DateTime get endOfWeek => addDays(7 - weekday).endOfDay;

  /// The first day of this date's month.
  DateTime get startOfMonth => DateTime(year, month, 1);

  /// The last moment of this date's month.
  DateTime get endOfMonth => DateTime(year, month, daysInMonth, 23, 59, 59);

  /// January 1st of this date's year.
  DateTime get startOfYear => DateTime(year, 1, 1);

  /// The last moment of December 31st of this date's year.
  DateTime get endOfYear => DateTime(year, 12, 31, 23, 59, 59);

  DateTime addWeeks(int weeks) => addDays(weeks * 7);
  DateTime subtractWeeks(int weeks) => addDays(-weeks * 7);

  /// Whether this date falls in the same calendar month as [other].
  bool isSameMonth(DateTime other) =>
      year == other.year && month == other.month;

  /// Whether this date falls in the same calendar year as [other].
  bool isSameYear(DateTime other) => year == other.year;

  /// The ISO-8601 week number (1–53) for this date.
  int get weekOfYear {
    final dayOfYear = difference(DateTime(year, 1, 1)).inDays + 1;
    final woy = ((dayOfYear - weekday + 10) / 7).floor();
    if (woy < 1) return DateTime(year - 1, 12, 31).weekOfYear;
    if (woy > 52) {
      final isLeap = DateTime(year, 1, 1).isLeapYear;
      final daysInThisYear = isLeap ? 366 : 365;
      if (daysInThisYear - dayOfYear < 4 - weekday) return 1;
    }
    return woy;
  }

  /// "Today", "Yesterday", "Tomorrow", or a formatted date otherwise.
  String toRelativeDateLabel({String pattern = 'dd MMM yyyy'}) {
    if (isToday) return 'Today';
    if (isYesterday) return 'Yesterday';
    if (isTomorrow) return 'Tomorrow';
    return format(pattern);
  }
}
