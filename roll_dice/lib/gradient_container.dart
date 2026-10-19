import 'package:flutter/material.dart';
import 'package:roll_dice/dice_roller.dart';

// when I define a const variable it becomes a
// compile time constant!
// you can say final Alignment startAlignment = getAlignment();
// in that case the variable is still constant but the value for
// it must be calculated at runtime. i.e. it is not known when the
// code is compiled
// so a const is "faster" than final because it is locked into
// machine code at compile time
const Alignment startAlignment = Alignment.topLeft;
const Alignment endAlignment = Alignment.bottomRight;

class GradientContainer extends StatelessWidget {
  final List<Color> colors;

  // you gotta provide a constructor
  // this synax means:
  // if you call the gradient container and pass it a key,
  // it will pass that key to the superclass StatelessWidget
  // you pass it a colors argument, if none passed then it's an
  // empty vector
  const GradientContainer({super.key, this.colors = const <Color>[]});

  // You gotta define a build function,
  // basically what this widget is gonna be
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
          begin: startAlignment,
          end: endAlignment,
        ),
      ),
      child: const DiceRoller(),
    );
  }
}
