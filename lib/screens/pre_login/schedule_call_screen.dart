import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:dkatails/screens/pre_login/success_screen.dart';
import 'package:dkatails/widgets/main_screen_curve.dart';
import 'package:dkatails/widgets/pre_login/button.dart';
import 'package:dkatails/widgets/pre_login/input_fileds.dart';
import 'package:dkatails/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toast/toast.dart';

class ScheduleCallScreen extends StatefulWidget {
  ScheduleCallScreen({Key key}) : super(key: key);

  @override
  _ScheduleCallScreenState createState() => _ScheduleCallScreenState();
}

class _ScheduleCallScreenState extends State<ScheduleCallScreen>
    with TickerProviderStateMixin {
  AnimationController animationController;
  DateTime pickedDate;
  TimeOfDay time;
  String displayDate;
  String displayTime;

  void _onNextPress() {
    if (displayDate != null && displayTime != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SuccessScreen()),
      );
    } else {
      Toast.show("Please select a date and time.", context);
    }
  }

  _pickDate() async {
    DateTime date = await showDatePicker(
      context: context,
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: pickedDate,
    );
    if (date != null) {
      var format = new DateFormat.yMMMEd('en_US');
      setState(() {
        displayDate = format.format(date);
        pickedDate = date;
      });
    }
  }

  _pickTime() async {
    TimeOfDay t = await showTimePicker(context: context, initialTime: time);
    if (t != null) {
      final now = new DateTime.now();
      var format = new DateFormat.jm('en_US');
      setState(() {
        displayTime = format.format(
            new DateTime(now.year, now.month, now.day, t.hour, t.minute));
        time = t;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    pickedDate = DateTime.now();
    time = TimeOfDay.now();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )
      ..forward()
      ..repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController.dispose();
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
                      completed: 3,
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 60,
                      width: 60,
                      child: AnimatedBuilder(
                        animation: animationController,
                        builder: (context, child) {
                          return Container(
                            decoration: ShapeDecoration(
                              color: Colors.white.withOpacity(0.5),
                              shape: CircleBorder(),
                            ),
                            child: Container(
                              margin: EdgeInsets.all(
                                  6.0 * animationController.value),
                              child: child,
                            ),
                          );
                        },
                        child: Container(
                          height: 60,
                          width: 60,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: CircleBorder(),
                          ),
                          child: IconButton(
                            onPressed: () {},
                            color: Colors.blue,
                            icon: Icon(Icons.calendar_today, size: 24),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Schedule Video Call", style: preLoginHeading),
                        Text(
                            "Choose the date and time that you prerred. we will send a link via email to make a video call on the scheduled date and time.",
                            style: preLoginSubHeading),
                      ],
                    ),
                    InputCustom(
                        label: "Date", value: displayDate, onTap: _pickDate),
                    InputCustom(
                      label: "Time",
                      value: displayTime,
                      onTap: _pickTime,
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
