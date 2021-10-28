import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:puzzels/reset_button.dart';

import 'move_count.dart';

class Menu extends StatelessWidget {
  VoidCallback reset;
  //int moveCount;
  Menu(this.reset);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
         // MoveCount(moveCount),
          Column(
            children: [
              Container(
                padding: EdgeInsets.only(top: 40,left: 150,),
               child: Row(
                 children: [
                   ResetButton(reset),
                 ],
               ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
