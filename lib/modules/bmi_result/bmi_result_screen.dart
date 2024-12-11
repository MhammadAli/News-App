import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  final age;
  final weight;
  final gender;
  final result;

  const BmiResult(
      {super.key,
      required this.age,
      required this.weight,
      required this.gender,
      required this.result});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.keyboard_arrow_left,
            color: Colors.white,
            size: 40,
          ),
        ),
        title: const Text(
          'BMI Result',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40,
          ),
        ),
        backgroundColor: const Color(0xFF1A1F38),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Result: ${result.round()}',
              style: const TextStyle(color: Color(0xFF08FF7A), fontSize: 50),
            ),
            Text(
              'Age: $age',
              style: const TextStyle(color: Color(0xFF08FF7A), fontSize: 50),
            ),
            Text(
              'Gender: $gender',
              style: const TextStyle(color: Color(0xFF08FF7A), fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
