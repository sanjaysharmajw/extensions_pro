

#### Date and Time Extension

```dart
//Date Picker
final dateSelected = await context.pickDate(dateFormatChange: "yyyy-MM-dd"); Output: 2024-11-06 


// Time Picker
TimeOfDay? selectedTime;
final selectedTimes = await context.pickTime();
      setState(() {
        selectedTime = selectedTimes;
        });

var output = selectedTime!.format(context);  // 11:08 PM

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
```


#### Valid URL Extension

```dart
final url1 = "https://www.example.com";
final url2 = "example.com";
final url3 = "htp:/invalid-url";
final url4 = "https://sub.domain.co.uk/path";

print("Is '$url1' a valid URL? ${url1.isValidUrl()}"); // Output: true
print("Is '$url2' a valid URL? ${url2.isValidUrl()}"); // Output: true
print("Is '$url3' a valid URL? ${url3.isValidUrl()}"); // Output: false
print("Is '$url4' a valid URL? ${url4.isValidUrl()}"); // Output: true
```

#### Navigation Extension

```dart
context.push(SecondScreen());   // Push a new Screen
context.pushReplacement(SecondScreen()); // Push and Replace Current Screen
context.pop(); // Pop the Current Screen 
context.pushAndRemoveUntil(HomeScreen()); // Push and Clear Navigation Stack
```

#### Widgets Extension

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

#### String Extension

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

#### Int Extension

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
