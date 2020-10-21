import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Day05 extends StatefulWidget {
  @override
  _Day05State createState() => _Day05State();
}

class _Day05State extends State<Day05> {
  TextEditingController _usernameController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Form Test"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
        child: Form(
          //设置globalKey，便于后面获取FormState
          key: _formKey,
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                autofocus: true,
                controller: _usernameController,
                decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    icon: Icon(Icons.person)),
                //校验用户名
                validator: (v) {
                  return v.trim().length > 0 ? null : "用户名不能为空";
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  icon: Icon(Icons.lock)
                ),
                //校验密码
                validator: (v){
                  //v为当前输入框的内容
                  return v.trim().length>5?null:"密码不能少于6位";
                },
              ),
              //登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("登录"),
                        color:Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        onPressed: (){
                          /**
                           * 这里补码通过此方式获取FormState.content
                           * 通过_formKey.currentState 获取FormState
                           * 调用calidate()方法校验用户名密码是否合法。校验
                           * 通过后再提交表单
                           */
                          if((_formKey.currentState as FormState).validate()){
                            print("验证通过，提交表单");
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
