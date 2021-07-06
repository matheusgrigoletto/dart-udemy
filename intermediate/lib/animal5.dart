class Animal5 {
  static int _counter = 0;

  Animal5() {
    _counter++;
    print('There are $_counter of us');
  }

  static void speak() {
    print('speaking');
    run();
  }

  static void run() {
    print('running');
  }
}
