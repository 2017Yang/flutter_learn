import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'CategoryPage.dart';
import 'MyPage.dart';
import 'SearchPage.dart';
import 'ShopCartPage.dart';

class EntryPage extends StatefulWidget {
  @override
  _EntryPage createState() => _EntryPage();
}

class _EntryPage extends State<EntryPage>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;
  List _pageList=[
    HomePage(),
    CategoryPage(),
    ShopCartPage(),
    SearchPage(),
    MyPage(),
  ];

  @override
  void initState() {
    super.initState();
    // 创建Controller
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( //导航栏
        centerTitle: true,
        title: Text("MAXCO"),
      ),
      body: this._pageList[this._currentIndex],
      bottomNavigationBar: BottomNavigationBar( // 底部导航
        currentIndex: this._currentIndex,
         onTap:(index){
          this.setState((){
            this._currentIndex=index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(icon: Icon(Icons.category), title: Text('分类')),
          BottomNavigationBarItem(icon: Icon(Icons.search), title: Text('发现')),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), title: Text('购物车')),
          BottomNavigationBarItem(icon: Icon(Icons.people), title: Text('我的')),
        ],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
      )
    );
  }
}