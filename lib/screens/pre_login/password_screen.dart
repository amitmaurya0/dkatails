import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:dkatails/screens/pre_login/pi_screen.dart';
import 'package:dkatails/widgets/main_screen_curve.dart';
import 'package:dkatails/widgets/pre_login/button.dart';
import 'package:dkatails/widgets/pre_login/input_fileds.dart';
import 'package:dkatails/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:string_validator/string_validator.dart';

import 'package:toast/toast.dart';

const passwordStrengthOne = TextStyle(
    fontSize: 16,
    color: Colors.red,
    fontWeight: FontWeight.w600,
    fontFamily: FONT_FAMILY);
const passwordStrengthTwo = TextStyle(
    fontSize: 16,
    color: Colors.orange,
    fontWeight: FontWeight.w600,
    fontFamily: FONT_FAMILY);
const passwordStrengthThree = TextStyle(
    fontSize: 16,
    color: Colors.yellow,
    fontWeight: FontWeight.w600,
    fontFamily: FONT_FAMILY);
const passwordStrengthFour = TextStyle(
    fontSize: 16,
    color: Colors.lightGreenAccent,
    fontWeight: FontWeight.w600,
    fontFamily: FONT_FAMILY);

const passwordContentLabelText = TextStyle(
    fontSize: 12,
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontFamily: FONT_FAMILY);
const passwordContentText = TextStyle(
    fontSize: 26,
    color: Colors.white,
    fontWeight: FontWeight.w700,
    fontFamily: FONT_FAMILY);
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

class PasswordScreen extends StatefulWidget {
  PasswordScreen({Key key}) : super(key: key);

  @override
  _PasswordScreenState createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  bool passwordVisible = false;
  bool _lowercase = false;
  bool _uppercase = false;
  bool _number = false;
  bool _nineplus = false;
  bool success = false;
  String password = "";
  int strong = 0;
  static final validCharacters = RegExp(r'^[a-zA-Z0-9]+$');
  void _onNextPress() {
    if (success && isAlphanumeric(password)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PIScreen()),
      );
    } else {
      Toast.show("Please enter a valid password.", context);
    }
  }

  bool isDigit(String s, int idx) =>
      "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

  void onTextChange(String value) {
    bool np = false;
    bool hasDigits = false;
    bool hasLowercase = false;
    bool hasUppercase = false;
    int strength = 0;
    if (value.length > 8) {
      np = true;
      strength++;
    }
    var character = '';
    var i = 0;
    while (i < value.length) {
      character = value.substring(i, i + 1);

      if (isDigit(character, 0)) {
        hasDigits = true;
      } else {
        if (character == character.toUpperCase()) {
          hasUppercase = true;
        }
        if (character == character.toLowerCase()) {
          hasLowercase = true;
        }
      }
      i++;
    }
    bool isComplient = hasDigits & hasUppercase & hasLowercase & np;
    if (hasLowercase) strength++;
    if (hasUppercase) strength++;
    if (hasDigits) strength++;
    setState(() {
      strong = strength;
      password = value;
      success = isComplient;
      _nineplus = np;
      _lowercase = hasLowercase;
      _uppercase = hasUppercase;
      _number = hasDigits;
    });
  }

  void onIconPress() {
    setState(() {
      passwordVisible = !passwordVisible;
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
        backgroundColor: primaryBlue,
        appBar: AppBar(
          elevation: 0,
          title: Text("Create Account", style: preLoginTextHeaderStyle),
        ),
        body: Stack(
          children: [
            Container(
                margin: EdgeInsets.only(
                    top: 20.0, left: 15.0, right: 20.0, bottom: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ProgressBar(
                      completed: 1,
                    ),
                    SizedBox(height: 70.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Create Password", style: preLoginHeading),
                        Text("Password will be used to login to account",
                            style: preLoginSubHeading),
                      ],
                    ),
                    _inputFiled(
                        onTextChange: onTextChange,
                        passwordVisible: passwordVisible,
                        onIconPress: onIconPress),
                    SizedBox(height: 30.0),
                    Row(
                      children: [
                        Text("Complexity : ", style: preLoginSubHeading),
                        if (strong == 1)
                          Text("Very Week", style: passwordStrengthOne),
                        if (strong == 2)
                          Text("Week", style: passwordStrengthTwo),
                        if (strong == 3)
                          Text("Medium", style: passwordStrengthThree),
                        if (strong == 4)
                          Text("Strong", style: passwordStrengthFour),
                      ],
                    ),
                    SizedBox(height: 40.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _passwordContent(
                            text: "a", label: "Lowercase", success: _lowercase),
                        _passwordContent(
                            text: "A", label: "Uppercase", success: _uppercase),
                        _passwordContent(
                            text: "123", label: "Number", success: _number),
                        _passwordContent(
                            text: "9+",
                            label: "Characters",
                            success: _nineplus),
                      ],
                    )
                  ],
                )),
            Positioned(
                bottom: 10,
                child: Button(
                  label: "Next",
                  onPressed: _onNextPress,
                ))
          ],
        ));
  }
}

Widget _passwordContent(
    {String text = "", String label = "", bool success = false}) {
  return Column(
    children: [
      success
          ? Icon(
              Icons.check_circle,
              size: 34,
              color: Colors.greenAccent,
            )
          : Text(text, style: passwordContentText),
      Text(label, style: passwordContentLabelText)
    ],
  );
}

Widget _inputFiled(
    {Function onTextChange,
    bool passwordVisible = false,
    Function onIconPress}) {
  return InputContainer(
    child: TextField(
        onChanged: onTextChange,
        keyboardType: TextInputType.emailAddress,
        style: inputTextStyle,
        obscureText: !passwordVisible,
        decoration: InputDecoration(
          hintText: "Create Password",
          hintStyle: inputTextHintStyle,
          suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: primaryBlue,
              ),
              onPressed: onIconPress),
          focusedBorder: OutlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: new BorderRadius.circular(5),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: new BorderSide(color: Colors.white),
            borderRadius: new BorderRadius.circular(5),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
        )),
  );
}
