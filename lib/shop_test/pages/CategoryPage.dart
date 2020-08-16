import 'package:flutter/material.dart';


/**
 * 分类页
 */
class CategoryPage extends StatefulWidget {
  CategoryPage({Key key}) : super(key: key);

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Text('我是购物车组件');
  }
}