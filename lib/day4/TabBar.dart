import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            // leading: Icon(Icons.home),
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
            bottom: TabBar(
                tabs: [
                  Tab(icon: Icon(Icons.home),),
                  Tab(icon: Icon(Icons.search),),
                  Tab(icon: Icon(Icons.person),),
                ]
            ),
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                    child: Text("zzz"),
                    decoration: BoxDecoration(
                    color: Colors.cyan
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("홈"),
                  onTap: (){
                    print("홈");
                  },
                )
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Container(
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
              Image.asset("d.jpg"),
              Text("3번째 탭~~~")
            ],
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
      ),
    );
  }
}
