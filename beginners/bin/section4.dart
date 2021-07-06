void main() {
  /// Assert
  lesson_assert();

  /// If else
  lesson_ifelse();

  /// Scope
  lesson_scope();

  /// Switch
  lesson_switch();

  /// Loops
  lesson_loops();

  /// ForEach
  lesson_foreach();

  /// Assignment
  lesson_assignment();
}

void lesson_assert() {
  print('starting');
  int age = 15;
  assert(age == 43);
  print('finished');
}

void lesson_ifelse() {
  int age = 17;

  if(age == 43) print('You are 43 years old');
  if(age != 43) print('You are not 43 years old');

  if(age < 18) {
    print('You are a minor');
    if(age < 13) print('You are not even a teenager');
  }

  if(age > 65) {
    print('You are a senior');
    if(age > 102) print('Yo are lucky to be alive');
  }

  if(age == 21) {
    print('This is your special year');
  } else {
    print('This is just a normal year');
    if(age < 21) {
      print('You are a minor');
    } else {
      print('You are an adult');
    }
  }
}

void lesson_scope() {
  int age = 43;

  if(age == 43) {
    //print('You are 43 and has bills ${hasBills}'); <- it will not work
    print('You are 43');
  } else {
    bool hasBills = true;
    print('You are ${age} and has bills ${hasBills}');
  }
}

void lesson_switch() {
  int age = 21;

  switch(age) {
    case 18:
      print('You are 18, you can vote');
      break;

    case 21:
      print('You are 21, you are an adult');
      break;

    case 65:
      print('You are 65, you can retire');
      break;

    default:
      print('Nothing special about this age');
      break;
  }

  print('Finished');
}

void lesson_loops() {
  int value;
  int init = 1;
  int max = 5;

  value = init;

  do {
    print('Value in do loop is ${value}');
    value++;
  } while(value <= max);

  print('Done with do loop');

  value = init;

  while (value <= max) {
    print('Value in while loop is ${value}');
    value++;
  }

  print('Done with while loop');

  // Infinite loop
  value = init;

  do {
    print('Value = ${value}');
    value++;

    if(value == 3) {
      print('Value is 3');
      continue;
    }

    if(value > 5) {
      print('Value is greater than 5');
      break;
    }

   } while(true);

  print('Finished');
}

void lesson_foreach() {
  List<String> people = ['Bryan', 'Heather', 'Chris'];

  print(people);

  for(int i = 0; i < people.length; i++) {
    print('Person at ${i} is ${people[i]}');
  }

  people.forEach((String person) {
    print(person);
  });
}

void lesson_assignment() {
  int max = 10;
  for(int i = 0; i < max; i++) {
    print(i);
    if(i == 5) print('Half way there');
  }
}