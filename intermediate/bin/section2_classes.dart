import 'package:intermediate/myclass.dart';
import 'package:intermediate/animal.dart';
import 'package:intermediate/dog.dart';
import 'package:intermediate/employee.dart';

void main() {
  //lesson1_classes();
  //lesson2_class_constructors();
  //lesson3_this();
  lesson4_assignment();
}

void lesson1_classes() {
  var mine = MyClass();
  var yours = MyClass();

  mine.sayHello('Matheus');
  yours.sayHello('Cookies');
}

void lesson2_class_constructors() {
  var cat = Animal('bob');
  var dog = Animal('frank');

  cat.sayHello();
  dog.sayHello();
}

void lesson3_this() {
  var bob = Dog(6, 'Bob');

  print('${bob.name} is ${bob.ageInDogYears()} dog years old ');
}

void lesson4_assignment() {
  var emp1 = Employee('Bryan', 'Cashier');
  var emp2 = Employee('Heather', 'Cook');

  emp1.sayHello();
  emp2.sayHello();
}
