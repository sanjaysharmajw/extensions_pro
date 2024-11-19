
![Logo](https://github.com/sanjaysharmajw/extensions_pro/blob/main/example/assets/extensions_pro.png?raw=true)



# Extension Pro
#### Extension Pro simplifies your development process, making it faster and more efficient.


This Extensions Pro Package empowers you to accelerate your development process, enabling faster and more efficient project completion.

- [Date Picker](#Date-Picker)
- [Week Day](#Week-Day)
- [Time Picker](#Time-Picker)
- [Date Time Difference](#Date-Time-Difference)
- [Valid URL](#Valid-URL)
- [Navigation Extension](#Navigation-Extension)
- [Widgets Extension](#Widgets-Extension)





#### Date Picker

```dart
final dateSelected = await context.pickDate(dateFormatChange: "yyyy-MM-dd"); Output: 2024-11-06 
```

#### Week Day

```dart
int day = 3;
var days=day.toWeekDay(); // Output: Wednesday
var dayHalfName=day.toWeekDay(isHalfName: true); // Output: Wed
```

#### Time Picker

```dart
TimeOfDay? selectedTime;

// onTap
final selectedTimes = await context.pickTime();
setState(() {
selectedTime = selectedTimes;
});

var output = selectedTime!.format(context);  // 11:08 PM
```

#### Date Time Difference

```dart
final date1 = DateTime(2024, 11, 19);
final date2 = DateTime(2024, 11, 15);
final difference = date1.differenceInDays(date2);

Difference in days: difference.inDays  // Output: Difference in days: 4 days
Total difference in hours: difference.inHours // Output: Total difference in hours: 96 hours
```

#### Valid URL

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
import 'package:extension_pro/navigation_extensions_pro.dart';

context.push(SecondScreen());   // Push a new Screen
context.pushReplacement(SecondScreen()); // Push and Replace Current Screen
context.pop(); // Pop the Current Screen 
context.pushAndRemoveUntil(HomeScreen()); // Push and Clear Navigation Stack
```

#### Widgets Extension

```dart
import 'package:extension_pro/widgets_extension_pro.dart';

// withPadding: Wraps the widget in a Padding widget to apply padding around it.
widget.withPadding(EdgeInsets.all(8.0));

// withMargin: Wraps the widget in a Container and applies margin.
widget.withMargin(EdgeInsets.all(8.0));

// centered: Centers the widget inside a Center widget.
widget.centered();

// withBorder: Adds a border around the widget by wrapping it inside a Container with a BoxDecoration.
widget.withBorder(color: Colors.blue, width: 2.0);

// withShadow: Adds a shadow to the widget by wrapping it in a Material widget.
widget.withShadow(blurRadius: 5.0, color: Colors.grey);

//withRoundedCorners: Applies rounded corners to the widget using ClipRRect.
widget.withRoundedCorners(radius: 12.0);

// onTap: Wraps the widget inside a GestureDetector to detect tap 
widget.onTap(() { events.
print('Widget tapped!');
});

// withVisibility: Wraps the widget in a Visibility widget, conditionally hiding it based on the isVisible flag.
widget.withVisibility(true);

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




