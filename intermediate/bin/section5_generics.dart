import 'package:intermediate/section5_lesson4/cashier.dart';
import 'package:intermediate/section5_lesson4/manager.dart';
import 'package:intermediate/section5_lesson4/payroll.dart';

void main() {
  //lesson1_intro();
  //lesson2_examples();
  //lesson3_generic_class();
  lesson4_assignment();
}

void lesson1_intro() {
  // Simple Example
  void add<T>(T a, T b) {
    // + is not defined for generics so we just use toString
    print(a.toString() + b.toString());
  }

  // More complex
  void addNumbers<T extends num>(T a, T b) {
    print(a + b);
  }

  var numbers = <int>[];
  numbers.addAll([1,2,3,4]);
  print(numbers);

  var strings = <String>[];
  strings.addAll(['a',  'b', 'c']);
  print(strings);

  add<int>(1, 2);
  add<double>(1.0, 2.09);
  add<String>('hello ', 'world');

  addNumbers<int>(1, 2);
  addNumbers<double>(1.0, 2.09);
  //addNumbers<String>('hello ', 'world'); //wont work as its a string
}

void lesson2_examples() {
  T add<T extends num>(T value, List<T> items) {
    var ret = value;

    items.forEach((value) {
      ret = ret + value;
    });

    return ret;
  }

  var values = [1,2,3,4,5];

  print(add(10, values));
}

void lesson3_generic_class() {
  var doubles = Counter<double>();
  doubles.addAll([1.0, 2.2, 3.6]);
  doubles.total();

  var ints = Counter<int>();
  ints.addAll([1, 2, 3]);
  ints.total();
}

void lesson4_assignment() {
  var boss = Manager();
  var jill = Cashier();

  var payroll = Payroll();
  payroll.add(boss);
  payroll.add(jill);

  payroll.print();
}

// -----------------------------------------------------------------------------

class Counter<T extends num> {
  final _items = <T>[];

  void addAll(Iterable<T> iterable) => _items.addAll(iterable);
  void add(T value) => _items.add(value);

  T elementAt(int index) => _items.elementAt(index);

  void total() {
    num value = 0;
    _items.forEach((item){
      value = value + item;
    });

    print(value);
  }
}