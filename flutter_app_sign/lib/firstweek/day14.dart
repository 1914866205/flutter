import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class day14 extends StatefulWidget {
  @override
  _Day14State createState() => _Day14State();
}

class _Day14State extends State<day14> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('日历'), primary: true),
      body: DataTable(
        //行
        rows: <DataRow>[
          //每行内容设置
          DataRow(cells: <DataCell>[
            //子表格单元，子表格单元格中可以任意防止widget
            DataCell(Text('1月'), onTap: onTap),
            DataCell(Text('2月'), onTap: onTap),
            DataCell(Text('3月'), onTap: onTap),
          ]),
          DataRow(cells: <DataCell>[
            //子表格单元，子表格单元格中可以任意防止widget
            DataCell(Text('4月'), onTap: onTap),
            DataCell(Text('5月'), onTap: onTap),
            DataCell(Text('6月'), onTap: onTap),
          ]),
          DataRow(cells: <DataCell>[
            //子表格单元，子表格单元格中可以任意防止widget
            DataCell(Text('7月'), onTap: onTap),
            DataCell(Text('8月'), onTap: onTap),
            DataCell(Text('9月'), onTap: onTap),
          ]),
          DataRow(cells: <DataCell>[
            //子表格单元，子表格单元格中可以任意防止widget
            DataCell(Text('10月'), onTap: onTap),
            DataCell(Text('11月'), onTap: onTap),
            DataCell(Text('12月'), onTap: onTap),
          ]),
        ],
        //列
        columns: <DataColumn>[
          DataColumn(label: Text('DataColumn')),
          DataColumn(label: Text('DataColumn')),
          DataColumn(label: Text('DataColumn')),
        ],
      ),
    );
  }

  void onTap() {
    print('data onTap');
  }
}
