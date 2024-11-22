import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var txt = "안녕?";
  var align = Alignment.center;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
            body : Align(
              alignment: align,
              child: Container(
                height: 200, width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.cyan,
                  ),
                  child : Text(txt, style : TextStyle(fontSize: 25)),
                  onPressed: (){
                    setState(() {
                      if(txt == '안녕?'){
                        txt = '맨 위로 이동!';
                        align = Alignment.topCenter;
                      } else {
                        txt = '안녕?';
                        align = Alignment.center;
                      }
                    });
                  },
                ),
              ),
            )
        )
    );
  }
}