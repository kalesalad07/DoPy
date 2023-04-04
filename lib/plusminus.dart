import 'package:flutter/material.dart';

import 'package:dopy/main.dart';

class PlusMinus extends StatefulWidget {
  int number = 0;

  State<StatefulWidget> createState() {
    return PlusMinusState();
  }
}

class PlusMinusState extends State<PlusMinus> {
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
            onPressed: () {
              setState(() {
                widget.number--;
              });
            },
            child: const Text('-')),
        Text(widget.number.toString()),
        ElevatedButton(
            onPressed: () {
              setState(() {
                widget.number++;
              });
            },
            child: const Text('+'))
      ],
    );
  }
}
