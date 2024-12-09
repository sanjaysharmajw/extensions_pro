import 'dart:math';

extension DistanceCalculator on num {
  /// Calculate distance between two geo-coordinates in kilometers.
  double calculateDistance({
    required double startLatitude,
    required double startLongitude,
    required double endLatitude,
    required double endLongitude,
  }) {
    const earthRadius = 6371.0; // Earth's radius in kilometers
    // Convert degrees to radians
    double degreesToRadians(double degrees) => degrees * (pi / 180);
    final lat1Rad = degreesToRadians(startLatitude);
    final lon1Rad = degreesToRadians(startLongitude);
    final lat2Rad = degreesToRadians(endLatitude);
    final lon2Rad = degreesToRadians(endLongitude);
    final dLat = lat2Rad - lat1Rad;
    final dLon = lon2Rad - lon1Rad;
    final a = pow(sin(dLat / 2), 2) +
        cos(lat1Rad) * cos(lat2Rad) * pow(sin(dLon / 2), 2);
    final c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return earthRadius * c; // Distance in kilometers
  }
}

void main() {
  const double startLatitude = 28.7041; // Example: Delhi, India
  const double startLongitude = 77.1025;
  const double endLatitude = 19.0760; // Example: Mumbai, India
  const double endLongitude = 72.8777;

  final distance = 0.calculateDistance(
    startLatitude: startLatitude,
    startLongitude: startLongitude,
    endLatitude: endLatitude,
    endLongitude: endLongitude,
  );

  print('The distance is ${distance.toStringAsFixed(2)} km.');
}
