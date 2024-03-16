import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double bmi = Get.arguments;
    String category;
    String information;

    if (bmi < 16) {
      category = 'Severe undernourishment';
      information = '>16(kg/m^2) - Severe undernourishment,You are severely undernourished. Please consult a healthcare professional for assistance.';
    } else if (bmi >= 16 && bmi < 17) {
      category = 'Medium undernourishment';
      information = '16-16.9(kg/m^2) - Medium undernourishment,You are moderately undernourished. Consider making dietary and lifestyle changes.';
    } else if (bmi >= 17 && bmi < 18.5) {
      category = 'Slight undernourishment';
      information = '-18.4(kg/m^2) - Slight undernourishment.You are slightly undernourished. Focus on improving your diet and exercise habits.';
    } else if (bmi >= 18.5 && bmi < 25) {
      category = 'Normal nutrition state';
      information = '18.5-24.9(kg/m^2) - Normal nutrition state,Congratulations! You have a normal nutrition state. Keep up the good work!';
    } else if (bmi >= 25 && bmi < 30) {
      category = 'Overweight';
      information = '25-29.9(kg/m^2) - Overweight,You are overweight. Consider making dietary and lifestyle changes to achieve a healthier weight.';
    } else if (bmi >= 30 && bmi < 40) {
      category = 'Obesity';
      information = '39.9(kg/m^2) - Obesity,You are obese. It is important to take steps to improve your health, including diet and exercise.';
    } else {
      category = 'Pathological obesity';
      information = '>40(kg/m^2) - Pathological obesity,You are severely obese. Immediate medical attention is advised for managing your health.';
    }

    return Scaffold(
      backgroundColor: Colors.lightBlue,
      appBar: AppBar(
        title: Text('BMI Category'),
        backgroundColor: Colors.lightBlue,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Category: $category',
                  style: TextStyle(fontSize: 24, color: Color.fromARGB(255, 110, 105, 105)),
                ),
                SizedBox(height: 20),
                Text(
                  'Information: $information',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('>16(kg/m^2) - Severe undernourishment'),
                ),
                ListTile(
                  title: Text('16-16.9(kg/m^2) - Medium undernourishment'),
                ),
                ListTile(
                  title: Text('-18.4(kg/m^2) - Slight undernourishment'),
                ),
                ListTile(
                  title: Text('18.5-24.9(kg/m^2) - Normal nutrition state'),
                ),
                ListTile(
                  title: Text('25-29.9(kg/m^2) - Overweight'),
                ),
                ListTile(
                  title: Text('39.9(kg/m^2) - Obesity'),
                ),
                ListTile(
                  title: Text('>40(kg/m^2) - Pathological obesity'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
