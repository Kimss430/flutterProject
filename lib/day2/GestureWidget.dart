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
  // String text = "기본 텍스트";
  Color color = Colors.blueAccent;
  int type = 1;
  Widget customWidget(){
    Widget? w;
    if(type == 1){
      w = Icon(Icons.home);
    } else if (type == 2){
      w = Image.asset("d.jpg");
    } else {
      w = Container(height: 50, width: 50, color : Colors.red);
    }
    return w;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          // text = "한번 눌렀다";
          color = Colors.green;
          type = 1;
        });
      },
      onDoubleTap: (){
        setState(() {
          // text = "더블 탭 했다";
          color = Colors.red;
          type = 2;
        });
      },
      onLongPress: (){
        setState(() {
          // text = "길게 눌렀다";
          color = Colors.grey;
          type = 3;
        });
      },
      onPanUpdate: (details){
        setState(() {
          // text = "(${details.delta.dx}, ${details.delta.dy})";
        });
      },
      child: Container(
        height: 200, width: 200,
        color: color,
        child: Center(
          child: customWidget(),
        ),
      ),
    );;
  }
}