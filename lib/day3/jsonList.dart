import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<dynamic> list = [];

  @override
  void initState() {
    fnList();
  }

  fnList() async{
    final res = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    // print("res ==> ${res.body}");
    if(res.statusCode == 200){
      setState(() {
        list = json.decode(res.body);
      });
    } else {
      // 실패했다.
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView.builder(
            itemCount: list.length,
            itemBuilder: (context, index){
              return ListTile(
                title: Text(list[index]["name"]),
              );
            }
        ),
      ),
    );
  }
}
