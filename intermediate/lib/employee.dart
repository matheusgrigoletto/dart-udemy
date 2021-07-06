class Employee {
  String name = '';
  String position = '';

  Employee(String name, String position) {
    this.name = name;
    this.position = position;
  }

  void sayHello() => print('Hello my name is $name and I am a $position');
}
