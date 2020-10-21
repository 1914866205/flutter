import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day04 extends StatefulWidget {
  @override
  _Day04State createState() => _Day04State();
}

class _Day04State extends State<Day04> {
  ///单选按钮的状态
  bool radioSelected = true;

  ///复选按钮的状态
  bool checkboxSelected = true;

  ///焦点
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusNode focusNode3 = FocusNode();

  ///定义一个controller
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  FocusScopeNode focusScopeNode;

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
              Container(
                child: Switch(
                  ///当前状态
                  value: radioSelected,
                  onChanged: (value) {
                    ///切换选择状态
                    setState(() {
                      radioSelected = value;
                    });
                  },
                ),
              ),
              Checkbox(
                ///复选框当前状态
                value: checkboxSelected,
                activeColor: Colors.red,
                onChanged: (value) {
                  setState(() {
                    checkboxSelected = value;
                  });
                },
              ),
              Column(
                children: <Widget>[
                  TextField(

                      ///控制焦点
                      focusNode: focusNode1,

                      ///自动获取焦点
                      autofocus: true,
                      controller: username,
                      decoration: InputDecoration(

                          ///标签提示
                          labelText: "用户名",

                          ///表单内提示
                          hintText: "用户名或邮箱",

                          ///前缀图标
                          prefixIcon: Icon(Icons.person)),

                      ///等同于vue中的input事件
                      onChanged: (v) {
                        setState(() {});
                        print("用户名是》》》》》》》》》》》》" + username.value.text);
                      }),
                ],
              ),
              TextField(
                focusNode: focusNode2,
                controller: password,
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "你的登录密码",

                    ///前缀图标
                    prefixIcon: Icon(Icons.lock)),
                obscureText: true,
              ),
              Text("用户名是：" + username.value.text),
              RaisedButton(
                child: Text("切换焦点"),
                onPressed: () {
                  //将焦点从第一个TextField移到第二个TextField
                  FocusScope.of(context).requestFocus(focusNode2);
                },
              ),
              RaisedButton(
                child: Text("隐藏键盘"),
                onPressed: () {
                  //当所有编辑框都失去焦点时键盘就会收起
                  focusNode1.unfocus();
                  focusNode2.unfocus();
                },
              ),
              Expanded(
                  child:

                      ///设置TextField固定大小
                      Container(
                //外边距
                margin: EdgeInsets.all(10),
                height: 40,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: TextField(
                  ///输入框焦点控制
                  focusNode: focusNode3,

                  ///文本垂直属性
                  textAlignVertical: TextAlignVertical.center,
                  decoration: InputDecoration(
                      hintText: "自定义TextField",

                      ///填充颜色
                      fillColor: Colors.grey,

                      ///是否填充背景色，想要填充，该属性必须是true
                      filled: true,
                      contentPadding: EdgeInsets.only(left: 10),

                      ///设置外边距
                      border: OutlineInputBorder(

                          ///该函数的属性之一， borderSide 设置边框的样式
                          borderSide: BorderSide(color: Colors.red))),
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
