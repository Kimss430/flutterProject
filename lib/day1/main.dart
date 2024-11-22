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
        appBar: AppBar(
          // leading:  Icon(Icons.menu),
          title : Text("첫번째 화면"),
          backgroundColor: Colors.cyanAccent,
          actions: [
            Icon(Icons.home, size: 40, color: Colors.red,),
            SizedBox(width: 50,),
            Icon(Icons.key, size: 40, color: Colors.red,),
            SizedBox(width: 50,),
            Icon(Icons.favorite, size: 40, color: Colors.red,),
            SizedBox(width: 50,),
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue
                  ),
                  child: Text("메뉴")
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text("홈"),
                onTap: (){
                  print("홈으로 이동");
                },
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("설정"),
                onTap: (){
                  print("설정으로");
                },
              )
            ],
          ),
        ),
        // Row(children[여러게 가능])
        body : Align(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("메롱", style: TextStyle(color: Colors.red, fontSize: 26,)),
              Icon(Icons.exit_to_app, color: Colors.blue,),
              ElevatedButton(
                  onPressed: (){}, child: Text("저장")
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row (
            // mainAxisAlignment 정렬기능
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: (){
                    print("홈 버튼 클릭!");
                  },
                  icon: Icon(Icons.home)
              ),
              Icon(Icons.key),
              Icon(Icons.exit_to_app),
            ]
          )
        ),
      )
    );
  }
}


