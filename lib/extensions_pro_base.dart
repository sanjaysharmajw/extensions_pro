
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Date Picker
extension DatePickerExtension on BuildContext {
  Future<String?> pickDate(
      {String dateFormatChange="dd-MM-yyyy",DateTime? initialDate, DateTime? firstDate, DateTime? lastDate}) async {
    final pickedDate = await showDatePicker(
      context: this,
      initialDate: initialDate ?? DateTime.now(),
      firstDate: firstDate ?? DateTime(1990),
      lastDate: lastDate ?? DateTime(2100),
    );

    if (pickedDate != null) {
      // Format the picked date to DD-MM-YYYY
      final DateFormat dateFormat = DateFormat(dateFormatChange.toString());
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

