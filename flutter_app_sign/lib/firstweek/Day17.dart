import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class Day17 extends StatefulWidget {
  @override
  _DayState createState() => _DayState();
}

class _DayState extends State<Day17> {
  //定义一个dynamic类型的变量，用于接收数据
  dynamic data;

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio请求接口数据练习'),
      ),
      //判断是否获取到数据，如果没有获取到，则先返回一个空容器，如果在没有获取到数据时直接使用NetworkImage,
      //则会报url不能为空错误
      body: data == null ? Container(
        height: 100,
        width: 100,
      ) : Container(
        height: 400,
        child: Column(
          children: <Widget>[
            Text("请求到的图片是"),
            Container(
              height: 100,
              width: 100,
              child: Image(image: NetworkImage(data['identify']['imageUrl']),
                  fit: BoxFit.cover),
            ),
            Text('等级是：' + data['level'].toString()),
            Text("收听的歌曲有：" + data['listenSongs'].toString() + '首')
          ],
        ),
      ),
    );
  }

  void getData() {
    Dio dio = Dio();
    String url = "http://music.163.com/api/v1/user/detail/1";

    ///Options中可以去设置请求头，请求参数类型等
    /// Options options=Options()
    /// 发送get请求，没有参数直接将queryParameters的值置为null即可，若请求头，参数格式无要求，默认为null即可
    dio.get(url, queryParameters: null, options: null).then((res) {
      //进入回调函数，给data赋值
      setState(() {
        data = res.data;
      });
      //post请求和get请求很像，传统的参数传递从queryParameters变成data(json类型)
      print("***************************************************");
      // print("返回的结果" + data.toString());
      print("返回的结果" + data['identify']['imageUrl'].toString());
      print("***************************************************");
    });
  }

}