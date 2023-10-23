import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:calculator/pages/calculator_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(context) {
    return const MaterialApp(
      title: 'Calculator',
      home: CalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
