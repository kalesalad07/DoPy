import 'package:flutter/material.dart';

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
          ElevatedButton(
              onPressed: () {},
              child: const Icon(Icons.check, color: Colors.white, size: 24.0),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green))),
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
