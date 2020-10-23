import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//容器组件之一 --padding Container ConstrainerBox
class Day07 extends StatefulWidget{
  @override
  _Day07State createState()=>_Day07State();
}
class _Day07State extends State<Day07>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //内边距限制组件
              //fromLTRB-分别指向四个方向填充，all 所有  only 指定方向
              Text("限制内容的边距组件",style: TextStyle(color: Colors.black,fontSize: 20),),
              Padding(
                //所有外边距设置为20
                padding: EdgeInsets.all(20),
                child: Image.asset('assets/image.png',),
              ),
              SizedBox(height: 10,),
              //最常用的，类似vue的div
              Container(
                //外边距
                margin: EdgeInsets.only(top:10.0,left: 120.0),
                //容器大小限制
                constraints:
                BoxConstraints.tightFor(width: 280.0,height: 100.0),
                //装饰
                decoration: BoxDecoration(
                  gradient: RadialGradient(
                    //背景渐变
                    colors: [Colors.red,Colors.orange],
                    center: Alignment.topLeft,
                    radius: .98),
                  boxShadow: [
                    //卡片阴影
                    BoxShadow(
                      color: Colors.black54,
                      offset: Offset(2.0,2.0),
                      blurRadius: 4.0)
                  ]
                  ),
                //卡片倾斜变化
                transform: Matrix4.rotationX(.2),
                //卡片内文字居中
                alignment: Alignment.center,
                child: Text(
                //卡片文字
                  "5.20",style: TextStyle(color: Colors.white,fontSize: 40.0),
                ),
              ),
              SizedBox(height: 80,),
              //限制容器的最大最小值
              ConstrainedBox(
                constraints: BoxConstraints(
                  //宽度最大值
                  maxWidth: 300,
                  maxHeight: 100
                ),
                child: Container(
                  color:Colors.red,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

}