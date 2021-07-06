import 'dart:io';

void main() {
  //lesson1_sync_async();
  //lesson2_system_temp_dir();
  //lesson3_list_items_dir();
  //lesson4_access_files();
  lesson5_assignment();
}

void lesson1_sync_async() {
  var path = '/';
  var dir = Directory(path);

  if (dir.existsSync()) {
    print('exists: $dir');
  } else {
    print('not found');
  }
}

void lesson2_system_temp_dir() {
  var dir = Directory.systemTemp.createTempSync();

  print(dir.path);

  if (dir.existsSync()) {
    print('Removing ${dir.path}');
    dir.deleteSync();
  } else {
    print('Could not find ${dir.path}');
  }
}

void lesson3_list_items_dir() {
  var dir = Directory.current;
  print(dir.path);

  var list = dir.listSync(recursive: true);
  print('Entries in list: ${list.length}');

  list.forEach((FileSystemEntity value){
    var stat = value.statSync();
    print('Path: ${value.path}');
    print('Type: ${stat.type}');
    print('Changed: ${stat.changed}');
    print('Modified: ${stat.modified}');
    print('Accessed: ${stat.accessed}');
    print('Mode: ${stat.mode}');
    print('Size: ${stat.size}');
    print('');
  });
}

void lesson4_access_files() {
  void writeFile(File file) {
    // Append, Write
    var raf = file.openSync(mode: FileMode.write);
    raf.writeStringSync('Hello World!\r\nHow are you today?');
    raf.flushSync();
    raf.closeSync();
  }

  void readFile(File file) {
    if (!file.existsSync()) {
      print('file not found!');
      return;
    }

    print('Reading string...');
    print(file.readAsStringSync());

    print('Reading bytes....');
    List values = file.readAsBytesSync();
    values.forEach((value) => print(value));
  }

  var dir = Directory.current;
  print(dir.path);

  var file = File(dir.path + '/myfile.txt');

  print('Creating ${file.path}');

  writeFile(file);
  readFile(file);

  //print('Deleting ${file.path}');
  //file.deleteSync();
}

void lesson5_assignment() {
  var dir = Directory.current;
  var file = File(dir.path + '/myfile.txt');

  file.writeAsStringSync('Hello World');
  print(file.readAsStringSync());

  file.deleteSync();
}
