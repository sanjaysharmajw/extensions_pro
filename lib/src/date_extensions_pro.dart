import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
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
}
