import 'dart:convert';
import 'package:intermediate/imports1.dart' as mycode;
import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path;

void main() {
  //lesson1_imports();
  //lesson2_more_imports();
  lesson3_assignment();
}

void lesson1_imports() {
  mycode.sayHello();

  var myvalue = 'Hello World';
  List ebytes = utf8.encode(myvalue);
  var encoded = base64.encode(ebytes);

  print('Encoded: $encoded');

  List dbytes = base64.decode(encoded);
  var decoded = utf8.decode(dbytes);
  print('Decoded: $decoded');
}

void lesson2_more_imports() {
  var url = 'https://matheusgrigoletto.com';

  http.get(url).then((response) {
    print('Response status code: ${response.statusCode}');
    print('Response body: ${response.body}');
  });
}

void lesson3_assignment() {
  var p = path.join('Directory', 'file.txt');
  print(p);
}
