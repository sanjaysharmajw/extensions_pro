extension Validation on String {
  bool isValidEmail() {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    return emailRegex.hasMatch(this);
  }

  bool isValidPhoneNumber() {
    final phoneRegex = RegExp(r'^\+?[1-9]\d{1,14}$');
    return phoneRegex.hasMatch(this);
  }

  bool isValidOTP() {
    final otpRegex = RegExp(r'^\d{6}$');
    return otpRegex.hasMatch(this);
  }

  bool isStrongPassword() {
    final passwordRegex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$');
    return passwordRegex.hasMatch(this);
  }

  bool isNumeric() {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(this);
  }

  bool isAlphaNumeric() {
    final alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphaNumericRegex.hasMatch(this);
  }

  bool isValidCreditCardNumber() {
    int sum = 0;
    bool shouldDouble = false;

    for (int i = length - 1; i >= 0; i--) {
      int digit = int.parse(this[i]);
      if (shouldDouble) {
        digit *= 2;
        if (digit > 9) digit -= 9;
      }
      sum += digit;
      shouldDouble = !shouldDouble;
    }
    return sum % 10 == 0;
  }

  bool isValidHexColor() {
    final hexColorRegex = RegExp(r'^#?([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})$');
    return hexColorRegex.hasMatch(this);
  }

  bool isPasswordMatch(String confirmPassword) {
    return this == confirmPassword;
  }

  /// Validates if the string represents a valid latitude (between -90 and 90).
  bool isValidLatitude() {
    try {
      final latitude = double.parse(this);
      return latitude >= -90.0 && latitude <= 90.0;
    } catch (e) {
      return false;
    }
  }

  /// Validates if the string represents a valid longitude (between -180 and 180).
  bool isValidLongitude() {
    try {
      final longitude = double.parse(this);
      return longitude >= -180.0 && longitude <= 180.0;
    } catch (e) {
      return false;
    }
  }
}
