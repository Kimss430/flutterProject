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
        body: Row(
          children: [
            Flexible(child: Container(color: Colors.red,), flex: 2,),
            Flexible(child: Container(color: Colors.blue,),flex: 1,),
            Flexible(child: Container(color: Colors.black,), flex: 1,)
          ],
        ),
      ),
    );
  }
}
