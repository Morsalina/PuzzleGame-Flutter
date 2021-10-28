import 'package:flutter/material.dart';
import 'puzzle_board.dart';

void main() {

  runApp(const PuzzleGame());
}

class PuzzleGame extends StatelessWidget {
  const PuzzleGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Puzzle Game",
      debugShowCheckedModeBanner: false,
      home: PuzzleBoard(),
    );
  }
}
