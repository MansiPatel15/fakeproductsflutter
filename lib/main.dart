import 'package:fakeproducts/views/home/HomePage.dart';
import 'package:fakeproducts/views/product/ProductView.dart';
import 'package:fakeproducts/views/product/ViewProduct.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: ProductView(),
    );
  }
}

