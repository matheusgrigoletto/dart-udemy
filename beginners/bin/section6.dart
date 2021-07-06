import 'dart:io';

void main() {
  lesson_exceptions();
  lesson_try_catch_finally();
  lesson_throwing_exception();

  lesson_assignment();
}

void lesson_exceptions() {
  //Error is a program failure
  //Exemption - can be handled

  int age;
  var dogYears = 7;

  print(age * dogYears);
}

void lesson_try_catch_finally() {
  try {
    int age;
    var dogYears = 7;

    print(age * dogYears);
  }
  on NoSuchMethodError {
    print('Sorry that\'s not going to happen');
  }
  catch (e) {
    print('There was an error: ${e.toString()}');
  }
  finally {
    print('complete');
  }
}

void lesson_throwing_exception() {
  try {
    int age;
    var dogYears = 8;

    if(dogYears != 7) throw Exception('dog years must be 7');

    if(age == null) throw NullThrownError();

    print(age * dogYears);
  }
  on NullThrownError {
    print('The value was null!!!');
  }
  on NoSuchMethodError {
    print('Sorry no such method');
  }
  catch (e) {
    print('Error: ${e.toString()}');
  }
  finally {
    print('complete');
  }
}


void lesson_assignment() {
  int askAge() {
    print('Enter an age');
    return int.parse(stdin.readLineSync(), onError: (String err) {
      print('Not a number');
      return 0;
    });
  }

  try {
    var age = askAge();

    if(age < 18) throw Exception('too young');
    if(age > 99) throw Exception('too old');

    print('You may continue');

  } catch (e) {
    print('Error: ${e.toString()}');
  }
  finally {
    print('good bye');
  }
}
