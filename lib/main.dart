import 'package:flutter/material.dart';
import 'package:flutter_app/normal_test/scaffoldTest.dart';
import 'package:flutter_app/normal_test/ClipTest.dart';
import 'package:flutter_app/shop_test/pages/EntryPage.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: EntryPage(),
    );
  }
}
