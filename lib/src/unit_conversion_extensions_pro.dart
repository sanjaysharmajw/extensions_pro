
extension UnitConversions on num {
  // 1. Length Extension (Meters to Kilometers)
  double get toKilometers => this / 1000;

  // 2. Length Extension (Miles to Kilometers)
  double get toKilometersFromMiles => this * 1.60934;

  // 3. Temperature Extension (Celsius to Fahrenheit)
  double get toFahrenheit => this * 9 / 5 + 32;

  // 4. Temperature Extension (Fahrenheit to Celsius)
  double get toCelsius => (this - 32) * 5 / 9;

  // 5. Area Extension (Square Meters to Acres)
  double get toAcres => this / 4046.86;

  // 6. Area Extension (Square Feet to Square Meters)
  double get toSquareMeters => this * 0.092903;

  // 7. Weight Extension (Kilograms to Pounds)
  double get toPounds => this * 2.20462;

  // 8. Weight Extension (Pounds to Kilograms)
  double get toKilograms => this / 2.20462;

  // 9. Speed Extension (Kilometers per Hour to Miles per Hour)
  double get toMilesPerHour => this * 0.621371;

  // 10. Speed Extension (Miles per Hour to Kilometers per Hour)
  double get toKilometersPerHour => this / 0.621371;

  // 11. Time Extension (Seconds to Minutes)
  double get toMinutes => this / 60;

  // 12. Time Extension (Minutes to Hours)
  double get toHours => this / 60;

  // 13. Time Extension (Hours to Days)
  double get toDays => this / 24;

  // 14. Volume Extension (Liters to Gallons)
  double get toGallons => this * 0.264172;

  // 15. Volume Extension (Gallons to Liters)
  double get toLiters => this / 0.264172;

  // 16. Digital Storage Extension (MB to GB)
  double get toGB => this / 1024;

  // 17. Digital Storage Extension (GB to MB)
  double get toMB => this * 1024;

  // 18. Digital Storage Extension (TB to GB)
  double get toGBFromTB => this * 1024;

  // 19. Pressure Extension (Pascals to Bar)
  double get toBar => this / 100000;

  // 20. Pressure Extension (Atmosphere to Pascal)
  double get toPascal => this * 101325;

  // 21. Angle Extension (Degrees to Radians)
  double get toRadians => this * (3.14159265359 / 180);

  // 22. Angle Extension (Radians to Degrees)
  double get toDegrees => this * (180 / 3.14159265359);

  // 23. Energy Extension (Joules to Calories)
  double get toCalories => this * 0.239006;

  // 24. Energy Extension (Calories to Joules)
  double get toJoules => this / 0.239006;

  // 25. Currency Extension (USD to EUR)
  double get toEUR => this * 0.92; // Approximate conversion

  // 26. Currency Extension (EUR to USD)
  double get toUSD => this / 0.92;

  // 27. Currency Extension (INR to USD)
  double get toUSDFromINR => this / 82.0; // Approximate conversion

  // 28. Fuel Efficiency Extension (MPG to L/100km)
  double get toLPer100km => 235.214583 / this;

  // 29. Fuel Efficiency Extension (L/100km to MPG)
  double get toMPG => 235.214583 / this;

  // 30. Data Rate Extension (Mbps to Kbps)
  double get toKbps => this * 1000;

  // 31. Data Rate Extension (Kbps to Mbps)
  double get toMbps => this / 1000;

  // 32. Power Extension (Watts to Kilowatts)
  double get toKilowatts => this / 1000;

  // 33. Power Extension (Kilowatts to Watts)
  double get toWatts => this * 1000;

  // 34. Data Size Extension (Kilobytes to Megabytes)
  double get toMegabytes => this / 1024;

  // 35. Data Size Extension (Megabytes to Kilobytes)
  double get toKilobytes => this * 1024;

  // 36. Length Extension (Yards to Meters)
  double get toMetersFromYards => this * 0.9144;

  // 37. Length Extension (Feet to Meters)
  double get toMetersFromFeet => this * 0.3048;

  // 38. Height Extension (Inches to Centimeters)
  double get toCentimetersFromInches => this * 2.54;

  // 39. Height Extension (Centimeters to Inches)
  double get toInchesFromCentimeters => this / 2.54;

  // 40. Electricity Extension (Volts to Millivolts)
  double get toMillivolts => this * 1000;

  // 41. Electricity Extension (Millivolts to Volts)
  double get toVoltsFromMillivolts => this / 1000;

  // 42. Data Transfer Extension (Gigabytes to Terabytes)
  double get toTerabytes => this / 1024;

  // 43. Data Transfer Extension (Terabytes to Gigabytes)
  double get toGigabytesFromTerabytes => this * 1024;

  // 44. Power Consumption Extension (Watt-Hours to Kilowatt-Hours)
  double get toKilowattHours => this / 1000;

  // 45. Power Consumption Extension (Kilowatt-Hours to Watt-Hours)
  double get toWattHours => this * 1000;

  // 46. Volume Extension (Cubic Meters to Cubic Feet)
  double get toCubicFeet => this * 35.3147;

  // 47. Volume Extension (Cubic Feet to Cubic Meters)
  double get toCubicMetersFromCubicFeet => this / 35.3147;

  // 48. Mass Extension (Ounces to Grams)
  double get toGrams => this * 28.3495;

  // 49. Mass Extension (Grams to Ounces)
  double get toOunces => this / 28.3495;

  // 50. Digital Speed Extension (Bits per Second to Bytes per Second)
  double get toBytesPerSecond => this / 8;
}
