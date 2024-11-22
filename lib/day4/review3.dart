import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Flexible(
              child: Row(
                children: [
                  Flexible(child: Container(color: Colors.red,), flex: 1,),
                  Flexible(child: Container(color: Colors.blue,),flex: 1,),
                  Flexible(child: Container(color: Colors.black,), flex: 1,)
                ],
              ), flex: 1,),
            Flexible(
              child: Column(
                children: [
                  Flexible(child: Container(color: Colors.yellow,),flex: 1,),
                  Flexible(child: Container(color: Colors.grey,),flex: 1,),
                  Flexible(child: Container(color: Colors.cyanAccent,),flex: 1,),
                ],
              ), flex: 1,)
          ],
        ),
      ),
    );
  }
}
