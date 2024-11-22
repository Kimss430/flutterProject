import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.home),
          backgroundColor: Colors.cyanAccent,
          title: Text(
            "타이틀",
            style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold
          ),),
          actions: [
            Icon(Icons.abc, size: 50,),
            SizedBox(width: 40,),
            Icon(Icons.abc, size: 50,),
            SizedBox(width: 40,)
          ],
        ),
        body: Container(
          width: 300,
          height: 300,
          color: Colors.grey,
          child: Align(
            alignment: Alignment.topRight,
            child: Container(
              margin: EdgeInsets.all(10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.red,
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                    onPressed: (){
                      print("홈");
                    },
                    icon: Icon(
                      Icons.home,
                      color: Colors.blue,
                    )

                ),
                Icon(Icons.menu),
                Icon(Icons.exit_to_app)
              ],
            )

        ),
      ),
    );
  }
}
