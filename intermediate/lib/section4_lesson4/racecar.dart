import 'car.dart';

class RaceCar extends Car {
  RaceCar() {
    hasHorn = true;
    hasWheels = true;
  }

  //void honk() => print('beep beep');

  @override
  void honk() {
    print('honk in ${toString()}');
    super.honk();
  }
}