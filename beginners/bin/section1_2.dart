import 'dart:io';

import 'package:lesson1_helloworld/beginners.dart' as beginners;

void main() {
  // this prints out to the screen
  print('Hello world: ${beginners.calculate()}!');

  // ---------------------------------------------------------------------------
  /// Booleans

  //bool isOn = true; // this is a variable - something that will change
  var isOn = true;
  print('isOn = $isOn');

  isOn = true;
  print('isOn = $isOn');

  isOn = false;
  print('isOn = $isOn');

  print('isOn is a ${isOn.runtimeType}');

  // ---------------------------------------------------------------------------
  /// Numbers

  num age = 34;

  //Int
  int people = 6;

  //Double
  double temp = 32.06;

  //Parse an int
  int test = int.parse('12');
  print(test);

  //OnError is depreciated - https://docs.flutter.io/flutter/dart-core/int/parse.html
  //int err = int.parse('12.09', onError: (source) => 0);
  //print('err = ${err}');

  var err = int.tryParse('12.09');
  if (err == null)
  {
    print('could not parse!');
  }

  // math
  int dogYears = 7;
  int dogAge = age * dogYears;
  print('Your age in dog years is: $dogAge');

  // ---------------------------------------------------------------------------
  /// Strings

  String hello = 'hello world';

  String name = 'Bryan Cairns';
  print('Hello $name');

  // get a substring
  String firstname = name.substring(0, 5);
  print('firstname = $firstname');

  // get the index of a string
  int index = name.indexOf(' ');
  String lastname = name.substring(index).trim();
  print('lastname = $lastname');

  // Length
  print(name.length);

  // Contains
  print(name.contains('#'));

  // Create a list
  List parts = name.split(' ');
  print(parts);
  print(parts[0]);
  print(parts[1]);

  // ---------------------------------------------------------------------------
  /// Const

  String hello2 = 'Hello';
  const String world = 'World';

  //world = 'Bryan'; <- you can't do this

  print(hello2 + ' ' + world);

  // ---------------------------------------------------------------------------
  /// User input

  stdout.write('What is your name?\r\n');
  String name2 = stdin.readLineSync();

  name2.isEmpty ? stderr.write('Name is empty') : stdout.write('Hello $name2 :) \r\n');

  print('What is your first name?');
  String firstName = stdin.readLineSync();

  print('What is your last name?');
  String lastName = stdin.readLineSync();

  print('Hello $firstName $lastName');
}