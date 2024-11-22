import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        body: Container(
          height: 100, width: 100,
          // margin: EdgeInsets.fromLTRB(left, top, right, bottom),
          margin: EdgeInsets.all(300),
          padding: EdgeInsets.all(30),
          child: Center(child: Text("박스1")),
          decoration: BoxDecoration(
              color: Colors.blue,
            border: Border.all(
              color: Colors.black,
              width: 3
            ),
            borderRadius: BorderRadius.circular(30)
          ),
        ),
      )
    );
  }
}
