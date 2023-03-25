import 'package:flutter/material.dart';
import 'package:review_based_disease_prediction_app/welcomeScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Patients's Assistant App",
      home: WelcomeScreen(),
    );
  }
}
