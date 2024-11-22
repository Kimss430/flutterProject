import 'package:flutter/material.dart';
import 'SecondPage.dart'; // 이동 하고자 하는 페이지 import

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('첫 번째 페이지')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondPage(),
              ),
            );
          },
          child: Text('페이지 이동'),
        ),
      ),
    );
  }
}

