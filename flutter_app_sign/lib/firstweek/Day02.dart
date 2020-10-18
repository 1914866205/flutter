import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day02 extends StatefulWidget {
  @override
  _Day02State createState() => _Day02State();
}

class _Day02State extends State<Day02> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                /// 文本组件
                Text(
                  "Hello world" * 10,

                  ///文字左对齐（left,center,right）
                  textAlign: TextAlign.left,

                  ///限制行数
                  maxLines: 1,

                  ///文字溢出， ellipsis-用省略号代替溢出文字， clip----裁剪溢出文字，hade_隐藏溢出文字
                  overflow: TextOverflow.ellipsis,

                  ///文字缩放
                  textScaleFactor: 1.5,
                ),

                ///文本样式组件
                Text(
                  "TextStyle pratise",
                  style: TextStyle(

                      ///文本样式
                      color: Colors.blue,
                      fontSize: 18.0,
                      height: 1.2,

                      ///文本字体
                      fontFamily: "Courier",
                      background: new Paint()..color = Colors.yellow,

                      ///修饰器，字下加线
                      decoration: TextDecoration.underline,

                      ///修饰器样式
                      decorationStyle: TextDecorationStyle.dashed),
                ),

                ///富文本 做评论回复的时候，会用到
                Text.rich(TextSpan(children: [
                  TextSpan(
                      text: "王二锋",
                      style: TextStyle(fontSize: 24, color: Colors.black12)),
                TextSpan(
                  text: "陶大新",
                  style: TextStyle(fontSize: 24,color: Colors.grey)
                ),
                  TextSpan(
                    text: "涛涛",
                    style: TextStyle(color: Colors.yellow,fontSize: 24)
                  ),
                  TextSpan(
                    text: "flutter套娃大法",
                    style: TextStyle(color: Colors.blue,fontSize: 24)
                  )
                ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
