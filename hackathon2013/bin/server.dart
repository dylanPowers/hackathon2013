library server;

import 'dart:async';
import 'dart:io';
import 'package:pathos/path.dart' as pathOS;

part 'chat_handler.dart';
part 'file_handler.dart';


void main() {  
  var options = new Options();
  var thisFile = new File(options.script);
  Directory directory = thisFile.directory;
  

  var chatHandler = new ChatHandler();
  var fileHandler = new FileHandler(directory);
  
  HttpServer.bind(InternetAddress.ANY_IP_V4, 4000)
    .then((HttpServer server) {
      print('Listening for connections....');
      var streamControl = new StreamController();
      streamControl.stream.transform(new WebSocketTransformer()).listen(chatHandler.onConnection);
      
      server.listen((HttpRequest request) {
        if (request.uri.path == '/ws') {
          streamControl.add(request);
        } else {
          fileHandler.onRequest(request);
        }
      });
    })
    .catchError((error) {
      print("Error starting the HTTP server: $error");
    });
}