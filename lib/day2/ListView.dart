import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // 제품 데이터 예시 (이것을 DB 데이터로 가정)
  final List<Map<String, dynamic>> products = [
    {
      "image": "a.jpg", // 제품 이미지 (이미지 경로)
      "name": "아주좋은 자바 책",
      "price": "20,000원",
      "location": "서울",
    },
    {
      "image": "b.jpg",
      "name": "정말 좋은 오라클 책",
      "price": "25,000원",
      "location": "부산",
    },
    {
      "image": "bb.jpg",
      "name": "HTML/CSS 입문서",
      "price": "15,000원",
      "location": "부평",
    },
    {
      "image": "d.jpg",
      "name": "자바스크립트 마스터",
      "price": "18,000원",
      "location": "대구",
    },
    {
      "image": "a.jpg",
      "name": "Flutter 재밌다",
      "price": "22,000원",
      "location": "서울",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('제품 목록'),
        ),
        body: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];

            return ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image.asset(
                product["image"],
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              title: Text(
                product["name"],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("가격: ${product["price"]}"),
                  Text("판매 위치: ${product["location"]}"),
                ],
              ),
              onTap: () {
                print("선택한 제품: ${product["name"]}");
              },
            );
          },
        ),
      ),
    );
  }
}