import 'package:flutter/material.dart';
import 'package:flutter_app_sign/firstweek/Day17.dart';
import 'package:flutter_app_sign/firstweek/day12.dart';

import 'firstweek/Day01.dart';
import 'firstweek/Day02.dart';
import 'firstweek/Day03.dart';
import 'firstweek/Day05.dart';
import 'firstweek/Day06.dart';
import 'firstweek/Day07.dart';
import 'firstweek/Day10.dart';
import 'firstweek/Day11.dart';
import 'firstweek/Day13.dart';
import 'firstweek/Day15.dart';
import 'firstweek/Day16.dart';
import 'firstweek/day04.dart';
import 'firstweek/day08.dart';
import 'firstweek/day09.dart';
import 'firstweek/day14.dart';

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
      // home:Day05(),
      // home:Day06(),
      // home:Day07(),
      // home: Day08(),
      // home:FirstPratise(),
      // home:Day10(),
      // home:Day11(),
      // home:Day12(),
      // home:Day13(),
      // home:day14(),
      // home:Day15(),
      // home:Day16(),
      home:Day17(),
    );
  }

}

