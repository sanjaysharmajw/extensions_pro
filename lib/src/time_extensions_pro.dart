extension CurrentTimeExtensions on DateTime {
  // Get the current time
  static DateTime get currentTime => DateTime.now();

  // Get the current date as a formatted string (e.g., '2024-11-25')
  static String get currentDateFormatted {
    final now = DateTime.now();
    return "${now.year}-${now.month.toString().padLeft(2, '0')}-${now.day.toString().padLeft(2, '0')}";
  }

  // Get the current time as a formatted string (e.g., '14:30')
  static String get currentTimeFormatted {
    final now = DateTime.now();
    return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}";
  }

  // Check if the current time is morning (before 12 PM)
  static bool get isMorning => DateTime.now().hour < 12;

  // Check if the current time is afternoon (12 PM to 6 PM)
  static bool get isAfternoon => DateTime.now().hour >= 12 && DateTime.now().hour < 18;

  // Check if the current time is evening (after 6 PM)
  static bool get isEvening => DateTime.now().hour >= 18;
}
