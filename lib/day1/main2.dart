import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class  MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : Scaffold(
        appBar: AppBar(title : Text("타이틀")), backgroundColor:Colors.cyanAccent,
        body: Center(
          child: Container(
            height: 100, width: 100, color: Colors.red,
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            children: [
              Icon(Icons.home),
              Icon(Icons.key),
              Icon(Icons.exit_to_app),
            ],
          ),
        ),
      )
    );
  }
}
