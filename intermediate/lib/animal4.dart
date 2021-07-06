class Animal4 {
  String _name;
  int _age = 0;

  Animal4(String name, int age) {
    _name = name;
    _age = age * 7;
  }

  String get name => _name;
  set name(String value) => _name = value.toUpperCase();

  int get age => _age;
  set age(int value) => _age = value * 7;
}
