import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:knowledge_sharing/common/common_style.dart';
import 'package:knowledge_sharing/common/constant.dart';

class ContributionPage extends StatefulWidget {
  @override
  _ContributionPageState createState() => _ContributionPageState();
}

class _ContributionPageState extends State<ContributionPage>
    with WidgetsBindingObserver {
  bool _switchSelected = true; //维护单选开关状态
  FocusNode titleNode = FocusNode();
  FocusNode authorNode = FocusNode();
  FocusNode priceNode = FocusNode();
  FocusNode introductionNode = FocusNode();
  FocusNode addressNode = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Constant.mColor,
        title: Text(
          "投稿",
          style: CommonStyle.title(),
        ),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20.w),
            child: Text(
                "说明: 投稿审核通过后会有积分奖励: 资源被下载会有积分奖励; 提交的资源不得包含广告、侵权信息, 百度网盘地址建议由密码",
                style: CommonStyle.textTitleLightBold()),
          ),
          _buildRadioWidget(),
          _buildForm()
        ],
      ),
    );
  }

  Widget _buildRadioWidget() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.w),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("原创", style: CommonStyle.font32Dark()),
                  Radio(
                    groupValue: true,
                    value: _switchSelected,
                    onChanged: (value) {
                      setState(() {
                        _hideKeyboard();
                        _switchSelected = true;
                      });
                    },
                  )
                ],
              ),
              CommonStyle.divider,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("转载", style: CommonStyle.font32Dark()),
                  Radio(
                    groupValue: false,
                    value: _switchSelected,
                    onChanged: (value) {
                      setState(() {
                        _hideKeyboard();
                        _switchSelected = false;
                      });
                      print(
                          "_switchSelected的值是>>>" + _switchSelected.toString());
                    },
                  ),
                ],
              ),
              CommonStyle.divider,
            ],
          ),
        ),
      ],
    );
  }

  ///创建form表单
  Widget _buildForm() {
    return Expanded(
        child: Column(
      children: <Widget>[
        _buildFormItem("标题", "请输入标题", titleNode),
        CommonStyle.divider,
        _buildFormItem("作者", "请输入作者", authorNode),
        CommonStyle.divider,
        _buildFormItem("价格", "请输入价格", priceNode),
        CommonStyle.divider,
        _buildFormItem("简介", "介绍一下技术干货吧", introductionNode),
        CommonStyle.divider,
        _buildFormItem("下载地址", "请输入下载地址", addressNode),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 100.w,
          child: RaisedButton(
            color: Constant.mColor,
            onPressed: () {
              _hideKeyboard();
            },
            child: Text(
              '提交',
              style: CommonStyle.font32White(),
            ),
          ),
        ),
      ],
    ));
  }

  Widget _buildFormItem(String name, String hitText, FocusNode currentNode) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20.w),
          child: Text(name, style: CommonStyle.font32Dark()),
          width: 160.w,
          height: 100.w,
          alignment: Alignment.centerLeft,
        ),
        Expanded(
          child: Container(
            height: 100.w,
            child: TextField(
              focusNode: currentNode,
              decoration: InputDecoration(
                  hintText: hitText,
                  hintStyle: CommonStyle.font32Grey(),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 40.w)),
            ),
          ),
        )
      ],
    );
  }

  ///收起键盘
  void _hideKeyboard() {
    setState(() {
      titleNode.unfocus();
      authorNode.unfocus();
      priceNode.unfocus();
      introductionNode.unfocus();
      addressNode.unfocus();
    });
  }
}
