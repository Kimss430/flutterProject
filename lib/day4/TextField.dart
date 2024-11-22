import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : TextFieldWidget()
    );
  }
}

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({super.key});

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body : Center(
          child: TextField(
            onChanged: (value){

            },
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.file_copy),
                labelText: "이메일을 입력하세요.",
                hintText: "hong@flutter.com",
                border : OutlineInputBorder()
            ),
          ),
        )
    );
  }
}