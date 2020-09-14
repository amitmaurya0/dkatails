import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:dkatails/screens/pre_login/password_screen.dart';
import 'package:dkatails/widgets/main_screen_curve.dart';
import 'package:dkatails/widgets/pre_login/input_fileds.dart';
import 'package:dkatails/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';
import 'package:toast/toast.dart';

const bigHeadingBlack = TextStyle(
    fontSize: 42, fontWeight: FontWeight.w700, fontFamily: FONT_FAMILY);
const bigHeadingBlue = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.w700,
    color: Colors.blueAccent,
    fontFamily: FONT_FAMILY);
const contentStyle = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w700, fontFamily: FONT_FAMILY);
const inputTextHintStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.grey,
    fontFamily: FONT_FAMILY);
const inputTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontFamily: FONT_FAMILY);
const buttonTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontFamily: FONT_FAMILY);

class MainScreen extends StatefulWidget {
  MainScreen({Key key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  String email = "";
  void _onNextPress() {
    if (isEmail(email)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PasswordScreen()),
      );
    } else {
      Toast.show("Please enter a valid email.", context);
    }
  }

  void onTextChange(String value) {
    setState(() {
      email = value;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgGrey,
        appBar: null,
        body: Stack(
          children: [
            MainScreenCurve(),
            Padding(
              padding: const EdgeInsets.fromLTRB(
                  15.0, CURVE_HEIGHT - 160, 15.0, 8.0),
              child: ProgressBar(),
            ),
            Container(
                margin: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0, top: CURVE_HEIGHT),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Welcome To", style: bigHeadingBlack),
                        Row(
                          children: [
                            Text("GIN", style: bigHeadingBlack),
                            Text(" FINANS", style: bigHeadingBlue),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 20.0),
                    Text("Welcome to The Bank of The Future.",
                        style: contentStyle),
                    Text("Manage and track your accounts on the go.",
                        style: contentStyle),
                    _inputFiled(onTextChange: onTextChange),
                    SizedBox(height: 20.0),
                  ],
                )),
            Positioned(
                bottom: 10,
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  width: size.width,
                  height: 90,
                  child: FlatButton(
                      color: primaryBlue,
                      onPressed: _onNextPress,
                      child: Text("Next", style: buttonTextStyle)),
                ))
          ],
        ));
  }
}

Widget _inputFiled({Function onTextChange}) {
  return InputContainer(
    child: TextField(
        onChanged: onTextChange,
        keyboardType: TextInputType.emailAddress,
        style: inputTextStyle,
        decoration: InputDecoration(
          hintText: "Email",
          hintStyle: inputTextHintStyle,
          prefixIcon: Icon(
            Icons.email,
            size: 24,
            color: Colors.black,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: new BorderRadius.circular(5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: new BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          isDense: true,
          filled: true,
          fillColor: bgGrey,
        )),
  );
}
