import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day01 extends StatefulWidget {
  @override
  _Day01State createState() => _Day01State();
}

class _Day01State extends State<Day01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            /// 漂浮按钮（带阴影）
            RaisedButton(
              ///阴影属性
              elevation: 10,

              ///滑动阴影
              hoverElevation: 3,
              color: Colors.white,
              child: Text("带阴影"),

              ///单击事件
              onPressed: () {},
            ),

            /// 带边框按钮
            OutlineButton.icon(

                /// 按钮图标
                onPressed: () {},
                icon: Icon(Icons.add),
                label: Text("带边框")),

            /// 扁平按钮
            FlatButton.icon(
                onPressed: () {}, icon: Icon(Icons.info), label: Text("普通按钮")
            ),
            ///自定义组件
            FlatButton(
              ///按钮颜色
              color: Colors.blue,
              ///高光颜色
              highlightColor: Colors.blue[700],
              ///文字颜色主题
              colorBrightness: Brightness.dark,
              ///点击闪烁颜色
              splashColor: Colors.grey,
              child: Text("自定义按钮外观"),
              ///阴影
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
              onPressed: (){},
              ),
          ],
        ),
    ),
    );
  }
}
