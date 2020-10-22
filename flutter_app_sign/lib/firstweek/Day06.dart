import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day06 extends StatefulWidget {
  @override
  _Day06State createState() => _Day06State();
}

class _Day06State extends State<Day06> with SingleTickerProviderStateMixin {
  AnimationController _anomationController;

  @override
  void initState() {
    //动画执行时间3秒。使用动画是必须在类中加上(SingleTickerProviderStateMixin)类
    _anomationController =
        new AnimationController(vsync: this, duration: Duration(seconds: 3));
    //启动动画
    _anomationController.forward();
    //动画监听
    _anomationController.addListener(() => setState(() => {}));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                "不设置value值，自动执行动画",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(height: 10),
              //模糊进度条  会执行一个动画，不设置进度条的value式会执行动画)
              LinearProgressIndicator(
                //进度条背景色
                backgroundColor: Colors.grey[200],
                //进度条颜色
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              SizedBox(
                height: 40,
              ),
              Text("给value指定值",
                  style: TextStyle(color: Colors.black, fontSize: 16)),
              SizedBox(
                height: 10,
              ),
              //进度条显示50%
              LinearProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                //进度条所占百分比
                value: 0.5,
              ),
              //圆形进度条
              SizedBox(height: 20),
              Text(
                "不设置value值，自动执行动画",
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              SizedBox(
                height: 20,
              ),
              //模糊进度条（会执行一个旋转动画）
              CircularProgressIndicator(
                backgroundColor: Colors.grey[200],
                valueColor: AlwaysStoppedAnimation(Colors.blue),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 20,
              ),
              Text("设置指定大小"),
              Container(
                margin: EdgeInsets.only(top: 20),
                height: 80,
                width: 80,
                child: //进度条显示百分之五十，会显示一个半圆,
                    CircularProgressIndicator(
                  backgroundColor: Colors.grey[200],
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                  value: .5, //   0.5
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("设置动画"),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey[200],
                    //从灰色变成蓝色
                    valueColor: ColorTween(begin: Colors.grey, end: Colors.blue)
                        .animate(_anomationController),
                    value: _anomationController.value,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
