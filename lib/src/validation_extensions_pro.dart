extension ValidationExtensionsPro on String {
  bool isValidEmail() {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
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
    final passwordRegex = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
    );
    return passwordRegex.hasMatch(this);
  }

  bool isDigitsOnly() {
    final numericRegex = RegExp(r'^\d+$');
    return numericRegex.hasMatch(this);
  }

  bool isAlphaNumeric() {
    final alphaNumericRegex = RegExp(r'^[a-zA-Z0-9]+$');
    return alphaNumericRegex.hasMatch(this);
  }

  bool isValidCreditCardNumber() {
    final cleaned = replaceAll(RegExp(r'[\s-]'), '');
    if (cleaned.isEmpty || !RegExp(r'^\d+$').hasMatch(cleaned)) return false;
    int sum = 0;
    bool shouldDouble = false;

    for (int i = cleaned.length - 1; i >= 0; i--) {
      int digit = int.parse(cleaned[i]);
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
    final hexColorRegex = RegExp(
      r'^#?([0-9A-Fa-f]{6}|[0-9A-Fa-f]{3})$',
    );
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

  /// Validates a username: 3–20 characters, letters, digits, and underscores.
  bool isValidUsername() {
    final usernameRegex = RegExp(r'^[a-zA-Z0-9_]{3,20}$');
    return usernameRegex.hasMatch(this);
  }

  /// Validates an Indian 6-digit PIN code (first digit cannot be zero).
  bool isValidPinCode() {
    final pinCodeRegex = RegExp(r'^[1-9][0-9]{5}$');
    return pinCodeRegex.hasMatch(this);
  }

  /// Validates an IPv4 address.
  bool isValidIPAddress() {
    final ipRegex = RegExp(
      r'^((25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)$',
    );
    return ipRegex.hasMatch(this);
  }

  /// Validates a person's name: letters, spaces, apostrophes, and hyphens only.
  bool isValidName() {
    final nameRegex = RegExp(r"^[a-zA-Z\s'-]+$");
    return trim().isNotEmpty && nameRegex.hasMatch(this);
  }
}
