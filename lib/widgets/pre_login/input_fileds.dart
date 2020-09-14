import 'package:dkatails/contants.dart';
import 'package:flutter/material.dart';

class InputContainer extends StatelessWidget {
  final Widget child;
  const InputContainer({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 40),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 0.4,
                blurRadius: 2,
                offset: Offset(0, 1),
              )
            ]),
        child: child);
  }
}

class InputCustom extends StatelessWidget {
  final String label;
  final String value;
  final Function onTap;
  const InputCustom({Key key, this.label = "", this.value, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InputContainer(
        child: InkWell(
      onTap: onTap,
      child: Container(
        width: size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5.0),
                Text(label, style: optionLabelStyle),
                SizedBox(height: 5.0),
                Text(value == null ? "- Choose Option -" : value,
                    style: optionStyle)
              ],
            ),
            Icon(
              Icons.keyboard_arrow_down,
              color: Colors.grey,
            )
          ],
        ),
      ),
    ));
  }
}

class InputDropDown extends StatelessWidget {
  final String label;
  final String selectedValue;
  final Function onChange;
  final List<String> items;
  const InputDropDown(
      {Key key, this.label = "", this.selectedValue, this.onChange, this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return InputContainer(
        child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Text(label, style: optionLabelStyle),
            SizedBox(height: 5.0),
            Container(
              width: size.width - 80,
              height: 28,
              child: DropdownButton<String>(
                hint: Text("- Choose Option -", style: optionStyle),
                value: selectedValue,
                icon: Icon(Icons.arrow_downward, color: Colors.transparent),
                iconSize: 20,
                elevation: 2,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                ),
                isDense: true,
                onChanged: onChange,
                items: items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value, style: optionStyle),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
        Icon(
          Icons.keyboard_arrow_down,
          color: Colors.grey,
        )
      ],
    ));
  }
}

const optionLabelStyle = TextStyle(color: Colors.grey, fontFamily: FONT_FAMILY);
const optionStyle = TextStyle(
    color: Colors.black,
    fontFamily: FONT_FAMILY,
    fontSize: 18,
    fontWeight: FontWeight.w700);
