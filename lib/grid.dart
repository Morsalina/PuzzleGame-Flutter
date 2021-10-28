import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'grid_button.dart';

class Grid extends StatelessWidget {
  //const Grid({Key? key}) : super(key: key);

  var letters = [];
  var size;
  Function clickGrid;

  Grid(this.letters, this.size, this.clickGrid);

  @override
  Widget build(BuildContext context) {
    var h = size.height;

    return Container(
      height: h * 0.60,
      padding: EdgeInsets.only(top: 60),
      child: Padding(
        padding: EdgeInsets.all(10.0),

        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              mainAxisSpacing: 6,
              crossAxisSpacing: 6,

            ),
            itemCount: letters.length,
            itemBuilder : (context, index){
              return letters[index] != 0 ?
              GridButton("${letters[index]}", (){
                clickGrid(index);
              }) : SizedBox.shrink();
            }

        ),
      ),

    );
  }
}
