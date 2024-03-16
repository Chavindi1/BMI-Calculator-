import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'calculate_screen.dart';
import 'info_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BMI Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Set the initial route to '/'
      getPages: [
        GetPage(name: '/', page: () => CalculateScreen()), // Register CalculateScreen as '/'
        GetPage(name: '/info', page: () => InfoScreen()),  // Register InfoScreen as '/info'
      ],
    );
  }
}
