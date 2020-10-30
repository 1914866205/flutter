import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day15 extends StatefulWidget {
  @override
  _Day15State createState() => _Day15State();
}

class _Day15State extends State<Day15> {
  var gestureStatus = 'Gesture';
  var _width = 180.0;
  var _scale = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('触发事件'), primary: true),
      body: Container(
        child: Stack(
            children: <Widget>[

              Center(
                child: GestureDetector(
                  //动态控制宽度，高度自适应
                  child: Image.network(
                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=261409204,1345114629&fm=26&gp=0.jpg",
                    width: _width,
                  ),
                  onScaleStart: (ScaleStartDetails details) {
                    print('onScaleStart:$details.focalPoint');
                  },
                  onTap: () {
                    print("点击时触发");
                  },
                  onLongPress: () {
                    print("长按时触发");
                  },
                  onDoubleTap: () {
                    print("双击时触发");
                  },
                  onHorizontalDragStart: (details) {
                    print("水平滑动时触发");
                  },
                  //缩放变化时触发
                  onScaleUpdate: (ScaleUpdateDetails details) {
                    setState(() {
                      //除了缩放也可以进行旋转操作
                      //details.rotation.clamp(0,360);
                      //缩放倍数在0.5到5倍之间
                      _scale = details.scale.clamp(0.5, 5);
                      _width = 180 * _scale;
                    });
                  },
                ),
              )
            ]
        ),
      ),
    );
  }


}
