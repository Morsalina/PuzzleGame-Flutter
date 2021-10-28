import 'package:flutter/material.dart';

class MoveCount extends StatelessWidget {

  int count;
  MoveCount(this.count);
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 8, top: 20, ),
      child: Text(
        "Move Count: ${count}",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          decoration: TextDecoration.none,
        ),
      ),
    );
  }
}
