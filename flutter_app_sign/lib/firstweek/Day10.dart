import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day10 extends StatefulWidget {
  @override
  _Day10State createState() => _Day10State();
}

class _Day10State extends State<Day10> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: CustomScrollView(
      // slivers里面放置sliver滚动块组件
      slivers: <Widget>[
        //放置一个顶部的标题栏
        SliverAppBar(
          //是否固定在顶部
          pinned: true,
          //展开高度
          expandedHeight: 250.0,
          //可展开区域，通常是一个FlexibleSpaceBar
          flexibleSpace: FlexibleSpaceBar(
            title: const Text('CustomScrollView'),
            background: Image.network(
              "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=261409204,1345114629&fm=26&gp=0.jpg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        //防止一个SliverGrid Widget
        SliverGrid(
          //设置Grid属性：
          //SliverGridDelegateWithMaxCrossAxisExtent:
          //安照设置最大扩展宽度设计item个数
          //   SliverGridDelegateWithFixedCrossAxisExtent
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            //item最大宽度
            maxCrossAxisExtent: 200.0,
            //主轴item间隔
            mainAxisSpacing: 10.0,
            //交叉辅助item间隔
            crossAxisSpacing: 10.0,
            //item宽高比
            childAspectRatio: 4.0,
          ),
          //设置item布局和属性
          //SliverChildListDelegate 适用于固定数量的item的list
          //SliverChildBuilderDelegate 适用于不同固定数量的item的list
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.center,
                color: Colors.teal[100 * (index % 9)],
                child: Text('grid item $index'),
              );
            },
            //20个item数量
            childCount: 20,
          ),
        ),
        //指定item高度的List
        SliverFixedExtentList(
          //item固定高度
          itemExtent: 50.0,
          //设置item布局和属性
          delegate: SliverChildBuilderDelegate(
              (BuildContext context,int index){
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100*(index%9)],
                  child: Text('list item $index'),
                );
              },
            childCount: 20,
          ),
        )




      ],
    ));
  }
}
