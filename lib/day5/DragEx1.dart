import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : DragEx1()
    );
  }
}


class DragEx1 extends StatefulWidget {
  @override
  State<DragEx1> createState() => _DragEx1State();
}

class _DragEx1State extends State<DragEx1> {
  double _x = 0, _y = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
            appBar: AppBar(
                title : Text("드래그")
            ),
            body : Stack(
              children: [
                Positioned(
                  left : _x,
                  top : _y,
                  child: Draggable(
                    feedback: Container(
                        width: 150, height: 150,
                        color : Colors.lightBlue.withOpacity(0.5)
                    ),
                    child: Container(
                        width: 150, height: 150,
                        color : Colors.lightBlue
                    ),
                    onDraggableCanceled: (velocity, offset){
                      // AppBar().preferredSize.height => AppBar의 크기
                      print(MediaQuery.of(context).size.width);
                      print(MediaQuery.of(context).size.height);
                      setState(() {
                        _x = offset.dx;
                        _y = offset.dy - AppBar().preferredSize.height;
                      });
                    },
                  ),
                )
              ],
            )
        )
    );
  }
}