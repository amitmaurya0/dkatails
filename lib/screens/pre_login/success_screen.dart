import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:dkatails/widgets/main_screen_curve.dart';
import 'package:dkatails/widgets/pre_login/button.dart';
import 'package:dkatails/widgets/pre_login/input_fileds.dart';
import 'package:dkatails/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class SuccessScreen extends StatefulWidget {
  SuccessScreen({Key key}) : super(key: key);

  @override
  _SuccessScreenState createState() => _SuccessScreenState();
}

class _SuccessScreenState extends State<SuccessScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: primaryBlue,
        appBar: AppBar(
          elevation: 0,
          title: Text("Account Created", style: preLoginTextHeaderStyle),
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
                      completed: 4,
                    ),
                    SizedBox(height: 30.0),
                    Center(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Icon(
                            Icons.check_circle,
                            size: 80,
                            color: Colors.greenAccent,
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                              "Email has been sent successfully to provided email id.",
                              textAlign: TextAlign.center,
                              style: preLoginHeading),
                        ],
                      ),
                    )
                  ],
                )),
          ],
        ));
  }
}
