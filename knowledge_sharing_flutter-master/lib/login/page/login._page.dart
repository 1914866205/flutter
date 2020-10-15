import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:knowledge_sharing/common/common_style.dart';
import 'package:knowledge_sharing/common/constant.dart';
import 'package:knowledge_sharing/home/page/initial_page.dart';
import 'package:knowledge_sharing/http/api.dart';
import 'package:knowledge_sharing/http/http_util.dart';
import 'package:knowledge_sharing/login/model/token.dart';
import 'package:knowledge_sharing/login/model/user.dart';
import 'package:knowledge_sharing/util/sp_util.dart';
/// 登录页
class LoginPage extends StatefulWidget {
  ///创建一个登陆页
  @override
  _LoginPageState createState() => _LoginPageState();
}
 ///登陆页 页面
class _LoginPageState extends State<LoginPage> {
  ///账号          文本编辑
  TextEditingController _account = TextEditingController();

  ///密码
  TextEditingController _password = TextEditingController();

  ///页面构建
///将我们的构建函数拆分到多个 Widgets中。分别引入新的 BuildContext 来获取 Scaffold.
  @override
  Widget build(BuildContext context) {            ///Everything’s a Widget   widget是flutter功能的抽象描述
    ///布局的容器
    return Scaffold(
      ///body：当前界面所显示的主要内容
      body: Container(
        /**
         * BoxDecoration类提供了多种绘制盒子的方法。
            这个盒子有边框、主体、阴影组成。
         */
        decoration: BoxDecoration(
          /// 装饰 图片
            image: DecorationImage(
          image: AssetImage("images/bg.jpg"),
          fit: BoxFit.fill,
        )), child: Column(
          mainAxisAlignment: MainAxisAlignment.center,            ///主轴  row  居中
          crossAxisAlignment: CrossAxisAlignment.center,          ///交叉轴  column 居中
          children: <Widget>[
            Text(
              "知识分享",
              style: TextStyle(
                  color: Color(0xFF3d8d69),
                  fontSize: 36,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 60),  ///用作内边距的 SizedBox
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text(
                  "账号:",
                  style: CommonStyle.font32White(),
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 300,
                  child: TextField(
                    controller: _account,
                    style: TextStyle(
                      color: Constant.white
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Text("密码:", style: CommonStyle.font32White()),
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: 30,
                  width: 300,
                  child: TextField(
                    controller: _password,
                    style: TextStyle(color: Constant.white),
                  ),
                )
              ],
            ),
            Container(
              /**
               * EdgeInsets
                  fromLTRB(double left, double top, double right, double
                  bottom)：分别指定四个方向的填充。
                  all(double value) : 所有方向均使用相同数值的填充。
                  only({left, top, right ,bottom })：可以设置具体某个方向的填充(可以同时指定多个方向)。
                  symmetric({vertical, horizontal})：用于设置对称方向的填充，vertical指top和bottom，horizontal指left和right。
               */
              margin: EdgeInsets.only(top: 40),
              width: 350,
              height: 40,
              child: FlatButton(
                color: Constant.mColor,
                padding: EdgeInsets.all(0),
                onPressed: () {
                  _login();
                },
                child: Text("登录"),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _login() {
    ///  方法名（地址，请求体，响应体）{返回后执行代码块}
    HttpUtil.request(
        Api.login, {"account": _account.text, "password": _password.text},
        (code, msg, data) {
      if (code == 0) {
        print("data==========="+data.toString());
        User user = User.fromJson(data['user']);
        SpUtil.putObject("user", user.toString());
        print("user==============="+user.avatarUrl);
        Constant.user.id=user.id;
        Constant.user.wxId=user.wxId;
        Constant.user.wxNickname=user.wxNickname;
        Constant.user.roles=user.roles;
        Constant.user.avatarUrl=user.avatarUrl;
        Constant.user.createTime=user.createTime;
        Constant.user.updateTime=user.updateTime;
        Constant.user.bonus=user.bonus;
        Token token=Token.fromJson(data["token"]);
        Constant.token=token;
        print("token==============="+Constant.token.token);
        /// 跳转路由
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return InitialPage();
          },
        ));
      }
    }, (error) => null);
  }
}
