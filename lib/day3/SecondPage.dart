import 'package:flutter/material.dart';
import 'SecondPage.dart'; // 이동 하고자 하는 페이지 import

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SecondPage(),
    );
  }
}
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('두 번째 페이지')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // 이전 페이지로 돌아가기
            Navigator.pop(context);
          },
          child: Text('이전 페이지'),
        ),
      ),
    );
  }
}