import 'dart:async';
import 'dart:io';

void main() {
  //lesson1_timers_callbacks();
  //lesson2_futures();
  //lesson3_await();
  lesson4_assignment();
}

void lesson1_timers_callbacks() {
  String getTime() {
    var dt = DateTime.now();
    return dt.toString();
  }

  var counter = 0;

  void timeout(Timer timer) {
    print('Timeout: ${getTime()}');
    counter++;
    if (counter >= 5) {
      timer.cancel();
    }
  }

  var duration = Duration(seconds: 1);
  var timer = Timer.periodic(duration, timeout);
  print('Started: ${getTime()}');
}

void lesson2_futures() {
  var path = Directory.current.path + '/test.txt';
  print('Appending to $path');

  var file = File(path);

  var f = file.open(mode: FileMode.append);

  f.then((RandomAccessFile raf) {
    print('File has been opened!');

    raf.writeString('Hello World').then((value) {
      print('file has been appended! $value');
    }).catchError(() => print('An error occurred')).whenComplete(() => raf.close());
  });

  print('**** The end');
}

void lesson3_await() async {
  Future<File> appendFile() {
    var file = File(Directory.current.path + '/test.txt');
    var now = DateTime.now();
    return file.writeAsString(now.toString() + '\r\n', mode: FileMode.append);
  }

  print('Starting');

  var file = await appendFile();

  print('Appended to file ${file.path}');

  print('**** End');
}

void lesson4_assignment() async {
  Future<File> appendFile() {
    var file = File(Directory.current.path + '/test.txt');
    var dt = DateTime.now();
    return file.writeAsString(dt.toString() + '\r\n', mode: FileMode.append);
  }

  Future<String> readFile() {
    var file = File(Directory.current.path + '/test.txt');
    return file.readAsString();
  }

  print('START ***');
  var file = await appendFile();
  print('Appended to ${file.path}');

  print(await readFile());
  print('*** END');

}