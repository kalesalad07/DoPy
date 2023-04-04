// ignore_for_file: await_only_futures

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

import 'package:dopy/main.dart';
import 'package:dopy/searchid.dart';
import 'package:dopy/rollframe.dart';

class AddID extends StatefulWidget {
  PostgreSQLConnection conn;
  AddID(this.conn);

  State<StatefulWidget> createState() {
    return AddIDState(conn);
  }
}

class AddIDState extends State<AddID> {
  List<List<dynamic>> result = [];

  List<String> rollList = [];

  PostgreSQLConnection conn;
  AddIDState(this.conn);

  final idController = TextEditingController();
  final nameController = TextEditingController();
  String id = '';
  String name = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
                style: ElevatedButton.styleFrom(minimumSize: Size(15, 20)),
                onPressed: getRollList,
                child: const Icon(Icons.refresh, size: 12)),
            RollNoFrame(rollList, updateRoll)
          ],
        ),
        TextField(
          controller: idController,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'ID',
            hintText: 'Enter ID: yyxxxx',
          ),
        ),
        TextField(
          controller: nameController,
          // ignore: prefer_const_constructors
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: 'Name',
            hintText: 'Enter Name',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                id = idController.text;
                name = nameController.text.toUpperCase();
                insertID(id, name);
              },
              child: const Text("Search"),
            ),
            ElevatedButton(onPressed: () {}, child: const Text("Show Current")),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Next Picture"),
            ),
          ],
        ),
        SearchID(result),
      ],
    );
  }

  void insertID(String id, String name) async {
    List<List<dynamic>> temp = [];
    if (id == '' && name == '') {
      temp = [];
    } else {
      temp = await conn.query(
          "select name,idno from messlist where cuteidno like '$id%' AND name like '%$name%'");
    }
    setState(() {
      result = temp;
    });
  }

  void getRollList() async {
    rollList = [];
    List<List<dynamic>> queried =
        await conn.query("select distinct rollno from currentrolls");

    for (final row in queried) {
      setState(() {
        if (!rollList.contains(row[0])) {
          rollList.add(row[0]);
        }
      });
    }
  }

  void updateRoll(String newroll) async {
    print("update row called");
    frame = 1;
    List<List<dynamic>> query = await conn.query(
        "select last_frame from controldesk where rollno like '$newroll'");
    for (final row in query) {
      setState(() {
        frame = max(frame, row[0] as int);
      });
    }
  }
}
