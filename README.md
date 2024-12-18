
![Logo](https://github.com/sanjaysharmajw/extensions_pro/blob/main/example/assets/extensions_pro.png?raw=true)
# Extensions Pro

- ![Pub Publisher](https://img.shields.io/pub/publisher/extensions_pro)
- ![Pub Points](https://img.shields.io/pub/points/extensions_pro)
- ![Pub Popularity](https://img.shields.io/pub/popularity/extensions_pro)
- ![Pub Version](https://img.shields.io/pub/v/extensions_pro)
- ![Pub Likes](https://img.shields.io/pub/likes/extensions_pro)



#### Extensions Pro simplifies your development process, making it faster and more efficient.


##### This Extensions Pro Package empowers you to accelerate your development process, enabling faster and more efficient project completion.

- [Date Extensions](#date-extensions)
- [Time Extensions](#time-extensions)
- [Clock Extensions](#clock-extensions)
- [Image Network Extensions](#image-network-extensions)
- [Local Image Extensions](#local-image-extensions)
- [Validation Extensions](#validation-extensions)
- [Navigation Extensions](#navigation-extensions)
- [Widgets Extensions](#widgets-extensions)
- [String Extensions](#string-extensions)
- [Int Extensions](#int-extensions)
- [SnackBar Extensions](#snackBar-extensions)
- [List Extensions](#list-extensions)
- [Radio Button Extensions](#radio-button-extensions)
- [Distance Calculate Extensions](#distance-calculate-extensions)
- [Unit Conversions Extensions](#unit-conversions-extensions)
- [Status Bar Extensions](#status-bar-extensions)



#### Date Extensions

```dart
//Date Picker
final dateSelected = await context.pickDate(dateFormatChange: "yyyy-MM-dd"); Output: 2024-11-06 

//Week Day
int day = 3;
var days=day.toWeekDay(); // Output: Wednesday
var dayHalfName=day.toWeekDay(isHalfName: true); // Output: Wed

//Date Time Difference
final date1 = DateTime(2024, 11, 19);
final date2 = DateTime(2024, 11, 15);
final difference = date1.differenceInDays(date2);

Difference in days: difference.inDays  // Output: Difference in days: 4 days
Total difference in hours: difference.inHours // Output: Total difference in hours: 96 hours

// Formatting a Date
DateTime now = DateTime.now();
print(now.format('yyyy-MM-dd')); // Output: 2024-11-25

// Getting Start and End of Day
DateTime now = DateTime.now();
print(now.startOfDay); // Output: 2024-11-25 00:00:00
print(now.endOfDay);   // Output: 2024-11-25 23:59:59

// Calculating Age
DateTime birthDate = DateTime(1990, 11, 25);
print(birthDate.age); // Output: 34 (on 2024-11-25)

// Checking if Date is Today, Yesterday, or Tomorrow
DateTime date = DateTime.now();
print(date.isToday); // Output: true
print(date.isYesterday); // Output: true
print(date.isTomorrow); // Output: true

// Adding or Subtracting Days, Months, or Years
DateTime now = DateTime.now();
print(now.addDays(5)); // 5 days later
print(now.subtractMonths(1)); // 1 month earlier

// Getting Day of the Week Name
DateTime date = DateTime.now();
print(date.weekdayName); // Output: Monday (for example)


```
#### Time Extensions

```dart

// Get the current time
print("Current Time: ${DateTime.now().currentTime}");               // Prints the current DateTime object

// Get the current date as a formatted string (e.g., '2024-11-25')
print("Formatted Date: ${DateTime.now().currentDateFormatted}");    // e.g., 2024-11-25

// Get the current time as a formatted string (e.g., '14:30')
print("Formatted Time: ${DateTime.now().currentTimeFormatted}");    // e.g., 14:30

// Check if the current time is morning (before 12 PM)
print("Is Morning: ${DateTime.now().isMorning}");                   // true or false

// Check if the current time is afternoon (12 PM to 6 PM)
print("Is Afternoon: ${DateTime.now().isAfternoon}");               // true or false

// Check if the current time is evening (after 6 PM)
print("Is Evening: ${DateTime.now().isEvening}");                   // true or false

// Time Picker
TimeOfDay? selectedTime;
final selectedTimes = await context.pickTime();
      setState(() {
        selectedTime = selectedTimes;
        });

var output = selectedTime!.format(context);  // 11:08 PM

```
#### Clock Extensions

```dart
// Digital Clock Time
String currentTime = DateTime.now().toDigitalTimeWithSeconds(); // Change toDigitalTime
 @override
  void initState() {
    super.initState();
    // Update the clock every second
    Future.delayed(Duration.zero, _updateTime);
  }

  void _updateTime() {
    setState(() {
      currentTime = DateTime.now().toDigitalTimeWithSeconds();
    });
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }
  print(currentTime); // 11:42:32
  print(currentTime); // 11:42
  
```
#### Image Network Extensions
``` dart
// 1. Network Image with Progress
ImageNetworkExtensionsPro.networkImageWithProgress(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50),

// 2. Network Image with Rounded Corners
ImageNetworkExtensionsPro.networkImageWithRoundedCorners(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50,
    borderRadius: 16.0),

 // 3. Network Image with Placeholder
ImageNetworkExtensionsPro.networkImageWithPlaceholder(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50,
    placeholder: const Center(child: Text('Loading...'))),

// 4. Cached Network Image
ImageNetworkExtensionsPro.cachedNetworkImage(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50),

// 5. Network Image with Shadow
ImageNetworkExtensionsPro.networkImageWithShadow(
    url: 'https://picsum.photos/200',
    width: 50,
    height: 50,
    elevation: 10.0,
    shadowColor: Colors.black45),

```

#### Local Image Extensions

```dart
// 1. Image with Progress Indicator and Error Handling
ImageLocalExtensionsPro.assetImageWithProgress(
    'assets/extensions_pro.png',
    width: 150,
    height: 150,
loadingWidget: const Center(child: CircularProgressIndicator()), context: context),

// 2. Image with Rounded Corners
ImageLocalExtensionsPro.assetImageWithRoundedCorners(
    'assets/extensions_pro.png',
    width: 150,
    height: 150,
    borderRadius: 16.0, context: context),

// 3. Image with Shadow
ImageLocalExtensionsPro.assetImageWithShadow(
    'assets/extensions_pro.png',
    width: 150,
    height: 150,
    elevation: 8.0,
    shadowColor: Colors.blueAccent, context: context),

// 4. Image with Fitted Box for Scaling
ImageLocalExtensionsPro.assetImageWithFittedBox(
    'assets/extensions_pro.png',
    width: 150,
    height: 150),

```

#### Validation Extensions

```dart
final url1 = "https://www.example.com";
final url3 = "htp:/invalid-url";
final url4 = "https://sub.domain.co.uk/path";

print("Is '$url1' a valid URL? ${url1.isValidUrl()}"); // Output: true
print("Is '$url3' a valid URL? ${url3.isValidUrl()}"); // Output: false

String email = 'test@example.com'; 
print(email.isValidEmail()); // Email Validation - Output: true

String phone = '+1234567890';
print(phone.isValidPhoneNumber()); // Phone Number Validation - Output: true

String password = 'Password123';
print(password.isStrongPassword()); // Password Strength Validation (At least one uppercase, one lowercase, one digit) - Output: true

String numericValue = '123456';
print(numericValue.isNumeric()); // Numeric Validation - Output: true

String input = 'abc123';
print(input.isAlphaNumeric()); // Alpha Numeric Validation - Output: true

String creditCard = '4532015112830366';
print(creditCard.isValidCreditCardNumber()); // Credit Card Number Validation (Luhn Algorithm) - Output: true

String hexColor = '#FF5733';
print(hexColor.isValidHexColor()); // Hexadecimal Color Validation - Output: true

// Example OTPs
String otp1 = '123456'; // Valid OTP
String otp2 = '12345a'; // Invalid OTP (contains a letter)
String otp3 = '123';    // Invalid OTP (too short)
  
// Validating OTPs
print('Is OTP 1 valid? ${otp1.isValidOTP()}'); // Output: true
print('Is OTP 2 valid? ${otp2.isValidOTP()}'); // Output: false
print('Is OTP 3 valid? ${otp3.isValidOTP()}'); // Output: false

// Example coordinates (Lat, Long)
String latitude1 = '37.7749'; // Valid Latitude
String longitude1 = '-122.4194'; // Valid Longitude

String latitude2 = '100.0000'; // Invalid Latitude (out of range)
String longitude2 = '200.0000'; // Invalid Longitude (out of range)

// Validating Latitude and Longitude
print('Is Latitude 1 valid? ${latitude1.isValidLatitude()}'); // Output: true
print('Is Longitude 1 valid? ${longitude1.isValidLongitude()}'); // Output: true

print('Is Latitude 2 valid? ${latitude2.isValidLatitude()}'); // Output: false
print('Is Longitude 2 valid? ${longitude2.isValidLongitude()}'); // Output: false


// Password Match Validation Extension

String password = 'Password123';
String confirmPassword = 'Password123';

bool isMatch = password.isPasswordMatch(confirmPassword);
print('Do the passwords match? $isMatch'); // Output: true

confirmPassword = 'Password124';
isMatch = password.isPasswordMatch(confirmPassword);
print('Do the passwords match? $isMatch'); // Output: false




```


#### Navigation Extensions

```dart
context.push(SecondScreen());   // Push a new Screen
context.pushReplacement(SecondScreen()); // Push and Replace Current Screen
context.pop(); // Pop the Current Screen 
context.pushAndRemoveUntil(HomeScreen()); // Push and Clear Navigation Stack
```

#### Widgets Extensions

```dart
widget.withPadding(EdgeInsets.all(8.0)); //withPadding: Wraps the widget in a Padding widget to apply padding around it.
widget.withMargin(EdgeInsets.all(8.0)); // withMargin: Wraps the widget in a Container and applies margin.
widget.centered(); // centered: Centers the widget inside a Center widget.
widget.withBorder(color: Colors.blue, width: 2.0); // withBorder: Adds a border around the widget by wrapping it inside a Container with a BoxDecoration.
widget.withShadow(blurRadius: 5.0, color: Colors.grey); // withShadow: Adds a shadow to the widget by wrapping it in a Material widget.
widget.withRoundedCorners(radius: 12.0); //withRoundedCorners: Applies rounded corners to the widget using ClipRRect.

widget.onTap(() { events. //// onTap: Wraps the widget inside a GestureDetector to detect tap 
  print('Widget tapped!');
});

widget.withVisibility(true); // withVisibility: Wraps the widget in a Visibility widget, conditionally hiding it based on the isVisible flag.

// Example
Text('Hello World!')
            .withPadding(EdgeInsets.all(16.0))
            .withBorder(color: Colors.blue, width: 2.0)
            .withShadow(blurRadius: 8.0, color: Colors.black)
            .withRoundedCorners(radius: 12.0),
          
ElevatedButton(
            onPressed: () {
                print('Button tapped');
            }
            child: Text('Tap Me'),
            ).onTap(() {
              print('Button tapped from extension!');
            }),
```

#### String Extensions

```dart
print('flutter'.capitalize()); // Capitalize the first letter Output: Flutter
print('test@example.com'.isValidEmail()); // Check if the string is a valid email Output: true

print('invalid-email'.isValidEmail()); // Check if the string is a valid emailOutput: false
print('flutter'.reverse()); // Reverse the string Output: rettulf
print('123'.isNumeric());  // Check if the string is numeric Output: true
print('abc'.isNumeric());  // Check if the string is numeric Output: false

print('Flutter is awesome'.removeWhitespace()); // Remove all whitespace Output: Flutterisawesome
print('Flutter is amazing'.truncate(10)); // Truncate the string with ellipsis Output: Flutter is...

print('snake_case_string'.toCamelCase()); // Convert snake_case to camelCase Output: SnakeCaseString
print('flutter is fun'.countOccurrences('u')); // Count occurrences of a character Output: 2

print('madam'.isPalindrome()); // Check if the string is a palindrome Output: true
print('flutter'.isPalindrome()); // Check if the string is a palindrome Output: 
print('Order1234'.extractNumbers()); // Extract numbers from a string Output: 1234
```

#### Int Extensions

```dart
print(125.toDurationString); // Convert int to duration in minutes and seconds - Output: 2m 5s

print(1990.toRoman); // Convert to Roman numeral - Output: MCMXC

print(1.toOrdinal()); // Convert an integer to its ordinal string - Output: 1st
print(22.toOrdinal()); // Convert an integer to its ordinal string - Output: 22nd

print(1024.toFileSize()); // To Bytes (KB, MB, GB) - Output: 1.00 KB
print(1048576.toFileSize()); // To Bytes (KB, MB, GB) - Output: 1.00 MB

// To convert a numeric value (e.g., rupees) to its word representation in Flutter, you can create an extension on int. Here's how you can achieve it:
int amount = 123456;
print('Amount in words: ${amount.toWords()}'); // Amount in words: one lakh twenty-three thousand four hundred fifty-six

int number = 12340; // To convert numbers like 12340 to a short format like 12K, you can create a utility function in Flutter.
print(number.toShortString()); // Output: 12K
```





#### SnackBar Extensions

```dart
// SnackBar for Success and Error
context.showSuccessSnackBar("Operation successful!");
context.showErrorSnackBar("An error occurred!");

// SnackBar with Gradient
context.showGradientSnackBar(context, "message");

// SnackBar with Custom Duration
context.showPersistentSnackBar( message: 'Message', dismissColor: Colors.white);

// SnackBar with Helper Method
context.showCustomSnackBar(
  message: "This is a custom SnackBar!",
  backgroundColor: Colors.blue,
  action: SnackBarAction(
    label: "UNDO",
    onPressed: () {
      // Handle action
    },
  ),
);

// SnackBar with Icons
context.showIconSnackBar(
  message: "Data saved successfully!",
  icon: Icons.check_circle,
  backgroundColor: Colors.green,
);
```
#### List Extensions

```dart
final list = [1, 2, 3, 4, 5, 6, 6, 7, 8, 9];

// firstOrDefault
print(list.firstOrDefault()); // 1

// lastOrDefault
print(list.lastOrDefault()); // 9

// addIfNotExists
list.addIfNotExists(10);
print(list); // [1, 2, 3, 4, 5, 6, 6, 7, 8, 9, 10]

// removeDuplicates
print(list.removeDuplicates()); // [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// safeSublist
print(list.safeSublist(2, 5)); // [3, 4, 5]

// find
print(list.find((x) => x > 5)); // 6

 // sortBy
final names = ['Zara', 'Anna', 'Mike'];
names.sortBy((name) => name, descending: true);
print(names); // ['Zara', 'Mike', 'Anna']

// toMap
final map = list.toMap((x) => x.toString());
print(map); // {'1': 1, '2': 2, '3': 3, ...}

// ForEachIndexed
list.forEachIndexed((index, item) {
    print('Index $index: $item');
});

// Chunked
print(list.chunked(3)); // [[1, 2, 3], [4, 5, 6], [7, 8, 9], [10]]

```
#### Radio Button Extensions
![Logo](https://raw.githubusercontent.com/sanjaysharmajw/extensions_pro/main/example/assets/radio_button.png)
```dart
Row(
    children: [
        const Text('Option 1')
                .radioButton<String>(
                value: 'Option 1',
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade100,
                groupValue: selectedValue,
                onChanged: (value) =>setState(() => selectedValue = value!),
                ).withPadding(const EdgeInsets.all(10)),
        const Text('Option 2')
                .radioButton<String>(
                activeColor: Colors.green,
                inactiveColor: Colors.green.shade100,
                value: 'Option 2',
                groupValue: selectedValue,
                onChanged: (value) => setState(() => selectedValue = value!),
                  ).withPadding(const EdgeInsets.all(10)),
              const Text('Option 3')
                  .radioButton<String>(
                    activeColor: Colors.green,
                    inactiveColor: Colors.green.shade100,
                    value: 'Option 3',
                    groupValue: selectedValue,
                    onChanged: (value) => setState(() => selectedValue = value!),
              ).withPadding(const EdgeInsets.all(10)),
            ],
          ),

```
#### Distance Calculate Extensions

```dart
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

  print('The distance is ${distance.toStringAsFixed(2)} km.'); // Output: The distance is 1158.91 km.


```
#### Unit Conversions Extensions

```dart

double length = 5000; // Example for Length
double temperature = 25; // Celsius
double area = 10000; // Square meters
double weight = 70; // Kilograms
double speed = 100; // Kilometers per hour
double time = 3600; // Seconds
double volume = 100; // Liters
double digitalStorage = 2048; // MB
double energy = 1000; // Joules
double pressure = 101325; // Pascals
double angle = 90; // Degrees
double currency = 100; // USD
double electricity = 1.5; // Volts
double fuelEfficiency = 25; // MPG
double power = 500; // Watts
double dataRate = 10; // Mbps
double powerConsumption = 1000; // Watt-hours

// Length conversions
print('Length Conversions:');
print('Meters to Kilometers: ${length.toKilometersPro}');
print('Meters to Miles: ${length.toMilesPro}');
print('Yards to Meters: ${length.toMetersFromYardsPro}');
print('Feet to Meters: ${length.toMetersFromFeetPro}');
print('Inches to Centimeters: ${length.toCentimetersFromInchesPro}');
print('Centimeters to Inches: ${length.toInchesFromCentimetersPro}');

// Temperature conversions
print('\nTemperature Conversions:');
print('Celsius to Fahrenheit: ${temperature.toFahrenheitPro}');
print('Fahrenheit to Celsius: ${temperature.toCelsiusPro}');

// Area conversions
print('\nArea Conversions:');
print('Square Meters to Acres: ${area.toAcresPro}');
print('Square Feet to Square Meters: ${area.toSquareMetersPro}');

// Weight conversions
print('\nWeight Conversions:');
print('Kilograms to Pounds: ${weight.toPoundsPro}');
print('Pounds to Kilograms: ${weight.toKilogramsPro}');
print('Ounces to Grams: ${weight.toGramsPro}');
print('Grams to Ounces: ${weight.toOuncesPro}');

// Speed conversions
print('\nSpeed Conversions:');
print('Kilometers per Hour to Miles per Hour: ${speed.toMilesPerHourPro}');
print('Miles per Hour to Kilometers per Hour: ${speed.toKilometersPerHourPro}');

// Time conversions
print('\nTime Conversions:');
print('Seconds to Minutes: ${time.toMinutesPro}');
print('Minutes to Hours: ${time.toHoursPro}');
print('Hours to Days: ${time.toDaysPro}');

// Volume conversions
print('\nVolume Conversions:');
print('Liters to Gallons: ${volume.toGallonsPro}');
print('Gallons to Liters: ${volume.toLitersPro}');
print('Cubic Meters to Cubic Feet: ${volume.toCubicFeetPro}');
print('Cubic Feet to Cubic Meters: ${volume.toCubicMetersFromCubicFeetPro}');

// Digital storage conversions
print('\nDigital Storage Conversions:');
print('MB to GB: ${digitalStorage.toGBPro}');
print('GB to MB: ${digitalStorage.toMBPro}');

// Energy conversions
print('\nEnergy Conversions:');
print('Joules to Calories: ${energy.toCaloriesPro}');
print('Calories to Joules: ${energy.toJoulesPro}');

// Pressure conversions
print('\nPressure Conversions:');
print('Pascals to Bar: ${pressure.toBarPro}');
print('Atmosphere to Pascal: ${pressure.toPascalPro}');

// Angle conversions
print('\nAngle Conversions:');
print('Degrees to Radians: ${angle.toRadiansPro}');
print('Radians to Degrees: ${angle.toDegreesPro}');

// Currency conversions
print('\nCurrency Conversions:');
print('USD to EUR: ${currency.toEURPro}');
print('EUR to USD: ${currency.toUSDPro}');

// Electricity conversions
print('\nElectricity Conversions:');
print('Volts to Millivolts: ${electricity.toMillivoltsPro}');
print('Millivolts to Volts: ${electricity.toVoltsFromMillivoltsPro}');

// Fuel efficiency
print('\nFuel Efficiency:');
print('MPG to L/100km: ${fuelEfficiency.toLPer100kmPro}');
print('L/100km to MPG: ${fuelEfficiency.toMPGPro}');

// Power conversions
print('\nPower Conversions:');
print('Watts to Kilowatts: ${power.toKilowattsPro}');
print('Kilowatts to Watts: ${power.toWattsPro}');

// Data rate conversions
print('\nData Rate Conversions:');
print('Mbps to Kbps: ${dataRate.toKbpsPro}');
print('Kbps to Mbps: ${dataRate.toMbpsPro}');

// Power consumption
print('\nPower Consumption:');
print('Watt-hours to Kilowatt-hours: ${powerConsumption.toKilowattHoursPro}');
print('Kilowatt-hours to Watt-hours: ${powerConsumption.toWattHoursPro}');
```
#### Status Bar Extensions

```dart
//Set Status Bar Color
context.setStatusBarColor(Colors.blue, darkIcons: false)

//Hide Status Bar
context.hideStatusBar()

//Show Status Bar
context.showStatusBar();

//Set Status Bar Brightness
context.setStatusBarBrightness(Brightness.dark);

//Set Status Bar Text Colo
context.setStatusBarTextColor(true); // Dark text
context.setStatusBarTextColor(false); // Light text
```
## Authors
* [@sanjaysharmajw](https://github.com/sanjaysharmajw)


## About Me
I'm a full stack developer. Cross-Platform Mobile Developer: Android, iOS, Swift , and Flutter Expert


## License

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](https://github.com/sanjaysharmajw/extensions_pro/blob/main/LICENSE)


## Support
I hope you had a great experience using this package! If you found the Extensions Pro helpful, consider supporting me by buying a coffee—your generosity would mean a lot and is deeply appreciated!

[![Buy Me A Coffee](https://img.shields.io/badge/Buy_Me_A_Coffee-FFDD00?style=for-the-badge&logo=buy-me-a-coffee&logoColor=black)](https://buymeacoffee.com/sanjaysharmajw)



## Skills
Android, iOS, Java, Kotlin, JetPack Compose, SwiftUI, Flutter, Dart, JavaScript, Node.js...

