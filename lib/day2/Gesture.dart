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
            body : Center(child: GestureWidget())
        )
    );
  }
}

class GestureWidget extends StatefulWidget {
  const GestureWidget({super.key});

  @override
  State<GestureWidget> createState() => _GestureWidgetState();
}

class _GestureWidgetState extends State<GestureWidget> {
  String text = "기본 텍스트";

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          text = "한번 눌렀다";
        });
      },
      onDoubleTap: (){
        setState(() {
          text = "더블 탭 했다";
        });
      },
      onLongPress: (){
        setState(() {
          text = "길게 눌렀다";
        });
      },
      onPanUpdate: (details){
        setState(() {
          text = "(${details.delta.dx}, ${details.delta.dy})";
        });
      },
      child: Container(
        height: 200, width: 200,
        color: Colors.lightBlueAccent,
        child: Center(
          child: Text(text),
        ),
      ),
    );;
  }
}