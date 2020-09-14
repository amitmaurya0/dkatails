import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:flutter/material.dart';

const indicatorSize = 50.0;

class ProgressBar extends StatelessWidget {
  final int completed;
  const ProgressBar({Key key, this.completed = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double lizeSize = ((size.width - (50 * 4) - 35) / 3);
    return Container(
      child: Row(
        children: [
          _circle(text: "1", completed: completed > 0),
          _line(size: lizeSize),
          _circle(text: "2", completed: completed > 1),
          _line(size: lizeSize),
          _circle(text: "3", completed: completed > 2),
          _line(size: lizeSize),
          _circle(text: "4", completed: completed > 3),
        ],
      ),
    );
  }
}

Widget _circle({String text, bool completed}) {
  return Container(
    height: indicatorSize,
    width: indicatorSize,
    decoration: BoxDecoration(
      color: completed ? Colors.green : bgGrey,
      border: Border.all(color: Colors.black, width: 1.5),
      borderRadius: BorderRadius.circular(25),
    ),
    child: Center(
        child: Text(text,
            style: TextStyle(fontSize: 22, fontFamily: FONT_FAMILY))),
  );
}

Widget _line({double size}) {
  return Container(
    height: 3.0,
    width: size,
    color: Colors.black,
  );
}
