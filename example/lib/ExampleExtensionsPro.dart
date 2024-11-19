

import 'package:extension_pro/extensions_pro_base.dart';
import 'package:extension_pro/extentions_pro.dart';
import 'package:extension_pro/navigation_extensions_pro.dart';
import 'package:extension_pro/widgets_extension_pro.dart';
import 'package:flutter/material.dart';

class ExampleExtensionsPro extends StatefulWidget {
  const ExampleExtensionsPro({super.key});

  @override
  State<ExampleExtensionsPro> createState() => _ExampleExtensionsProState();
}

class _ExampleExtensionsProState extends State<ExampleExtensionsPro> {

  String? date;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {

      final date1 = DateTime(2024, 11, 19);
      final date2 = DateTime(2024, 11, 15);

      final difference = date1.differenceInDays(date2);

      print("Difference in days: ${difference.inDays} days"); // Output: Difference in days: 4 days
      print("Total difference in hours: ${difference.inHours} hours"); // Output: Total difference in hours: 96 hours


    return  SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          ElevatedButton(onPressed: ()async {
            final selectedTimes = await context.pickTime();
             setState(() {
                 selectedTime = selectedTimes;

             });
          }, child: Text(difference.inHours.toString()).onTap((){

          })
          )
        ],
      ),
    ));
  }
}
