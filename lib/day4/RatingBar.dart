import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../day3/Dialog1.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home : Scaffold(
            body : Center(
                child: RatingBar.builder(
                    initialRating: 3,
                    minRating: 0.5,
                    allowHalfRating: true,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 50,
                    itemPadding: EdgeInsets.all(10),
                    itemBuilder: (context, index){
                      return Icon(
                        Icons.star,
                        color: Colors.yellow,
                      );
                    },
                    onRatingUpdate: (rating){
                      print(rating);
                    }
                )
            )
        )
    );
  }
}

@override
Widget build(BuildContext context) {
  return Scaffold(
      body : Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Dialog1(),
                ),
              );
            },
          child: Text('페이지 이동'),
        ),
      )
  );
}
