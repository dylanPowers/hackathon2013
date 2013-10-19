import 'dart:html';
import 'package:polymer/polymer.dart';

var chatWindow1;
var inputWindow;
var sendButton;

var webSocket;

const String WEB_ADDRESS = "localhost";

void main() {
  
  window.onSubmit.listen(enter);
  
}

void enter(Event e) {
  e.preventDefault();
}