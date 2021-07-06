import 'dart:io';
import 'dart:collection'; // precisa import para Queue

enum colors {red, green, blue}

void main() {
  /// Enum
  print(colors.values);
  print(colors.red);

  // ---------------------------------------------------------------------------
  /// List
  List test = [1,2,3,4];
  print('Length = ${test.length}'); // how many
  print('First item is ${test[0]}'); // zero based index

  //print(test.elementAt(1321)); //Error out of range

  List things = [];
  things.add(1);
  things.add('cats');
  things.add(true);
  print(things);

  List<int> numbers = [];
  numbers.add(1);
  numbers.add(2);
  numbers.add(3);
  //numbers.add('cats'); - ERROR !

  // ---------------------------------------------------------------------------
  /// Set

  //Set = unordered, do not contain duplicates

  Set<int> numbers2 = new Set<int>();
  numbers2.add(1);
  numbers2.add(2);
  numbers2.add(3);
  numbers2.add(1); //added twice
  print(numbers2);

  // ---------------------------------------------------------------------------
  /// Queue
  // Ordered, no index, add and remove from the start and end

  Queue items = new Queue();
  items.add(1);
  items.add(3);
  items.add(2);
  items.removeFirst();
  items.removeLast();
  print(items);
  // ---------------------------------------------------------------------------
  /// Map

  //Map = key value pair

  //Map people = {'dad' : 'Bryan', 'son' : 'Chris', 'daughter' : 'Heather'};

  Map<String, String> people = new Map<String, String>();
  people.putIfAbsent('dad', () => 'Bryan');
  //people.putIfAbsent('son', () => 'Bryan');
  //people.putIfAbsent('daughter', () => 'Bryan');

  print(people);
  print('Keys are ${people.keys}');
  print('Values are ${people.values}');
  print('Dad is ${people['dad']}');
  print('Son is ${people['son']}');

  // ---------------------------------------------------------------------------
  /// Assignment

  List peoples = ['Bryan', 'Heather', 'Chris'];
  print('Enter the index');
  int indexs = int.parse(stdin.readLineSync());
  print(peoples.elementAt(indexs));
}
