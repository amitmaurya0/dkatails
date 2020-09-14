import 'package:dkatails/colors.dart';
import 'package:dkatails/contants.dart';
import 'package:dkatails/screens/pre_login/schedule_call_screen.dart';
import 'package:dkatails/widgets/main_screen_curve.dart';
import 'package:dkatails/widgets/pre_login/button.dart';
import 'package:dkatails/widgets/pre_login/input_fileds.dart';
import 'package:dkatails/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

class PIScreen extends StatefulWidget {
  PIScreen({Key key}) : super(key: key);

  @override
  _PIScreenState createState() => _PIScreenState();
}

class _PIScreenState extends State<PIScreen> {
  String selectedGoal;
  String selectedMonthlyIncome;
  String selectedMonthlyExpense;
  List<String> goals = ['Car', 'Bike', 'House'];
  List<String> monthlyIncome = ['10000', '15000', '20000', '>20000'];
  List<String> monthlyExpense = ['5000', '7000', '10000', '>10000'];

  void _onNextPress() {
    if (selectedGoal != null &&
        selectedMonthlyIncome != null &&
        selectedMonthlyExpense != null) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ScheduleCallScreen()),
      );
    } else {
      Toast.show("Please select all the options.", context);
    }
  }

  void onGoalChange(String value) {
    setState(() {
      selectedGoal = value;
    });
  }

  void onIncomeChange(String value) {
    setState(() {
      selectedMonthlyIncome = value;
    });
  }

  void onExpenseChange(String value) {
    setState(() {
      selectedMonthlyExpense = value;
    });
  }

  @override
  void initState() {
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
                      completed: 2,
                    ),
                    SizedBox(height: 70.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Personal Information", style: preLoginHeading),
                        Text(
                            "Please fill in the information below and your goal for digital saving.",
                            style: preLoginSubHeading),
                      ],
                    ),
                    InputDropDown(
                        label: "Goal for activation",
                        selectedValue: selectedGoal,
                        items: goals,
                        onChange: onGoalChange),
                    InputDropDown(
                        label: "Monthly Income",
                        selectedValue: selectedMonthlyIncome,
                        items: monthlyIncome,
                        onChange: onIncomeChange),
                    InputDropDown(
                        label: "Monthly Expense",
                        selectedValue: selectedMonthlyExpense,
                        items: monthlyExpense,
                        onChange: onExpenseChange),
                    SizedBox(height: 30.0),
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
