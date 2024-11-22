import 'package:flutter/material.dart';
import 'package:untitled/day2/ListView.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventWidget(),
    );
  }
}

class EventWidget extends StatefulWidget {
  const EventWidget({super.key});

  @override
  State<EventWidget> createState() => _EventWidgetState();
}

class _EventWidgetState extends State<EventWidget> {
  int number = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("현재 숫자 : $number"),
          SizedBox(height: 30,),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  number++;
                });
              },
              child: Text("증가"))
        ],
      ),
    );
  }
}
