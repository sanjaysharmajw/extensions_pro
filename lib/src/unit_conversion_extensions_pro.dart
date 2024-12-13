extension UnitConversions on num {
  /// Length Conversions
  double get toKilometersPro => this / 1000;
  double get toMilesPro => this / 1.60934;
  double get toMetersFromYardsPro => this * 0.9144;
  double get toMetersFromFeetPro => this * 0.3048;
  double get toCentimetersFromInchesPro => this * 2.54;
  double get toInchesFromCentimetersPro => this / 2.54;

  /// Temperature Conversions
  double get toFahrenheitPro => this * 9 / 5 + 32;
  double get toCelsiusPro => (this - 32) * 5 / 9;

  /// Area Conversions
  double get toAcresPro => this / 4046.86;
  double get toSquareMetersPro => this * 0.092903;

  /// Weight Conversions
  double get toPoundsPro => this * 2.20462;
  double get toKilogramsPro => this / 2.20462;
  double get toGramsPro => this * 28.3495;
  double get toOuncesPro => this / 28.3495;

  /// Speed Conversions
  double get toMilesPerHourPro => this * 0.621371;
  double get toKilometersPerHourPro => this / 0.621371;

  /// Time Conversions
  double get toMinutesPro => this / 60;
  double get toHoursPro => this / 60;
  double get toDaysPro => this / 24;

  /// Volume Conversions
  double get toGallonsPro => this * 0.264172;
  double get toLitersPro => this / 0.264172;
  double get toCubicFeetPro => this * 35.3147;
  double get toCubicMetersFromCubicFeetPro => this / 35.3147;

  /// Digital Storage Conversions
  double get toGBPro => this / 1024;
  double get toMBPro => this * 1024;
  double get toKilobytesPro => this * 1024;
  double get toMegabytesPro => this / 1024;

  /// Energy Conversions
  double get toCaloriesPro => this * 0.239006;
  double get toJoulesPro => this / 0.239006;

  /// Pressure Conversions
  double get toBarPro => this / 100000;
  double get toPascalPro => this * 101325;

  /// Angle Conversions
  double get toRadiansPro => this * (3.14159265359 / 180);
  double get toDegreesPro => this * (180 / 3.14159265359);

  /// Currency Conversions
  double get toEURPro => this * 0.92; // Placeholder rate
  double get toUSDPro => this / 0.92;

  /// Electricity Conversions
  double get toMillivoltsPro => this * 1000;
  double get toVoltsFromMillivoltsPro => this / 1000;

  /// Fuel Efficiency
  double get toLPer100kmPro => 235.214583 / this;
  double get toMPGPro => 235.214583 / this;

  /// Power Conversions
  double get toKilowattsPro => this / 1000;
  double get toWattsPro => this * 1000;

  /// Data Rate Conversions
  double get toKbpsPro => this * 1000;
  double get toMbpsPro => this / 1000;

  /// Power Consumption
  double get toKilowattHoursPro => this / 1000;
  double get toWattHoursPro => this * 1000;
}
