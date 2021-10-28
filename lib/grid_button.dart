import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GridButton extends StatelessWidget {

  var text;
  VoidCallback click;

  GridButton(this.text, this.click);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        child: Text(text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 30,
        ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        onPressed: click,
    );
  }
}
