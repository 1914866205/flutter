import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day03 extends StatefulWidget {
  @override
  _Day03State createState() => _Day03State();
}

class _Day03State extends State<Day03> {
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
              ///加载图片常用的一种方式  asset 工程目录下的图片，File 本地图片 , netWork 网络图片
              Image.asset(
                "images/practices.jpg",
                width: 200,
              ),

              ///圆形图片
              CircleAvatar(
                //头像半径
                radius: 40,
                //头像图片 NetWorkImage网络图片，AssetImage项目资源包图片，FileImage本地图片
                backgroundImage: NetworkImage(
                    'https://avatars3.githubusercontent.com/u/58495771?s=460&u=bb2f820d0cb11cf18fa5a2c787261db55023c0cc&v=4'),
              ),
              Container(
                height: 90,
                width: 90,
                child: ClipOval(
                  child: Image.network(
                    'https://avatars3.githubusercontent.com/u/58495771?s=460&u=bb2f820d0cb11cf18fa5a2c787261db55023c0cc&v=4',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://avatars3.githubusercontent.com/u/58495771?s=460&u=bb2f820d0cb11cf18fa5a2c787261db55023c0cc&v=4'),
                      fit: BoxFit.cover,
                    )
                  ),
                ),
              Container(
                child: Icon(Icons.cake,size: 80,color: Colors.red,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
