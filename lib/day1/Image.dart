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
        body: Container(
          height: 300, width: 300,
          child: Image.asset(
            'bb.jpg',
            // fit: BoxFit.cover
          ),
        ),
      ),
    );
  }
}
