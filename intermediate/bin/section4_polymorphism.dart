import 'package:intermediate/section4_lesson1/feline.dart';
import 'package:intermediate/section4_lesson2/monster.dart';
import 'package:intermediate/section4_lesson3/manager.dart';
import 'package:intermediate/section4_lesson4/racecar.dart';
import 'package:intermediate/section4_lesson5/bnb.dart';

void main() {
  //lesson1_inheritance();
  //lesson2_mixins();
  //lesson3_interfaces();
  //lesson4_abstraction();
  lesson5_assignment();
}

void lesson1_inheritance() {
  var cat = Feline();
  cat.breath();
  cat.test();
}

void lesson2_mixins() {
  var ugly = Monster();
  ugly.test();
}

void lesson3_interfaces() {
  var bob = Manager();
  bob.test();
}

void lesson4_abstraction() {
  var rc = RaceCar();
  rc.honk();
}

void lesson5_assignment() {
  var weekend = Bnb();
  weekend.ringDoorBell();
}
