import 'time.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:puzzels/grid.dart';
import 'package:puzzels/move_count.dart';
import 'package:puzzels/time.dart';
import 'menu.dart';
import 'title.dart';

class PuzzleBoard extends StatefulWidget {
  const PuzzleBoard({Key? key}) : super(key: key);

  @override
  _PuzzleBoardState createState() => _PuzzleBoardState();
}

class _PuzzleBoardState extends State<PuzzleBoard> {

  var letters = [0,1, 2, 3, 4, 5, 6, 7, 8, 9,10, 11, 12, 13, 14, 15, 16,17,18,19];
  //var letters = [0, 'A', 'B', 'C', 'D', 'E', 'F','G','H','I'];
  int countOfMove = 0;
  int timeInSecond = 0;
  static const duration = Duration(seconds: 1);
  bool isActive = false;
  Timer? timer;

  @override
  void initState(){
    super.initState();
    letters.shuffle();
  }
  @override
  Widget build(BuildContext context) {
    final sizeOfTitle = MediaQuery.of(context).size;
    timer ??= Timer.periodic(duration, (Timer t) {
        startTime();
      });

    return SafeArea(
        child: Container(
          height: sizeOfTitle.height,
          color: Colors.purple,
          child: Column(
            children: [
              MyTitle(sizeOfTitle),
              Grid(letters, sizeOfTitle, clickGrid),
              Time(timeInSecond),
              MoveCount(countOfMove),
              Menu(resetPuzzle),


            ],
          ),
        )
    );
  }
  void clickGrid(index){

    if(timeInSecond == 0){
      isActive = true;
    }
    if(index-1>=0 && letters[index-1]==0 && index%5 != 0 ||
       index+1 <=19 && letters[index+1]==0 &&(index+1)%5 != 0 ||
        (index-5>=0 && letters[index-5]==0)||
        (index + 5 <21 && letters[index+5]==0 )) {

      setState(() {
        letters[letters.indexOf(0)] = letters[index];
        letters[index] = 0; //this is basically swapping between 0 and letters[index] element

        countOfMove += 1;
      });
    }
    checkWin();
  }

  void startTime() {
    if (isActive) {
      setState(() {
        timeInSecond = timeInSecond + 1;
      });
    }
  }

  bool isSorted(List list){
    var prev = list.first;
    for(var i = 1; i<list.length; i++){
      var next = list[i];
      if(prev > next){
        return false;
      }
      prev = next;
    }
    return true;
  }

  void checkWin(){
    if(isSorted(letters)){
      isActive = false;
      showDialog(
          context: context,
          builder:(context){

            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Container(
                height: 200,
                width: 200,
                child: Column(
                  children: [
                    Text("You've won  the game !",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                    SizedBox(
                      width: 100,
                      child: RaisedButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        child: Text("Close",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                        ),
                      ),
                    )

                  ],
                ),
              ),
            );
          },
          );
    }
  }

  void resetPuzzle() {
    setState(() {
      //print(int.parse(letters[1].toString()));
      letters.shuffle();
      countOfMove = 0;
      timeInSecond = 0;
    });
  }

}
