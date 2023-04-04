import 'package:flutter/material.dart';
import 'package:postgres/postgres.dart';

import 'id.dart';

final conn = PostgreSQLConnection(
  'containers-us-west-41.railway.app',
  7527,
  'railway',
  username: 'postgres',
  password: 'wK0XZhwL6QCIIjXC5nwr',
);
int frame = 0;
String roll = ' ';

void main() async {
  await conn.open();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // ignore: prefer_const_literals_to_create_immutables
        appBar: AppBar(title: const Text("It's DoPy Bitches!!")),
        body: AddID(conn),
      ),
    );
  }
}
