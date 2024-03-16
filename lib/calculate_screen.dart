import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'info_screen.dart'; // Import InfoScreen

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  _CalculateScreenState createState() => _CalculateScreenState();
}

class _CalculateScreenState extends State<CalculateScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  double? bmi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[100],
      appBar: AppBar(
        title: Text(
          'Calculate BMI',
          style: TextStyle(fontSize: 28),
        ),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Calculate Your BMI Here',
              style: TextStyle(
                fontSize: 38,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(255, 8, 36, 78),
              ),
            ),
            SizedBox(height: 40),
            Column(
              children: [
                _buildInputBox(
                  controller: heightController,
                  labelText: 'Height (m)',
                ),
                SizedBox(height: 20),
                _buildInputBox(
                  controller: weightController,
                  labelText: 'Weight (kg)',
                ),
              ],
            ),
            SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    double height =
                        double.tryParse(heightController.text) ?? 0.0;
                    double weight =
                        double.tryParse(weightController.text) ?? 0.0;
                    setState(() {
                      bmi = calculateBMI(height, weight);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: () {
                    if (bmi != null) {
                      Get.to(() => InfoScreen(), arguments: bmi);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    minimumSize: Size(200, 60),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'View BMI Category',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            if (bmi != null)
              Text(
                'Your BMI is: ${bmi!.toStringAsFixed(1)}',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.blue[900],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBox({
    required TextEditingController controller,
    required String labelText,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.3),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 3,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: TextStyle(color: Colors.blue[900]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.blue.withOpacity(0.5)),
            ),
          ),
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

  double calculateBMI(double height, double weight) {
    return weight / (height * height);
  }
}
