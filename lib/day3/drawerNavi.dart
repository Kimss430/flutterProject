import 'package:flutter/material.dart';
import 'package:untitled/day3/Dialog1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : MyWidget()
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("테스트"), backgroundColor: Colors.blue,),
      body: Container(),
      bottomNavigationBar: BottomAppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.home),
              title : Text("실습 1(다이얼로그)"),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Dialog1(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title : Text("실습2"),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title : Text("실습3"),
              onTap: (){
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}