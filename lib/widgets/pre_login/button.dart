import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:flutter/material.dart';

const buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: FONT_FAMILY);

class Button extends StatelessWidget {
  final String label;
  final Function onPressed;
  const Button({Key key, this.label = "", this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(15.0),
      width: size.width - 30,
      height: 60,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(5.0)),
      child: FlatButton(
          onPressed: onPressed, child: Text(label, style: buttonTextStyle)),
    );
  }
}
