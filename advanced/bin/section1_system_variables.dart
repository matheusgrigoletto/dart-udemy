import 'dart:io';
import 'dart:convert';

void main() {
  //lesson1_os_variables();
  //lesson2_running_processes();
  lesson3_communicating_with_processes();
  //lesson4_assignment();
}

void lesson1_os_variables() {
  print('OS: ${Platform.operatingSystem} ${Platform.version}');

  if (Platform.isLinux) {
    print('Run linux code');
  } else {
    print('run normal code');
  }

  print('Path: ${Platform.script.path}');
  print('dart: ${Platform.executable}');

  print('Env:');
  Platform.environment.keys.forEach((key) {
    print('$key: ${Platform.environment[key]}');
  });
}

void lesson2_running_processes() {
  //List all files in a directory - Linux specific
  Process.run('ls', ['-l', '-A']).then((ProcessResult results) { //notepad C:\windows\System32\notepad.exe
    print(results.stdout);
    print('Exit code: ${results.exitCode}'); // 0 is good
  });
}

void lesson3_communicating_with_processes() {
  //Linux Specific
  Process.start('cat', []).then((Process process) { //console DIR
    //Older Dart
    //process.stdout.transform(UTF8.decoder).listen((data) {print(data);});

    //Newer dart
    process.stdout.transform(utf8.decoder).listen((data) {print(data);});

    //Send to the process
    process.stdin.writeln('Hello World');

    //Stop the process
    Process.killPid(process.pid);

    //get the exit code
    process.exitCode.then((int code) {
      print('Exit code is: $code');
      //exit
      exit(0);
    });
  });
}

void lesson4_assignment() {
  if (Platform.isWindows) print('This is Windows');
  if (Platform.isLinux) print('This is Linux');
  if (Platform.isMacOS) print('This is Mac');
  if (Platform.isAndroid) print('This is Android');
  if (Platform.isIOS) print('This is IOS');
  if (Platform.isFuchsia) print('This is Fuchsia');

  print(Platform.environment['PATH']);
}