import 'package:extensions_pro/extensions_pro.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Custom Radio Buttons')),
        body: const RadioButtonDemo(),
      ),
    );
  }
}

class RadioButtonDemo extends StatefulWidget {
  const RadioButtonDemo({super.key});

  @override
  _RadioButtonDemoState createState() => _RadioButtonDemoState();
}

class _RadioButtonDemoState extends State<RadioButtonDemo> {

  String selectedValue = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Select an option:', style: TextStyle(fontSize: 18)),
          Row(
            children: [
              const Text('Option 1')
                  .radioButton<String>(
                    value: 'Option 1',
                    activeColor: Colors.green,
                    inactiveColor: Colors.green.shade100,
                    groupValue: selectedValue,
                    onChanged: (value) =>
                        setState(() => selectedValue = value!),
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
        ],
      ),
    );
  }
}
