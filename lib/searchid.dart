import 'package:flutter/material.dart';

import 'package:dopy/plusminus.dart';

class SearchID extends StatelessWidget {
  List<List<dynamic>> result;
  SearchID(this.result);

  List<TableRow> createTable(List<List<dynamic>> result) {
    List<TableRow> table = [];
    for (int i = 0; i < result.length; i++) {
      table.add(TableRow(
        children: [
          Text(result[i][0]),
          Text(result[i][1]),
          PlusMinus(),
        ],
      ));
    }
    return table;
  }

  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      children: createTable(result),
    );
  }
}
