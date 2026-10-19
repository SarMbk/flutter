import 'dart:math';

import 'package:flutter/material.dart';

/*
Creating a final object of class random
to only create it once and use it to generaterandom numbers.
See comments inside the rollDice function
*/
final Random randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  // you have to provide this method override
  // it returns a State of a StateFul Widget
  // This is the typical syntax of defining a
  // stateful widget
  // you create 2 classes DiceRoller that extends
  // a stateful widget
  // and a _DiceRollerState where you define a widget
  // with all state variables
  @override
  State<StatefulWidget> createState() {
    return _DiceRollerState();
  }
}

// you create a _DiceRollerState that extends the state of DiceRoller class
// the underscore means that this is a private class
// private to this .dart file only
class _DiceRollerState extends State<DiceRoller> {
  int diceRoll = 1;

  void rollDice() {
    setState(() {
      /**
       * This is inefficient because every time you run rollDice
       * you instantiate a new Random object and then throw it 
       * diceRoll = Random().nextInt(6) + 1;
       * Instead you should create a final object Randomizer
       * totally outside the class only once and use that 
       * object like so
       */
      diceRoll = randomizer.nextInt(6) + 1;
    });
  }

  // You gotta define a build function,
  // basically what this widget is gonna be
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/dice-$diceRoll.png',
            width: 200,
          ),
          const SizedBox(height: 24), // Space between image and button
          ElevatedButton(
            onPressed: rollDice,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.deepPurple,
              backgroundColor: Colors.white,
              textStyle: const TextStyle(fontSize: 24),
            ),
            child: const Text('Roll Dice'),
          ),
        ],
      ),
    );
  }
}
