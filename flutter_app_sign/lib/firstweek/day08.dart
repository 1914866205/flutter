import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day08 extends StatefulWidget {
  @override
  _Day08State createState() => _Day08State();
}

class _Day08State extends State<Day08> {
  int _selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //顶部导航栏
      appBar: AppBar(
        //导航栏标题
        title: Text("Tabbar"),
        //标题是否居中
        centerTitle: true,
        actions: <Widget>[
          //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.share),
            onPressed: () {},
          )
        ],
      ),
      //底部导航
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.business), title: Text('Business')),
          BottomNavigationBarItem(
              icon: Icon(Icons.school), title: Text('School')),
        ],

        ///选中的tab索引
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        //点击事件
        onTap: _onItemTapped,
      ),
      // scafforld的中间一块区域
      body: Center(
        child: Container(
          alignment: Alignment.center,
          child: Text("scaffold的body"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          //右下角的悬浮按钮
          child: Icon(Icons.add),
          onPressed: _onAdd),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {}
}
