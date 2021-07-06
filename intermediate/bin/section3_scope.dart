import 'package:intermediate/animal2.dart';
import 'package:intermediate/animal3.dart';
import 'package:intermediate/animal4.dart';
import 'package:intermediate/animal5.dart';
import 'package:intermediate/person.dart';

void main() {
  //lesson1_scope();
  //lesson2_private_public();
  //lesson3_getters_setters();
  //lesson4_static();
  lesson5_assignment();
}

void lesson1_scope() {
  var cat = Animal2('fluffy');

  for (var i = 0; i < 10; i ++) {
    print(i);

    if (i < 8) {
      //int i = 5; //valid but causes issues
      if (i > 4) {
        print('i is < 8 and > 4');
      }
    }
  }
}

void lesson2_private_public() {
  var cat = Animal3('fluffy', 16, 'Short Hair');

  cat.breed = 'mixed';
  //cat._name = 'muffin';
  //cat._display('hello');

  cat.sayHello();
  cat.saySomething('meow');
}

void lesson3_getters_setters() {
  var dog = Animal4('Rango', 4);
  dog.name = 'Fiddo'; //setter
  print(dog.name); //getter

  print('Before setter ${dog.age}'); // getter
  dog.age = 5; //setter
  print('After setter ${dog.age}'); //getter
}

void lesson4_static() {
  var cat = Animal5();
  var dog = Animal5();
  var bird = Animal5();
  var fish = Animal5();

  Animal5.run();
}

void lesson5_assignment() {
  var person = Person(43);
  print('The person is ${person.age} years old');

  //person.age = 5; => error
}
