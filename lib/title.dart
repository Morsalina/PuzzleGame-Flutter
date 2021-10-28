import 'package:flutter/material.dart';

class MyTitle extends StatelessWidget {
  //const Title({Key? key}) : super(key: key);

  var size;
  MyTitle(this.size);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      padding: EdgeInsets.only(top: 30, left: 5, right: 5,),
      child: Text("Puzzle Game",
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: size.height * .05,
        color: Colors.black,
        decoration: TextDecoration.none,

         ),
      ),

    );
  }
}
