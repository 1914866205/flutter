import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Day16 extends StatefulWidget {
  @override
  _Day16State createState() => _Day16State();
}

class _Day16State extends State<Day16> {
  FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    FocusScope.of(context).requestFocus(focusNode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RawKeyboardListener Demo'),
      ),
      //RawKeyBorderListener包裹
      body: RawKeyboardListener(
        //可以监听到的前提是有焦点。我们可以让组件先获取焦点
        focusNode: focusNode,
        onKey: (RawKeyEvent event) {
          //这里是监听Android平台按键，并且是KeyDown事件
          if (event is RawKeyDownEvent &&
              event.data is RawKeyEventDataAndroid) {
            RawKeyDownEvent rawKeyDownEvent = event;
            RawKeyEventDataAndroid rawKeyEventDataAndroid = rawKeyDownEvent
                .data;
            print("keyCode:${rawKeyEventDataAndroid.keyCode}");
            switch (rawKeyEventDataAndroid.keyCode) {
            //这里面的JeyCode值和Android平台的一致
              case 19: //KEY_UP
                break;
              case 20: //KEY_DOWN
                break;
              case 21: //KEY_LEFT
                break;
              case 22: //KEY_RIGHT
                break;
              case 23: //KEY_CENTER
                break;
              default:
                break;
            }
          }
        },
        child: Center(
          child: Text("按键监听"),
        ),
      ),
    );
  }

}