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
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('d.jpg'),
                        ),
                        SizedBox(width: 10),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '홍길동',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'abc@abc.com',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title : Text("홈"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title : Text("설정"),
                  onTap: (){
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title : Text("로그아웃"),
                  onTap: (){
                    Navigator.pop(context);
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


