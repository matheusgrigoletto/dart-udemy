import 'dart:io';

void main() {
  lesson_basic();
  lesson_optional_parameters();
  lesson_named_parameters();
  lesson_function_as_objects();
  lesson_anonymous_functions();
  lesson_assignment();
}

void lesson_basic() {
  void test() {
    print('testing');
  }

  void sayHello(String name) {
    print('Hello ${name}');
  }

  int dogYears(int age) {
    return age * 7;
  }

  int squareFeet(int width, int length) {
    return width * length;
  }

  double paintNeeded(int wall1, int wall2, int wall3, int wall4, int ceiling){
    int footage = wall1 + wall2 + wall3 + wall4 + ceiling;
    return footage / 30;
  }

  test();
  sayHello('Bryan');

  print('Your age in dog years is ${dogYears(43)}');

  int wall1 = squareFeet(10,10);
  int wall2 = squareFeet(10,20);
  int wall3 = squareFeet(10,10);
  int wall4 = squareFeet(10,20);
  int ceiling = squareFeet(20,10);

  double paint = paintNeeded(wall1, wall2, wall3, wall4, ceiling);
  print('You ${paint} gallons of paint');
}

void lesson_optional_parameters() {
  void sayHello([String name = '']) {
    if(name.isNotEmpty) name = name.padLeft(name.length + 1);
    print('Hello ${name}');
  }

  void download(String file, [bool open = false]) {
    print('Downloading ${file}');
    if(open) print('Opening ${file}');
  }

  sayHello();

  download('myfile.txt');
  download('myfile2.txt', true);
}

void lesson_named_parameters() {
  int squartFeet({ int width, int length }) {
    return width * length;
  }

  void download(String file, { int port = 80 }) {
    print('Download ${file} on port ${port}');
  }

  int footage = squartFeet(length: 10, width: 5);
  print('Footage is ${footage}');
  download('myfile');
  download('myfile2', port: 90);
}

void lesson_function_as_objects() {
  int calcYears({ int age, int multiplier }) {
    return age * multiplier;
  }

  int age = 43;
  var dogyears = calcYears;
  var catyears = calcYears;

  print('Your age in dog years is ${dogyears(age: 43, multiplier: 7)}');
  print('Your age in cat years is ${catyears(age: 43, multiplier: 12)}');
}

void lesson_anonymous_functions() {
  (){print('hello');};
  (){print('world');}();

  List<String> people = ['Bryan', 'Heather', 'Chris'];

  people.forEach(print);

  print('----------');
  people.forEach((String name){
    print(name);
  });

  print('----------');

  people.where((String name){
    switch(name){
      case 'Chris':
        return true;
      case 'Bryan':
        return false;
      case 'Heather':
        return true;
      default:
        return false;
    }
  }).forEach(print);
}

void lesson_assignment() {
  int askUser() {
    print('Please enter a number');
    return int.parse(stdin.readLineSync(), onError: (String err) {
      print('Error entering a number ${err}');
      return 0;
    });
  }

  void displayResult(int max) {
    double half = max / 2;

    for(int i = 1; i < max + 1; i++) {
      print(i);
      if(i == half.round()) print('Half way there');
    }
  }

  displayResult(askUser());
}
