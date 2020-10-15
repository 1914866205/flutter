import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_sharing/common/common_style.dart';
import 'package:knowledge_sharing/common/constant.dart';
import 'package:knowledge_sharing/home/model/Share.dart';
import 'package:flutter/services.dart';
import 'package:knowledge_sharing/login/model/toast.dart'; //复制到粘贴板

class LoadPage extends StatefulWidget {
  Share share;

  LoadPage(this.share);

  @override
  _LoadPageStaet createState() => _LoadPageStaet(this.share);
}

class _LoadPageStaet extends State<LoadPage> {
  final Share share;

  _LoadPageStaet(this.share);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("下载"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            padding: EdgeInsets.all(0),
            child: Text(
              "下载地址："+share.downloadUrl==null?"没有地址":share.downloadUrl,
            ),
          ),
          FlatButton(
            color: Constant.mColor,
            padding: EdgeInsets.zero,
            onPressed: () {
              _Copy();
            },
            child: Text("复制到粘贴板"),
          )
        ],
      ),
    );
  }

  void _Copy() {
    Clipboard.setData(ClipboardData(text: share.downloadUrl));
    Toast.toast(context, msg: "已复制到粘贴板");
  }
}
