import 'employee.dart';

class Manager implements Employee {
  String name = 'Bob';

  //void test() => print('I am a manager');

  @override
  void test() {
    print('test in the manager class');
    print(super.toString());
  }
}