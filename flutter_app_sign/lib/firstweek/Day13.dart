import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day13 extends StatefulWidget {
  @override
  _Day13State createState() => _Day13State();
}

class _Day13State extends State<Day13> {
  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    //监听滚动时间，打印滚动位置
    _controller.addListener(() {
      //打印滚动条位置
      print(_controller.offset);
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄漏，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("滚动控制"),
        centerTitle: true,
      ),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: 100,
          itemExtent: 50.0, //列表 现高度固定时，显示指定高度是一个好习惯 性能消耗小
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text("当前index的值是：" + "$index"),);
          },
        ),
      ),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          //返回到顶部时执行的动画
          _controller.animateTo(
              .0, duration: Duration(milliseconds: 200), curve: Curves.ease);
        },
      ),
    );
  }
}