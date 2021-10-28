import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Time extends StatelessWidget {
  int timeInSecod;
  Time(this.timeInSecod);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 0,top: 20,),
      child: Text("Time Passed:${timeInSecod} s",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
        decoration: TextDecoration.none,
      ),
      ),
    );
  }
}
