import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          children: [
            ListTile(
              leading: Image.asset("d.jpg"),
              title: Text(
                  "제품명 : 좋은 노트북",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("설명 : 좋은 노트북 입니다."),
                  Text("제시요")
                ],
              ),
              trailing: IconButton(
                  onPressed: (){
                    setState(() {
                      isLiked = !isLiked;
                    });
                  },
                  icon: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border,
                      color: isLiked ? Colors.red : Colors.grey,
                  )
              ),
            )
          ],
        ),
      ),
    );
  }
}
