import 'package:flutter/material.dart';

import 'package:dopy/main.dart';

class RollNoFrame extends StatefulWidget {
  List<String> rollList = [];
  final Function(String) changeRoll;

  RollNoFrame(this.rollList, this.changeRoll) {
    if (rollList.isEmpty) {
      roll = '-Select-';
    } else if (roll == ' ') {
      roll = rollList[0];
    }
  }

  State<StatefulWidget> createState() {
    return RollNoFrameState();
  }
}

class RollNoFrameState extends State<RollNoFrame> {
  Widget build(BuildContext context) {
    return Row(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DropdownButton<String>(
            value: roll,
            icon: const Icon(Icons.arrow_downward),
            elevation: 16,
            style: const TextStyle(color: Colors.deepPurple),
            underline: Container(
              height: 2,
              color: Colors.deepPurpleAccent,
            ),
            onChanged: (String? value) {
              setState(() {
                roll = value!;
              });
              widget.changeRoll(roll);
            },
            items: rollNo()),
        Text("Frame:$frame")
      ],
    );
  }

  List<DropdownMenuItem<String>> rollNo() {
    List<DropdownMenuItem<String>> items = [];

    for (final row in widget.rollList) {
      items.add(DropdownMenuItem(value: row, child: Text(row)));
    }

    items.add(DropdownMenuItem(value: '-Select-', child: Text('-Select-')));
    return items;
  }
}
