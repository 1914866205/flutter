import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day11 extends StatefulWidget {
  @override
  _Day11State createState() => _Day11State();
}

class _Day11State extends State<Day11> {
  List<String> list = List();

  @override
  void initState(){
    super.initState();
    _getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView的使用"),
        centerTitle: true,
      ),
      body: ListView.builder(
        /// listview子组件个数
        itemCount: list.length,

        /// 构建了组件，可返回任意Widget类型的组件 index为List的下标
        itemBuilder: (context, index) {
          return ListTile(
            //设置ListTile组件开头，构建圆形头像
            leading: CircleAvatar(
              //圆形组件的半径
              radius: 30,
              //背景图
              backgroundImage: NetworkImage(list[index]),
            ),
            //listTile组件的标题
            title: Text("测试数据" + (index + 1).toString()),
            //listTile组件的附表图
            subtitle: Text("副标题"),
            //设置listTitle组件结尾
            trailing: FlatButton(
                onPressed: () {},
                color: Color(0xFF2196f3),
                child: Text(
                  "详情",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                )),
          );
        },
      ),
    );
  }
    void _getData(){
    int i=0;
    while(i++<20){
      list.add("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=261409204,1345114629&fm=26&gp=0.jpg");
    }
    setState(() {
    });
    }
}
