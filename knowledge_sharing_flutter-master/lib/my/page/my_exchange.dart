import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_sharing/common/common_style.dart';
import 'package:knowledge_sharing/common/constant.dart';
import 'package:knowledge_sharing/home/model/Share.dart';
import 'package:knowledge_sharing/home/widget/list_item.dart';
import 'package:knowledge_sharing/http/api.dart';
import 'package:knowledge_sharing/http/http_util.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 我的兑换
class MyExchange extends StatefulWidget {
  @override
  _MyExchangeStaet createState() => _MyExchangeStaet();
}

class _MyExchangeStaet extends State<MyExchange> {
  List<Share> exchangeList = List<Share>();

  int pageIndex = 0;
  int pageSize = 10;

  @override
  void initState() {
    getSharesByUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("我的兑换", style: CommonStyle.title(),),
        backgroundColor: Constant.mColor,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.w),
        child: ListItem(exchangeList),
      ),
    );
  }

  Future<void> getSharesByUserId() async {
    HttpUtil.getRequest( Api.getMyShareInfo, {"userId":Constant.user.id},(code, msg, data) {
      print("sharelist" + data.toString());
      if (code == 200) {
        /**
         * I/flutter (21152): null
            E/flutter (21152): [ERROR:flutter/lib/ui/ui_dart_state.cc(157)] Unhandled Exception: NoSuchMethodError: The method '[]' was called on null.
            E/flutter (21152): Receiver: null
            E/flutter (21152): Tried calling: []("id")
            E/flutter (21152): #0      Object.noSuchMethod (dart:core-patch/object_patch.dart:53:5)

         */
        // for (int i = 0; i < data.length-1; i++) {
        //   print("******************************************************************************");
        //   print(data[i].toString());
        //
        //   Share share = Share.fromJson(data[i]);
        //   exchangeList.add(share);
        //   print("******************************************************************************");
        // }
        int i=0;
        while(data[i]!=null){
          Share share = Share.fromJson(data[i]);
          exchangeList.add(share);
          i++;
        }


        setState(() {});
      } else {
        print("请求异常>>>>>" + msg);
      }
    }, (error) {
      print("请求出错" + error.toString());
    });

  }
}
