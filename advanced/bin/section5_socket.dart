import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() {
  //lesson1_tcp_server();
  //lesson2_tcp_client();
  //lesson3_http_get();
  //lesson4_http_post();
  //lesson5_udp_sockets();
  lesson6_assignment();
}

void lesson1_tcp_server() async {
  var serverSocket = await ServerSocket.bind('127.0.0.1', 3000);
  print('Listening');

  await for (var socket in serverSocket) {
    socket.listen((List values) {
      print('${socket.remoteAddress}:${socket.remotePort} = ${utf8.decode(values)}');
    });
  }
}

void lesson2_tcp_client() async {
  var socket = await Socket.connect('127.0.0.1', 3000);
  print('Connected');
  socket.write('Hello World');
  print('Sent, closing');
  await socket.close();
  print('Closed');
  exit(0);
}

void lesson3_http_get() async {
  var url = Uri.http('httpbin.org', '');
  var response = await http.get(url);
  print('Response status ${response.statusCode}');
  print('Response body ${response.body}');
}

void lesson4_http_post() async {
  var url = Uri.http('httpbin.org', '/post');
  var response = await http.post(url, body: 'name=Bryan&color=blue');
  print('Response status ${response.statusCode}');
  print('Response Body ${response.body}');
}

void lesson5_udp_sockets() {
  var data = 'Hello World';

  var dataToSend = utf8.encode(data);
  num port = 3000;

  // Server
  RawDatagramSocket.bind(InternetAddress.loopbackIPv4, port).then((RawDatagramSocket udpSocket){
    udpSocket.listen((RawSocketEvent event) {
      if (event == RawSocketEvent.read) {
        var dg = udpSocket.receive();
        print(utf8.decode(dg.data));
      }
    });

    // client
    udpSocket.send(dataToSend, InternetAddress.loopbackIPv4, port);
    print('Sent!');
  });
}

void lesson6_assignment() async {
  var url = Uri.https('matheusgrigoletto.com', '');

  var response = await http.get(url);

  print('Length: ${response.body.length}');
}