import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('스낵바 예시')),
        body: SnackBarDemo(),
      ),
    );
  }
}

class SnackBarDemo extends StatelessWidget {
  void _showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      content: Text('스낵바 메시지입니다!'),
      action: SnackBarAction(
        label: '닫기',
        onPressed: () {
        },
      ),
      duration: Duration(seconds: 3), // 표시 시간
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: () => _showSnackBar(context),
        child: Text('스낵바'),
      ),
    );
  }
}