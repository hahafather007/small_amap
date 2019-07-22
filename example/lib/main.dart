import 'package:flutter/material.dart';
import 'package:small_amap/small_amap.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: AmapView(
          apiKey: "3c82ba122f8da690a88bd2f4aca44dd3",
        ),
      ),
    );
  }
}
