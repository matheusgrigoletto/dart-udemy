import 'dart:io';
import 'dart:convert';
import 'package:archive/archive.dart';
import 'package:path/path.dart' as p;

void main() {
  //lesson1_gzip();
  //lesson2_gzip_vs_zlib();
  //lesson3_zip();
  lesson4_assignment();
}

void lesson1_gzip() {
  var data = '';
  for(num i = 0; i < 100; i++) {
    data = data + 'Hello world\r\n';
  }

  // Original Data
  List original = utf8.encode(data);

  //Compress data
  List compressed = gzip.encode(original);

  //Decompress
  List decompress = gzip.decode(compressed);

  print('Original ${original.length} bytes');
  print('Compressed ${compressed.length} bytes');
  print('Decompressed ${decompress.length} bytes');

  var decoded = utf8.decode(decompress);
  assert(data == decoded);

  print(decoded);
}

void lesson2_gzip_vs_zlib() {
  String generateData() {
    var data = '';

    for(num i = 0; i < 1000; i++) {
      data = data + 'Hello World\r\n';
    }

    return data;
  }

  int testCompress(var codec) {
    var data = generateData();

    List original = utf8.encode(data);
    List compressed = codec.encode(original);
    List decompressed = codec.decode(compressed);

    print('Testing ${codec.toString()}');
    print('Original ${original.length}');
    print('Compressed ${compressed.length}');
    print('Decompressed ${decompressed.length}');

    print('');

    var decoded = utf8.decode(decompressed);
    assert(data == decoded);

    return compressed.length;
  }

  var myZlib = testCompress(zlib);
  var myGzip = testCompress(gzip);

  print('zlib = $myZlib');
  print('gzip = $myGzip');
}

void lesson3_zip() {
  void zip(List<String> files, String file) {
    var archive = Archive();

    files.forEach((String path){
      var file = File(path);

      var archivefile = ArchiveFile(p.basename(path), file.lengthSync(), file.readAsBytesSync());
      archive.addFile(archivefile);
    });

    var encoder = ZipEncoder();
    var f = File(file);
    f.writeAsBytesSync(encoder.encode(archive));

    print('Compressed');
  }

  void unzip(String zip, String path) {
    var file = File(zip);

    var archive = ZipDecoder().decodeBytes(file.readAsBytesSync());

    archive.forEach((ArchiveFile archivefile) {
      var file = File(path + '/' + archivefile.name);
      file.createSync(recursive: true);
      file.writeAsBytesSync(archivefile.content);
    });

    print('Decompressed');
  }

  var files = <String>[];
  Directory.current.listSync().forEach((FileSystemEntity fse) {
    if (fse.statSync().type == FileSystemEntityType.file) {
      files.add(fse.path);
    }
  });

  var zipfile = '/Users/matheus/Projects/dart/udemy/advanced/test.zip';

  zip(files, zipfile);

  unzip(zipfile, '/Users/matheus/Projects/dart/udemy/advanced/decompressed');
}

void lesson4_assignment() {
  var compressed = Directory.current.path + '/compressed.txt';

  var file = File(compressed);
  file.createSync();
  file.writeAsBytesSync(gzip.encode(utf8.encode('Hello World')));

  print(utf8.decode(gzip.decode(file.readAsBytesSync())));
}