import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : SharedWidget()
    );
  }
}

class SharedWidget extends StatefulWidget {
  const SharedWidget({super.key});

  @override
  State<SharedWidget> createState() => _SharedWidgetState();
}

class _SharedWidgetState extends State<SharedWidget> {
  String text = "";
  String? name;
  readData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (value){
                text = value;
              },
            ),
            ElevatedButton(
                onPressed: () async {
                  print(text);
                  final SharedPreferences prefs = await SharedPreferences.getInstance();
                  await prefs.setString('name', text);

                },
                child: Text("저장")
            )
          ],
        ),
      ),
    );
  }
}