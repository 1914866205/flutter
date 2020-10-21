import 'package:flutter/material.dart';

import 'firstweek/Day01.dart';
import 'firstweek/Day02.dart';
import 'firstweek/Day03.dart';
import 'firstweek/Day05.dart';
import 'firstweek/day04.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //去除右上角debug字样
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      // home:Day01(),
      // home:Day02(),
      // home:Day03(),
      // home:Day04(),
      home:Day05(),
    );
  }

}

