import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : ThemeEx1()
    );
  }
}


class ThemeEx1 extends StatefulWidget {
  static ValueNotifier<ThemeMode> themeValue
  =  ValueNotifier(ThemeMode.light);
  @override
  State<ThemeEx1> createState() => _ThemeEx1State();
}

class _ThemeEx1State extends State<ThemeEx1> {
  bool _flg = true;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: ThemeEx1.themeValue,
        builder: (context, value, child){
          return MaterialApp(
              title : "test",
              darkTheme: ThemeData.dark(),
              themeMode: value,
              home :Scaffold(
                  appBar: AppBar(title : Text("밝기모드")),
                  body : Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Switch(
                            value: _flg,
                            onChanged: (val){
                              setState(() {
                                _flg = val;
                              });
                              ThemeEx1.themeValue.value =
                              ThemeEx1.themeValue.value == ThemeMode.light
                                  ? ThemeMode.dark
                                  : ThemeMode.light;
                            }
                        ),

                      ],
                    ),
                  )
              )
          );
        }
    );
  }
}