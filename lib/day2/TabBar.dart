import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
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
            title: const Text("탭바 테스트"),
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: "문제1"),
                Tab(icon: Icon(Icons.search), text: "문제2"),
                Tab(icon: Icon(Icons.person), text: "문제3"),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Tab1Page(),
              Tab2Page(),
              Tab3Page(),
            ],
          ),
        ),
      ),
    );
  }
}

class Tab1Page extends StatelessWidget {
  const Tab1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset("d.jpg"),
    );
  }
}

class Tab2Page extends StatelessWidget {
  const Tab2Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            child: Container(
              color: Colors.yellow,
              child: Center(child: Text("노란 박스")),
            ), flex : 1
        ),
        Flexible(
            child: Container(
              color: Colors.green,
              child: Center(child: Text("초록 박스")),
            ), flex : 2
        ),
      ],
    );
  }
}

class Tab3Page extends StatelessWidget {
  const Tab3Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
            child: Center(child: Text("상단 중앙", style: TextStyle(color: Colors.white))),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 80,
            height: 80,
            color: Colors.green,
            child: Center(child: Text("중앙 왼쪽", style: TextStyle(color: Colors.white))),
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            width: 60,
            height: 60,
            color: Colors.blue,
            child: Center(child: Text("하단 오른쪽", style: TextStyle(color: Colors.white))),
          ),
        ),
      ],
    );
  }
}


// class Tab3Page extends StatelessWidget {
//   const Tab3Page({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Align(
//           alignment: Alignment.topCenter,
//           child: Container(
//             width: 100,
//             height: 100,
//             color: Colors.red,
//             child: Center(
//               child: Text(
//                 "상단 중앙",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.centerLeft,
//           child: Container(
//             width: 80,
//             height: 80,
//             color: Colors.green,
//             child: Center(
//               child: Text(
//                 "중앙 왼쪽",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//         Align(
//           alignment: Alignment.bottomRight,
//           child: Container(
//             width: 60,
//             height: 60,
//             color: Colors.blue,
//             child: Center(
//               child: Text(
//                 "하단 오른쪽",
//                 style: TextStyle(color: Colors.white),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }