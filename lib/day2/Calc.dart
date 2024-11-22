import 'package:flutter/material.dart';

void main() {
  runApp(Calculator());
}
class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '계산기',
      home: Calc(),
    );
  }
}

class Calc extends StatefulWidget {
  @override
  _Calculator createState() => _Calculator();
}

class _Calculator extends State<Calc> {

  Widget btn(String label) {
    return Container(
      decoration : BoxDecoration(
          color : (label == '+' || label == '-' || label == '×' || label == '÷' || label == '=') ? Colors.blue : Colors.grey[200],
          borderRadius: BorderRadius.circular(10)
      ),
      child: Center(child: Text(label, style: TextStyle(fontSize: 25))),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('계산기'), backgroundColor: Colors.cyan,),
      body: Column(
        children: [
          Flexible(
            child: Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.bottomRight,
              child: Text('0', style: TextStyle(fontSize: 25)),
            ), flex: 1,
          ),
          Flexible(
            child: GridView.builder(
              padding: EdgeInsets.all(8),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemCount: 20,
              itemBuilder: (context, index) {
                List<String> labels = [
                  'C', '(', '%', '÷',
                  '7', '8', '9', '×',
                  '4', '5', '6', '-',
                  '1', '2', '3', '+',
                  '0', '00', '.', '='
                ];
                return btn(labels[index]);
              },
            ), flex: 9,
          ),
        ],
      ),
    );
  }
}