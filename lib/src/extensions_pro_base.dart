import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Date Picker
extension DatePickerExtension on BuildContext {
  Future<String?> pickDate({
    String dateFormatChange = "dd-MM-yyyy",
    DateTime? initialDate,
    DateTime? firstDate,
    DateTime? lastDate,
    Color primaryColor = Colors.green, // Calendar accent color
    Color surfaceColor = Colors.white, // Calendar background color
    Color headerTextColor = Colors.white, // Month-Year text color in header
  }) async {
    final pickedDate = await showDatePicker(
      context: this,

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: primaryColor,                   // Selected date, OK button
              onPrimary: headerTextColor,              // Header text color
              surface: surfaceColor,                   // Calendar background
              onSurface: Colors.black,                 // Normal text color
            ), dialogTheme: DialogThemeData(backgroundColor: surfaceColor),        // Dialog color
          ),
          child: child!,
        );
      },

      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1990),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      final DateFormat dateFormat = DateFormat(dateFormatChange);
      return dateFormat.format(pickedDate);
    }
    return null;
  }
}


// WeekDay
extension WeekDayExtension on int {
  String toWeekDay({bool isHalfName = false}) {
    if (this < 1 || this > 7) {
      throw Exception('Invalid day of the week');
    }

    switch (this) {
      case 1:
        return isHalfName ? "Mon" : "Monday";
      case 2:
        return isHalfName ? "Tue" : "Tuesday";
      case 3:
        return isHalfName ? "Wed" : "Wednesday";
      case 4:
        return isHalfName ? "Thu" : "Thursday";
      case 5:
        return isHalfName ? "Fri" : "Friday";
      case 6:
        return isHalfName ? "Sat" : "Saturday";
      case 7:
        return isHalfName ? "Sun" : "Sunday";
      default:
        throw Exception('Unexpected error');
    }
  }
}

// Time Picker
extension TimePickerExtension on BuildContext {
  Future<TimeOfDay?> pickTime({
    TimeOfDay? initialTime,
  }) async {
    final pickedTime = await showTimePicker(
      context: this,
      initialTime: initialTime ?? TimeOfDay.now(),
    );
    return pickedTime;
  }
}

// Date Time Difference
extension DateTimeDifferenceExtension on DateTime {
  Duration differenceInDays(DateTime other) {
    return difference(other);
  }
}

// Valid URL Extension
extension ValidUrlExtension on String {
  bool isValidUrl() {
    final urlRegex = RegExp(
        r'^(https?:\/\/)?([\w\d\.-]+)\.([a-z\.]{2,6})(\/[\w\d\.-]*)*\/?$');
    return urlRegex.hasMatch(this);
  }
}

// Navigation Page
