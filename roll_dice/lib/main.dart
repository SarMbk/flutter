import 'package:flutter/material.dart';
import 'package:roll_dice/gradient_container.dart';

void main() {
  // when defining functions flutter takes named arguments
  // in curly braces e.g. divide({dividend, divisor})

  // to run: in terminal:
  // flutter run -d web-server --web-port 8080
  // then open browser and type in localhost:8080
  // this laptop is too old to compile and run on the emulator

  // to create a project:
  // flutter create project_name

  // ctrl + shif + p

  // This is the most basic webpage without anything there
  // runApp is imported from the material.dart library
  // MaterialApp is a widget class
  // Run app needs an instance of widget as a parameter
  // MaterialApp() is a class constructor method
  // Inside parameters you can press ctrl+space and you will get
  // suggestions for params
  // runApp(const MaterialApp(home: Text('Hello this is Saruar')));

  runApp(
    const MaterialApp(
      home: Scaffold(
        body: GradientContainer(
          colors: [
            Colors.deepPurple,
            Colors.deepPurpleAccent,
            Colors.purple,
          ],
        ),
      ),
    ),
  );
}

/**
 * To add assets such as images to the project you gotta go to 
 * pubspec.yaml and add code to the relative path of the assets
 * like so
 * assets:
    - assets/images/dice-1.png
    - assets/images/dice-2.png
    - assets/images/dice-3.png
    - assets/images/dice-4.png
    - assets/images/dice-5.png
    - assets/images/dice-6.png
 */
