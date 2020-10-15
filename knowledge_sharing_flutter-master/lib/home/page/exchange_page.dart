import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_sharing/common/common_style.dart';
import 'package:knowledge_sharing/common/constant.dart';
import 'package:knowledge_sharing/home/model/Share.dart';
import 'package:flutter/services.dart';
import 'package:knowledge_sharing/http/api.dart';
import 'package:knowledge_sharing/http/http_util.dart';
import 'package:knowledge_sharing/login/model/toast.dart';

import 'load_page.dart'; //复制到粘贴板

class Exchange extends StatefulWidget {
  Share share;

  Exchange(this.share);

  @override
  _ExchangePageStaet createState() => _ExchangePageStaet(this.share);
}

class _ExchangePageStaet extends State<Exchange> {
  final Share share;

  _ExchangePageStaet(this.share);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("兑换"),
      ),
      body: Column(
        children: <Widget>[
          Text((share.isOriginal == 1 ? "原创" : "转载"),
              style: CommonStyle.font32Dark()),
          Text("标题：" + share.title, style: CommonStyle.font32Dark()),
          Text("作者：" + share.author, style: CommonStyle.font32Dark()),
          Text("价格：" + share.price.toString(), style: CommonStyle.font32Dark()),
          Text("总结：" + share.summary, style: CommonStyle.font32Dark()),
          Text("下载次数：" + share.buyCount.toString(), style: CommonStyle.font32Dark()),
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(2)),
            child: CircleAvatar(
              backgroundImage: NetworkImage(share.cover),
            ),
          ),
          FlatButton(
            color: Constant.mColor,
            padding: EdgeInsets.zero,
            onPressed: () {
              _exchange();
            },
            child: Text("兑换"),
          )
        ],
      ),
    );
  }

  void _exchange() {

    /**
     * 兑换步骤
     * 1.传参  userId，shareId
     * 2.后端返回兑换成功或积分不足    兑换成功后，我的兑换里添加记录
     * 3.兑换成功则跳转到下载页面，积分不足，则只是弹个消息框
     */
    HttpUtil.getRequest(
        Api.exchangeShare, {"userId": Constant.user.id, "shareId": share.id},
        (code, msg, data) {
          print("获取的数据是: " + code.toString());
      if (code==200) {
        share.downloadUrl = data;
        Toast.toast(context, msg: "兑换成功,积分 -" + share.price.toString());
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return LoadPage(share);
          },
        ));
      } else {
        Toast.toast(context, msg: "积分不足，兑换失败");
      }
    }, (error) {
      print("请求出错" + error.toString());
    });
  }
}
