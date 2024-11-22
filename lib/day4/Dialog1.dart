import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : DialogWidget()
    );
  }
}

class DialogWidget extends StatelessWidget {
  const DialogWidget({super.key});

  _showDialog(BuildContext context){
    showDialog(
        context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title : Text("다이얼로그 제목!"),
            content: Text("다이얼로그 내용!"),
            actions: [
              TextButton(
                  onPressed: (){},
                  child: Text("동의")
              ),
              TextButton(
                  onPressed: (){},
                  child: Text("확인")
              )

            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Center(
          child: ElevatedButton(
              onPressed: (){
                _showDialog(context);
              },
              child: Text("Dialog")
          ),
        )
    );
  }
}