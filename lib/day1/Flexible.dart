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
        body: Row(
          children: [
            // Flexible : 공간 할당
            // Flexible(child: Container(color: Colors.blue), flex: 1),
            // Flexible(child: Container(color: Colors.red), flex: 2),
            // Flexible(child: Container(color: Colors.green), flex: 3),
            // Expanded : 200을 제외한공간 차지
            Expanded(child: Container(color: Colors.blue), flex: 1),
            Container(width:200, color: Colors.red),
          ],
        ),
      ),
    );
  }
}
